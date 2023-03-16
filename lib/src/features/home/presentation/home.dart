import 'package:flutter/material.dart';

import '../../../../common/network_widget.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/home';

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
