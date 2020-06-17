// import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itup/data/response/earning_data.dart';
import 'package:itup/data/response/order_fetch_response.dart';
import 'package:itup/events/home_event.dart';
import 'package:itup/repository/home_repository.dart';
import 'package:itup/states/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepository homeRepository;
  HomeBloc({@required this.homeRepository});
  @override
  HomeState get initialState => UnHomeState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetEarningDataEvent) {
      try {
        yield EarningLoadingState();

        EarningDataResponse response = await homeRepository.getEarningData();
        if (response != null) {
          yield EarningHideLoadingState();
          yield EarningSuccessState(
            earningDataResponse: response,
          );
        } else {
          yield EarningHideLoadingState();
          yield EarningFailureState(
              errorMessage: "Something went wrong.\nPlease try again");
        }
      } on SocketException catch (exception) {
        debugPrint('Exception : ${exception.toString()}');
        yield EarningHideLoadingState();
        yield EarningFailureState(
            errorMessage: "No internet.\nPlease try again");
      } catch (_, stackTrace) {
        print('$_ $stackTrace');
        yield EarningHideLoadingState();
        yield EarningFailureState(
            errorMessage: "Something went wrong.\nPlease try again");
      }
    }

    if (event is GetOrderDataEvent) {
      try {
        yield OrderLoadingState();

        OrderFetchResponse response = await homeRepository.getOrderData();
        if (response != null) {
          yield OrderHideLoadingState();
          yield OrderSuccessState(
            orderFetchResponse: response,
          );
        } else {
          yield OrderHideLoadingState();
          yield OrderFailureState(
              errorMessage: "Something went wrong.\nPlease try again");
        }
      } on SocketException catch (exception) {
        debugPrint('Exception : ${exception.toString()}');
        yield OrderHideLoadingState();
        yield OrderFailureState(errorMessage: "No internet.\nPlease try again");
      } catch (_, stackTrace) {
        print('$_ $stackTrace');
        yield OrderHideLoadingState();
        yield OrderFailureState(
            errorMessage: "Something went wrong.\nPlease try again");
      }
    }
  }
}
