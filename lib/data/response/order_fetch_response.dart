
class OrderFetchResponse {
    OrderFetchResponse({
        this.message,
        this.data,
    });

    String message;
    Data data;

    factory OrderFetchResponse.fromJson(Map<String, dynamic> json) => OrderFetchResponse(
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.orders,
        this.totalAmount,
        this.totalOrder,
    });

    List<Order> orders;
    double totalAmount;
    int totalOrder;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
        totalAmount: json["totalAmount"],
        totalOrder: json["totalOrder"],
    );

    Map<String, dynamic> toJson() => {
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
        "totalAmount": totalAmount,
        "totalOrder": totalOrder,
    };
}

class Order {
    Order({
        this.createdOn,
        this.modifiedOn,
        this.createdBy,
        this.modifiedBy,
        this.id,
        this.customer,
        this.vendor,
        this.products,
        this.vendorId,
        this.customerId,
        this.orderType,
        this.payment,
        this.amount,
        this.khata,
        this.mode,
        this.status,
        this.time,
        this.pack,
        this.testOrder,
        this.scheduled,
        this.fulfillmentDate,
        this.paymentSlipUrl,
        this.delayTime,
    });

    DateTime createdOn;
    DateTime modifiedOn;
    int createdBy;
    int modifiedBy;
    int id;
    Customer customer;
    Vendor vendor;
    List<Product> products;
    int vendorId;
    int customerId;
    OrderType orderType;
    Payment payment;
    Amount amount;
    bool khata;
    OrderMode mode;
    Status status;
    Time time;
    bool pack;
    bool testOrder;
    bool scheduled;
    DateTime fulfillmentDate;
    String paymentSlipUrl;
    int delayTime;

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        createdOn: DateTime.parse(json["createdOn"]),
        modifiedOn: DateTime.parse(json["modifiedOn"]),
        createdBy: json["createdBy"],
        modifiedBy: json["modifiedBy"],
        id: json["id"],
        customer: Customer.fromJson(json["customer"]),
        vendor: Vendor.fromJson(json["vendor"]),
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        vendorId: json["vendorId"],
        customerId: json["customerId"],
        orderType: orderTypeValues.map[json["orderType"]],
        payment: Payment.fromJson(json["payment"]),
        amount: Amount.fromJson(json["amount"]),
        khata: json["khata"],
        mode: orderModeValues.map[json["mode"]],
        status: statusValues.map[json["status"]],
        time: Time.fromJson(json["time"]),
        pack: json["pack"],
        testOrder: json["testOrder"],
        scheduled: json["scheduled"],
        fulfillmentDate: DateTime.parse(json["fulfillmentDate"]),
        paymentSlipUrl: json["paymentSlipUrl"] == null ? null : json["paymentSlipUrl"],
        delayTime: json["delayTime"] == null ? null : json["delayTime"],
    );

    Map<String, dynamic> toJson() => {
        "createdOn": createdOn.toIso8601String(),
        "modifiedOn": modifiedOn.toIso8601String(),
        "createdBy": createdBy,
        "modifiedBy": modifiedBy,
        "id": id,
        "customer": customer.toJson(),
        "vendor": vendor.toJson(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "vendorId": vendorId,
        "customerId": customerId,
        "orderType": orderTypeValues.reverse[orderType],
        "payment": payment.toJson(),
        "amount": amount.toJson(),
        "khata": khata,
        "mode": orderModeValues.reverse[mode],
        "status": statusValues.reverse[status],
        "time": time.toJson(),
        "pack": pack,
        "testOrder": testOrder,
        "scheduled": scheduled,
        "fulfillmentDate": fulfillmentDate.toIso8601String(),
        "paymentSlipUrl": paymentSlipUrl == null ? null : paymentSlipUrl,
        "delayTime": delayTime == null ? null : delayTime,
    };
}

class Amount {
    Amount({
        this.sellingPrice,
        this.price,
        this.deliveryFee,
    });

    double sellingPrice;
    double price;
    double deliveryFee;

    factory Amount.fromJson(Map<String, dynamic> json) => Amount(
        sellingPrice: json["sellingPrice"],
        price: json["price"],
        deliveryFee: json["deliveryFee"] == null ? null : json["deliveryFee"],
    );

