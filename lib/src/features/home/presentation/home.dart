import 'package:chamting_app/common/network_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const route = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ConnectivityWrapper(
        offlineChild: Center(
          child: Text('No Internet Connection'),
        ),
        onlineChild: Center(
          child: Text('Home Page'),
        ),
      ),
    );
  }
}
