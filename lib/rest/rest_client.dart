import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:itup/rest/api_response.dart';
import 'package:itup/rest/network_service_response.dart';

class RestClient {
  Map<String, String> authHeaders;
  Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };

  RestClient() {
    authHeaders = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      "yelo-auth-token":
          "SllzS3VkNVg3UUVMR0JWVVVoWk9NM3BVaCthWkxYQjdpVCtHdkNnRUtTQT0="
    };
  }

  Future<MappedNetworkServiceResponse<T>> getAsync<T>(String resourcePath,
      {bool customHeaders}) async {
    var response = await http.get(
      resourcePath,
      headers: customHeaders == true ? authHeaders : headers,
    );
    return await processResponse<T>(response);
  }

  Future<MappedNetworkServiceResponse<T>> postAsync<T>(
      String resourcePath, dynamic data,
      {bool customHeaders}) async {
    var content = json.encoder.convert(data);
    // print(content);
    var response = await http.post(resourcePath,
        body: content, headers: customHeaders == true ? authHeaders : headers);
    return await processResponse<T>(response);
  }

  Future<MappedNetworkServiceResponse<T>> processResponse<T>(
      http.Response response) async {
    if (!((response.statusCode < HttpStatus.ok) ||
        (response.statusCode >= HttpStatus.multipleChoices) ||
        (response.body == null))) {
      var resultClass = await compute(jsonParserIsolate, response.body);
      APIResponse mappedResponse = APIResponse.fromJson(resultClass);
      if (mappedResponse.isSuccess == null || mappedResponse.isSuccess) {
        return new MappedNetworkServiceResponse<T>(
            mappedResult: resultClass,
            networkServiceResponse:
                new NetworkServiceResponse<T>(success: true));
      } else {
        return new MappedNetworkServiceResponse<T>(
            networkServiceResponse: new NetworkServiceResponse<T>(
          success: false,
          message: "${mappedResponse.code}: ${mappedResponse.message}",
        ));
      }
    } else {
      var errorResponse = response.body;
      try {
        return new MappedNetworkServiceResponse<T>(
            networkServiceResponse: new NetworkServiceResponse<T>(
          success: false,
          message: "${response.statusCode}: ${errorResponse.toString()}",
        ));
      } catch (e) {
        return new MappedNetworkServiceResponse<T>(
            networkServiceResponse: new NetworkServiceResponse<T>(
          success: false,
          message: "${response.statusCode}: ${errorResponse.toString()}",
        ));
      }
    }
  }

  static Map<String, dynamic> jsonParserIsolate(String res) {
    return jsonDecode(res);
  }
}
