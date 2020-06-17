import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itup/bloc/home_bloc.dart';
import 'package:itup/repository/home_repository.dart';
import 'package:itup/rest/rest_client.dart';
import 'package:itup/services/home_service.dart';
import 'package:itup/ui/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ITupleApp());
}

class ITupleApp extends StatefulWidget {
  @override
  _ITupleAppState createState() => _ITupleAppState();
}

class _ITupleAppState extends State<ITupleApp> {
  HomeBloc _homeBloc;
  @override
  void initState() {
    _homeBloc = HomeBloc(
        homeRepository: HomeRepository(
      iHomeService: RealHomeService(restClient: RestClient()),
    ));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _homeBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<HomeBloc>.value(
        value: _homeBloc,
        child: HomeScreen(),
      ),
    );
  }
}
