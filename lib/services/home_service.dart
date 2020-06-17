import 'package:flutter/material.dart';
import 'package:itup/data/response/earning_data.dart';
import 'package:itup/data/response/order_fetch_response.dart';
import 'package:itup/rest/network_service_response.dart';
import 'package:itup/rest/rest_client.dart';

abstract class IHomeService {
  Future<EarningDataResponse> getEarningData();
  Future<OrderFetchResponse> getOrderData();
}

class RealHomeService implements IHomeService {
  RestClient restClient;
  RealHomeService({@required this.restClient});

  @override
  Future<EarningDataResponse> getEarningData() async {
    MappedNetworkServiceResponse<
        EarningDataResponse> result = await restClient.getAsync<
            EarningDataResponse>(
        "https://d3rrgc1io7q2aj.cloudfront.net/qa/api/v2/vapp/vendor/5/report/sale?date=2020-06-15",
        customHeaders: true);

    if (result.mappedResult != null) {
      EarningDataResponse response =
          EarningDataResponse.fromJson(result.mappedResult);
      return response;
    }
    throw Exception(result.networkServiceResponse.message);
  }

  @override
  Future<OrderFetchResponse> getOrderData() async {
    MappedNetworkServiceResponse<
        OrderFetchResponse> result = await restClient.getAsync<
            OrderFetchResponse>(
        "https://d3rrgc1io7q2aj.cloudfront.net/qa/api/v2/vapp/order?_pageNo=1&_pageSize=10&orderMode=ALL_CURRENT_ORDER",
        customHeaders: true);

    if (result.mappedResult != null) {
      OrderFetchResponse response =
          OrderFetchResponse.fromJson(result.mappedResult);
      return response;
    }
    throw Exception(result.networkServiceResponse.message);
  }
}
