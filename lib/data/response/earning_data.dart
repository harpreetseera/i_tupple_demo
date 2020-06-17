class EarningDataResponse {
  EarningDataResponse({
    this.data,
  });

  Data data;

  factory EarningDataResponse.fromJson(Map<String, dynamic> json) =>
      EarningDataResponse(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.onlineSale,
    this.cashSale,
    this.khataSale,
  });

  double onlineSale;
  double cashSale;
  double khataSale;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        onlineSale: json["onlineSale"],
        cashSale: json["cashSale"],
        khataSale: json["khataSale"],
      );

  Map<String, dynamic> toJson() => {
        "onlineSale": onlineSale,
        "cashSale": cashSale,
        "khataSale": khataSale,
      };
}
