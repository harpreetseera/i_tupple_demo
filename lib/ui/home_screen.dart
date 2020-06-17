import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itup/bloc/home_bloc.dart';
import 'package:itup/events/home_event.dart';
import 'package:itup/states/home_state.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(GetEarningDataEvent());
    BlocProvider.of<HomeBloc>(context).add(GetOrderDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {},
          child: BlocBuilder<HomeBloc, HomeState>(
              bloc: BlocProvider.of<HomeBloc>(context),
              builder: (context, state) => Column(
                    children: <Widget>[
                      Container(
                        // height: screenheight * 0.12,
                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.only(
                            bottomLeft: const Radius.circular(20.0),
                            bottomRight: const Radius.circular(20.0),
                          ),
                          gradient: new LinearGradient(
                            begin: Alignment(-1.0, -4.0),
                            end: Alignment(1, 4.0),
                            colors: [
                              Colors.orange,
                              Colors.red,
                              Colors.purple[600],
                            ],
                            stops: [0.0, 0.5, 0.9],
                          ),
                          color: Colors.orange,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 4,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 12, 8, 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Icon(Icons.search, color: Colors.red),
                                          Text("Search",
                                              style: TextStyle(
                                                color: Colors.grey,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                    child: Row(
                                  children: <Widget>[
                                    Expanded(
                                        flex: 1,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text("online",
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            Switch(
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              onChanged: (val) {},
                                              value: true,
                                              activeColor: Colors.orange,
                                            )
                                          ],
                                        )),
                                    Flexible(
                                      // flex: 1,
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                "assets/roll.jpg",
                                              ),
                                              fit: BoxFit.cover),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          border: Border.all(
                                            color: Colors.orange,
                                            width: 1,
                                          ),
                                          // color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          right: 16,
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 16.0, bottom: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 16, 16, 8),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              color: Colors.orange[800],
                                            ),
                                            width: screenWidth * 0.25,
                                            height: 100,
                                            child: Center(
                                              child: Text("All \nOrders",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  )),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            top: 0.0,
                                            right: 0.0,
                                            child: CircleAvatar(
                                              radius: 14,
                                              backgroundColor: Colors.white,
                                              child: CircleAvatar(
                                                radius: 10,
                                                backgroundColor:
                                                    Colors.orange[800],
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 16, 16, 8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color: Colors.purple,
                                        ),
                                        width: screenWidth * 0.25,
                                        height: 100,
                                        child: Center(
                                            child: handleResponsiveness(state)),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 16, 16, 8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color: Colors.red[900],
                                        ),
                                        width: screenWidth * 0.25,
                                        height: 100,
                                        child: Center(
                                          child: Text("All \nCustomers",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                              )),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 16.0, bottom: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: new BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          color: Colors.orange[800],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              16, 8, 16, 8),
                                          child: Text(
                                            "Ongoing",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: new BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              16, 8, 16, 8),
                                          child: Text(
                                            "Tomorrow",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.orange[800],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: new BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              16, 8, 16, 8),
                                          child: Text(
                                            "History",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.orange[800],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(4.0, 8, 4, 8),
                                  child: Icon(Icons.access_time,
                                      color: Colors.orange[800]),
                                ),
                                Text(
                                  "Instant",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[700],
                                    fontSize: 18,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: handleOrderData(state, context),
                      )),
                    ],
                  )),
        ),
      ),
    );
  }

  Widget handleResponsiveness(state) {
    Widget earningWidget;
    // Text("Earning \nof the day",
    //     textAlign: TextAlign.center,
    //     style: TextStyle(
    //       color: Colors.white,
    //     ));
    if (BlocProvider.of<HomeBloc>(context).earningDataResponse != null) {
      double totalSale = BlocProvider.of<HomeBloc>(context)
              .earningDataResponse
              .data
              .cashSale +
          BlocProvider.of<HomeBloc>(context)
              .earningDataResponse
              .data
              .onlineSale +
          BlocProvider.of<HomeBloc>(context).earningDataResponse.data.khataSale;
      earningWidget = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Rs ${totalSale.toString()}",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Earnings of \n the day",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        ],
      );
    }
    if (state is EarningLoadingState) {
      earningWidget = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(
              strokeWidth: 1,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Loading \ndata",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      );
    }
    if (state is EarningSuccessState) {
      double totalSale = BlocProvider.of<HomeBloc>(context)
              .earningDataResponse
              .data
              .cashSale +
          BlocProvider.of<HomeBloc>(context)
              .earningDataResponse
              .data
              .onlineSale +
          BlocProvider.of<HomeBloc>(context).earningDataResponse.data.khataSale;
      earningWidget = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Rs ${totalSale.toString()}",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Earnings of \n the day",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        ],
      );
    }
    if (state is EarningFailureState) {
      earningWidget = AutoSizeText("Error:${state.errorMessage}",
          textAlign: TextAlign.center,
          minFontSize: 5,
          maxFontSize: 15,
          style: TextStyle(color: Colors.white, fontSize: 14));
    }

    return earningWidget;
  }

  Widget handleOrderData(state, BuildContext ctx) {
    Widget orderData = Text("Order Data");
    if (state is OrderLoadingState) {
      orderData = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(
                strokeWidth: 1,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.purple),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Loading \n order data",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
            )
          ],
        ),
      );
    }
    if (state is OrderFailureState) {
      orderData = Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            "Error: ${state.errorMessage}",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.purple,
            ),
          ),
        ),
      );
    }
    if (state is OrderSuccessState) {
      orderData = Container(
        height: MediaQuery.of(ctx).size.height * 0.6,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: BlocProvider.of<HomeBloc>(context)
              .orderFetchResponse
              .data
              .orders
              .length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Colors.purple),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                          // color: Colors.purple,
                          child: Center(
                              child: Column(
                            children: <Widget>[
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "assets/profile.jpg",
                                      ),
                                      fit: BoxFit.cover),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  border: Border.all(
                                    color: Colors.purple[400],
                                    width: 1,
                                  ),
                                  // color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "TODAY\n${TimeOfDay.fromDateTime(BlocProvider.of<HomeBloc>(context).orderFetchResponse.data.orders[index].createdOn).format(context)} ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )),
                        )),
                    Expanded(
                        flex: 4,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: Colors.grey[100],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                        flex: 5,
                                        child: Text(
                                          BlocProvider.of<HomeBloc>(context)
                                              .orderFetchResponse
                                              .data
                                              .orders[index]
                                              .customer
                                              .name,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Expanded(
                                      flex: 1,
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.grey,
                                        child: CircleAvatar(
                                          radius: 14,
                                          backgroundColor: Colors.grey[100],
                                          child: Icon(
                                            Icons.fastfood,
                                            size: 14,
                                            color: Colors.purple,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(4, 8, 4, 8.0),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          children: <Widget>[
                                            Center(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Container(
                                                  // width: screenWidth * 0.2,
                                                  height: 2,
                                                  color: BlocProvider.of<
                                                              HomeBloc>(context)
                                                          .orderFetchResponse
                                                          .data
                                                          .orders[index]
                                                          .payment
                                                          .paid
                                                      ? Colors.purple
                                                      : Colors.grey[400]),
                                            )),
                                            Text(
                                              "PAID",
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: <Widget>[
                                            Center(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Container(
                                                  // width: screenWidth * 0.2,
                                                  height: 2,
                                                  color: BlocProvider.of<
                                                              HomeBloc>(context)
                                                          .orderFetchResponse
                                                          .data
                                                          .orders[index]
                                                          .pack
                                                      ? Colors.purple
                                                      : Colors.grey[400]),
                                            )),
                                            Text(
                                              "Packed",
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: <Widget>[
                                            Center(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Container(
                                                // width: screenWidth * 0.2,
                                                height: 2,
                                                color: Colors.grey[400],
                                              ),
                                            )),
                                            Text(
                                              "Delivered",
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 12,
                                    bottom: 12,
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        BlocProvider.of<HomeBloc>(context)
                                            .orderFetchResponse
                                            .data
                                            .orders[index]
                                            .payment
                                            .mode
                                            .toString(),
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      BlocProvider.of<HomeBloc>(context)
                                          .orderFetchResponse
                                          .data
                                          .orders[index]
                                          .amount
                                          .price
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          "View order",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Icon(Icons.arrow_forward_ios,
                                            color: Colors.grey)
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
    return Padding(padding: EdgeInsets.only(top: 16), child: orderData);
  }
}
