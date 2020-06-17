import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:itup/data/response/earning_data.dart';
import 'package:itup/data/response/order_fetch_response.dart';

class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class UnHomeState extends HomeState {}

class EarningLoadingState extends HomeState {}

class EarningHideLoadingState extends HomeState {}

class OrderLoadingState extends HomeState {}

class OrderHideLoadingState extends HomeState {}

class EarningSuccessState extends HomeState {
  final EarningDataResponse earningDataResponse;
  EarningSuccessState({@required this.earningDataResponse});
  @override
  List<Object> get props => [earningDataResponse];
}

class OrderSuccessState extends HomeState {
  final OrderFetchResponse orderFetchResponse;
  OrderSuccessState({@required this.orderFetchResponse});
  @override
  List<Object> get props => [orderFetchResponse];
}

class EarningFailureState extends HomeState {
  final String errorMessage;
  EarningFailureState({@required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class OrderFailureState extends HomeState {
  final String errorMessage;
  OrderFailureState({@required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