    Map<String, dynamic> toJson() => {
        "sellingPrice": sellingPrice,
        "price": price,
        "deliveryFee": deliveryFee == null ? null : deliveryFee,
    };
}

class Customer {
    Customer({
        this.id,
        this.name,
        this.mobile,
        this.countryCode,
        this.testUser,
        this.address,
        this.nickName,
    });

    int id;
    String name;
    String mobile;
    String countryCode;
    bool testUser;
    CustomerAddress address;
    NickName nickName;

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        name: json["name"],
        mobile: json["mobile"],
        countryCode: json["countryCode"] == null ? null : json["countryCode"],
        testUser: json["testUser"] == null ? null : json["testUser"],
        address: json["address"] == null ? null : CustomerAddress.fromJson(json["address"]),
        nickName: json["nickName"] == null ? null : nickNameValues.map[json["nickName"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobile": mobile,
        "countryCode": countryCode == null ? null : countryCode,
        "testUser": testUser == null ? null : testUser,
        "address": address == null ? null : address.toJson(),
        "nickName": nickName == null ? null : nickNameValues.reverse[nickName],
    };
}

class CustomerAddress {
    CustomerAddress({
        this.saveAs,
        this.landmark,
        this.address1,
        this.address2,
        this.pincode,
        this.city,
        this.uuid,
    });

    SaveAs saveAs;
    String landmark;
    String address1;
    String address2;
    String pincode;
    String city;
    String uuid;

    factory CustomerAddress.fromJson(Map<String, dynamic> json) => CustomerAddress(
        saveAs: saveAsValues.map[json["saveAs"]],
        landmark: json["landmark"],
        address1: json["address1"],
        address2: json["address2"],
        pincode: json["pincode"],
        city: json["city"],
        uuid: json["uuid"] == null ? null : json["uuid"],
    );

    Map<String, dynamic> toJson() => {
        "saveAs": saveAsValues.reverse[saveAs],
        "landmark": landmark,
        "address1": address1,
        "address2": address2,
        "pincode": pincode,
        "city": city,
        "uuid": uuid == null ? null : uuid,
    };
}

enum SaveAs { HOME }

final saveAsValues = EnumValues({
    "HOME": SaveAs.HOME
});

enum NickName { DB, NIKI, NIT }

final nickNameValues = EnumValues({
    "Db": NickName.DB,
    "Niki": NickName.NIKI,
    "Nit": NickName.NIT
});

enum OrderMode { PICK_UP, DELIVERY }

final orderModeValues = EnumValues({
    "DELIVERY": OrderMode.DELIVERY,
    "PICK_UP": OrderMode.PICK_UP
});

enum OrderType { CHAT, CATALOG }

final orderTypeValues = EnumValues({
    "CATALOG": OrderType.CATALOG,
    "CHAT": OrderType.CHAT
});

class Payment {
    Payment({
        this.mode,
        this.amount,
        this.paid,
        this.time,
    });

    PaymentMode mode;
    double amount;
    bool paid;
    DateTime time;

    factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        mode: paymentModeValues.map[json["mode"]],
        amount: json["amount"],
        paid: json["paid"],
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
    );

    Map<String, dynamic> toJson() => {
        "mode": paymentModeValues.reverse[mode],
        "amount": amount,
        "paid": paid,
        "time": time == null ? null : time.toIso8601String(),
    };
}

enum PaymentMode { CASH, KHATA, ONLINE }

final paymentModeValues = EnumValues({
    "CASH": PaymentMode.CASH,
    "KHATA": PaymentMode.KHATA,
    "ONLINE": PaymentMode.ONLINE
});

class Product {
    Product({
        this.id,
        this.name,
        this.description,
        this.image,
        this.veg,
        this.units,
        this.category,
    });

    int id;
    String name;
    String description;
    String image;
    bool veg;
    List<Unit> units;
    CategoryClass category;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        veg: json["veg"],
        units: List<Unit>.from(json["units"].map((x) => Unit.fromJson(x))),
        category: CategoryClass.fromJson(json["category"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "veg": veg,
        "units": List<dynamic>.from(units.map((x) => x.toJson())),
        "category": category.toJson(),
    };
}

class CategoryClass {
    CategoryClass({
        this.name,
    });

