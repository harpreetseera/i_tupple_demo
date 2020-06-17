import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
// import 'package:ohiya/data/model/request/wifi_credential_request.dart';

class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetEarningDataEvent extends HomeEvent {}

class GetOrderDataEvent extends HomeEvent {}
