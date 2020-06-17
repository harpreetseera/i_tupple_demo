import 'package:flutter/material.dart';
import 'package:itup/data/response/earning_data.dart';
import 'package:itup/data/response/order_fetch_response.dart';
import 'package:itup/services/home_service.dart';

class HomeRepository extends IHomeService {
  IHomeService iHomeService;
  HomeRepository({@required this.iHomeService});

  @override
  Future<EarningDataResponse> getEarningData() async {
    return await iHomeService.getEarningData();
  }

  @override
  Future<OrderFetchResponse> getOrderData() async {
    return await iHomeService.getOrderData();
  }
}