    CategoryName name;

    factory CategoryClass.fromJson(Map<String, dynamic> json) => CategoryClass(
        name: categoryNameValues.map[json["name"]],
    );

    Map<String, dynamic> toJson() => {
        "name": categoryNameValues.reverse[name],
    };
}

enum CategoryName { MILK_SHAKES, BURGER_SECTION, CLASSIC_DRINK, SUMMER_DRINKS }

final categoryNameValues = EnumValues({
    "BURGER SECTION": CategoryName.BURGER_SECTION,
    "CLASSIC DRINK": CategoryName.CLASSIC_DRINK,
    "MILK SHAKES": CategoryName.MILK_SHAKES,
    "SUMMER DRINKS": CategoryName.SUMMER_DRINKS
});

class Unit {
    Unit({
        this.type,
        this.unit,
        this.value,
        this.price,
        this.quantity,
        this.happyHourPrice,
    });

    UnitEnum type;
    UnitEnum unit;
    double value;
    double price;
    int quantity;
    double happyHourPrice;

    factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        type: unitEnumValues.map[json["type"]],
        unit: unitEnumValues.map[json["unit"]],
        value: json["value"],
        price: json["price"],
        quantity: json["quantity"],
        happyHourPrice: json["happyHourPrice"] == null ? null : json["happyHourPrice"],
    );

    Map<String, dynamic> toJson() => {
        "type": unitEnumValues.reverse[type],
        "unit": unitEnumValues.reverse[unit],
        "value": value,
        "price": price,
        "quantity": quantity,
        "happyHourPrice": happyHourPrice == null ? null : happyHourPrice,
    };
}

enum UnitEnum { GLASS, PIECE, CUP }

final unitEnumValues = EnumValues({
    "CUP": UnitEnum.CUP,
    "GLASS": UnitEnum.GLASS,
    "PIECE": UnitEnum.PIECE
});

enum Status { ACCEPTED, READY, PICKED_UP }

final statusValues = EnumValues({
    "ACCEPTED": Status.ACCEPTED,
    "PICKED_UP": Status.PICKED_UP,
    "READY": Status.READY
});

class Time {
    Time({
        this.estimatePreparationTime,
        this.actualPreparationTime,
        this.acceptTime,
        this.actualDeliverTime,
        this.estimateDeliveryTime,
    });

    DateTime estimatePreparationTime;
    DateTime actualPreparationTime;
    DateTime acceptTime;
    DateTime actualDeliverTime;
    DateTime estimateDeliveryTime;

    factory Time.fromJson(Map<String, dynamic> json) => Time(
        estimatePreparationTime: DateTime.parse(json["estimatePreparationTime"]),
        actualPreparationTime: json["actualPreparationTime"] == null ? null : DateTime.parse(json["actualPreparationTime"]),
        acceptTime: json["acceptTime"] == null ? null : DateTime.parse(json["acceptTime"]),
        actualDeliverTime: json["actualDeliverTime"] == null ? null : DateTime.parse(json["actualDeliverTime"]),
        estimateDeliveryTime: json["estimateDeliveryTime"] == null ? null : DateTime.parse(json["estimateDeliveryTime"]),
    );

    Map<String, dynamic> toJson() => {
        "estimatePreparationTime": estimatePreparationTime.toIso8601String(),
        "actualPreparationTime": actualPreparationTime == null ? null : actualPreparationTime.toIso8601String(),
        "acceptTime": acceptTime == null ? null : acceptTime.toIso8601String(),
        "actualDeliverTime": actualDeliverTime == null ? null : actualDeliverTime.toIso8601String(),
        "estimateDeliveryTime": estimateDeliveryTime == null ? null : estimateDeliveryTime.toIso8601String(),
    };
}

class Vendor {
    Vendor({
        this.id,
        this.name,
        this.mobile,
        this.businessName,
        this.businessImage,
        this.businessImageUrl,
        this.category,
        this.address,
        this.miniMarket,
        this.deliveryConfig,
        this.delivery,
        this.testUser,
    });

    int id;
    VendorName name;
    String mobile;
    BusinessName businessName;
    String businessImage;
    String businessImageUrl;
    CategoryEnum category;
    VendorAddress address;
    MiniMarket miniMarket;
    Delivery deliveryConfig;
    Delivery delivery;
    bool testUser;

    factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        id: json["id"],
        name: vendorNameValues.map[json["name"]],
        mobile: json["mobile"],
        businessName: businessNameValues.map[json["businessName"]],
        businessImage: json["businessImage"],
        businessImageUrl: json["businessImageUrl"] == null ? null : json["businessImageUrl"],
        category: categoryEnumValues.map[json["category"]],
        address: VendorAddress.fromJson(json["address"]),
        miniMarket: MiniMarket.fromJson(json["miniMarket"]),
        deliveryConfig: Delivery.fromJson(json["deliveryConfig"]),
        delivery: json["delivery"] == null ? null : Delivery.fromJson(json["delivery"]),
        testUser: json["testUser"] == null ? null : json["testUser"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": vendorNameValues.reverse[name],
        "mobile": mobile,
        "businessName": businessNameValues.reverse[businessName],
        "businessImage": businessImage,
        "businessImageUrl": businessImageUrl == null ? null : businessImageUrl,
        "category": categoryEnumValues.reverse[category],
        "address": address.toJson(),
        "miniMarket": miniMarket.toJson(),
        "deliveryConfig": deliveryConfig.toJson(),
        "delivery": delivery == null ? null : delivery.toJson(),
        "testUser": testUser == null ? null : testUser,
    };
}

class VendorAddress {
    VendorAddress({
        this.address1,
        this.address2,
        this.city,
        this.state,
        this.country,
        this.pincode,
        this.landmark,
        this.latitude,
        this.longitude,
        this.distance,
        this.location,
    });

    PurpleAddress1 address1;
    NameEnum address2;
    City city;
    State state;
    Country country;
    String pincode;
    Landmark landmark;
    double latitude;
    double longitude;
    dynamic distance;
    Location location;

    factory VendorAddress.fromJson(Map<String, dynamic> json) => VendorAddress(
        address1: purpleAddress1Values.map[json["address1"]],
        address2: nameEnumValues.map[json["address2"]],
        city: cityValues.map[json["city"]],
        state: stateValues.map[json["state"]],
        country: countryValues.map[json["country"]],
        pincode: json["pincode"],
        landmark: landmarkValues.map[json["landmark"]],
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
        distance: json["distance"],
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
    );

    Map<String, dynamic> toJson() => {
        "address1": purpleAddress1Values.reverse[address1],
        "address2": nameEnumValues.reverse[address2],
        "city": cityValues.reverse[city],
        "state": stateValues.reverse[state],
        "country": countryValues.reverse[country],
        "pincode": pincode,
        "landmark": landmarkValues.reverse[landmark],
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "distance": distance,
        "location": location == null ? null : location.toJson(),
    };
}

enum PurpleAddress1 { SMOKING_ZONE_BACKYARD_OF_TOWER_B }

final purpleAddress1Values = EnumValues({
    "Smoking zone, Backyard of Tower B,": PurpleAddress1.SMOKING_ZONE_BACKYARD_OF_TOWER_B
});

enum NameEnum { UNITECH_CYBER_PARK, UNITECH_CYBER_PARK1 }

final nameEnumValues = EnumValues({
    "Unitech Cyber Park": NameEnum.UNITECH_CYBER_PARK,
    "Unitech Cyber Park1": NameEnum.UNITECH_CYBER_PARK1
});

enum City { GURGAON }

final cityValues = EnumValues({
    "GURGAON": City.GURGAON
});

enum Country { INDIA }

final countryValues = EnumValues({
    "INDIA": Country.INDIA
});

enum Landmark { CYBER_PARK }

final landmarkValues = EnumValues({
    "Cyber park": Landmark.CYBER_PARK
});

class Location {
    Location({
        this.type,
        this.coordinates,
    });

    LocationType type;
    List<double> coordinates;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        type: locationTypeValues.map[json["type"]],
        coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "type": locationTypeValues.reverse[type],
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
    };
}

enum LocationType { POINT }

final locationTypeValues = EnumValues({
    "Point": LocationType.POINT
});

enum State { HARYANA }

final stateValues = EnumValues({
    "HARYANA": State.HARYANA
});

enum BusinessName { CAFE_JACK_BROTHERS }

