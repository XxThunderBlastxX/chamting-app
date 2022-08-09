part of 'connectivity_bloc.dart';

@immutable
abstract class ConnectivityState {}

class ConnectivityInitialState extends ConnectivityState {}

class ConnectivityTrue extends ConnectivityState {}

class ConnectivityErr extends ConnectivityState {}