final businessNameValues = EnumValues({
    "Cafe Jack Brothers ": BusinessName.CAFE_JACK_BROTHERS
});

enum CategoryEnum { RESTAURANTS }

final categoryEnumValues = EnumValues({
    "RESTAURANTS": CategoryEnum.RESTAURANTS
});

class Delivery {
    Delivery({
        this.maxDistance,
        this.minAmount,
        this.charges,
        this.deliveryTime,
    });

    int maxDistance;
    int minAmount;
    List<Charge> charges;
    int deliveryTime;

    factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
        maxDistance: json["maxDistance"],
        minAmount: json["minAmount"],
        charges: List<Charge>.from(json["charges"].map((x) => Charge.fromJson(x))),
        deliveryTime: json["deliveryTime"] == null ? null : json["deliveryTime"],
    );

    Map<String, dynamic> toJson() => {
        "maxDistance": maxDistance,
        "minAmount": minAmount,
        "charges": List<dynamic>.from(charges.map((x) => x.toJson())),
        "deliveryTime": deliveryTime == null ? null : deliveryTime,
    };
}

class Charge {
    Charge({
        this.amountUpto,
        this.deliveryCharge,
    });

    int amountUpto;
    int deliveryCharge;

    factory Charge.fromJson(Map<String, dynamic> json) => Charge(
        amountUpto: json["amountUpto"],
        deliveryCharge: json["deliveryCharge"],
    );

    Map<String, dynamic> toJson() => {
        "amountUpto": amountUpto,
        "deliveryCharge": deliveryCharge,
    };
}

class MiniMarket {
    MiniMarket({
        this.id,
        this.name,
        this.address,
        this.active,
        this.alias,
    });

    int id;
    NameEnum name;
    MiniMarketAddress address;
    bool active;
    List<String> alias;

    factory MiniMarket.fromJson(Map<String, dynamic> json) => MiniMarket(
        id: json["id"],
        name: nameEnumValues.map[json["name"]],
        address: MiniMarketAddress.fromJson(json["address"]),
        active: json["active"],
        alias: List<String>.from(json["alias"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameEnumValues.reverse[name],
        "address": address.toJson(),
        "active": active,
        "alias": List<dynamic>.from(alias.map((x) => x)),
    };
}

class MiniMarketAddress {
    MiniMarketAddress({
        this.address1,
        this.address2,
        this.pincode,
        this.city,
        this.state,
        this.country,
        this.latLong,
    });

    FluffyAddress1 address1;
    PurpleAddress2 address2;
    String pincode;
    City city;
    State state;
    Country country;
    LatLong latLong;

    factory MiniMarketAddress.fromJson(Map<String, dynamic> json) => MiniMarketAddress(
        address1: fluffyAddress1Values.map[json["address1"]],
        address2: purpleAddress2Values.map[json["address2"]],
        pincode: json["pincode"],
        city: cityValues.map[json["city"]],
        state: stateValues.map[json["state"]],
        country: countryValues.map[json["country"]],
        latLong: latLongValues.map[json["latLong"]],
    );

    Map<String, dynamic> toJson() => {
        "address1": fluffyAddress1Values.reverse[address1],
        "address2": purpleAddress2Values.reverse[address2],
        "pincode": pincode,
        "city": cityValues.reverse[city],
        "state": stateValues.reverse[state],
        "country": countryValues.reverse[country],
        "latLong": latLongValues.reverse[latLong],
    };
}

enum FluffyAddress1 { SECTOR_39, ADDRESS1_SECTOR_39 }

final fluffyAddress1Values = EnumValues({
    "Sector 39": FluffyAddress1.ADDRESS1_SECTOR_39,
    "Sector-39": FluffyAddress1.SECTOR_39
});

enum PurpleAddress2 { NEAR_CYBER_PARK }

final purpleAddress2Values = EnumValues({
    "Near Cyber Park": PurpleAddress2.NEAR_CYBER_PARK
});

enum LatLong { THE_2845752377026344 }

final latLongValues = EnumValues({
    "28.457523/77.026344": LatLong.THE_2845752377026344
});

enum VendorName { JACK }

final vendorNameValues = EnumValues({
    "Jack": VendorName.JACK
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}