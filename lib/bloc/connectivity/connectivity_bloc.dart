import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  ConnectivityBloc() : super(ConnectivityInitialState()) {
    //used to check the connectivity of internet
    on<ConnectivityCheckEvent>((event, emit) async {
      var connectivityResult = await Connectivity().checkConnectivity();

      if (connectivityResult == ConnectivityResult.wifi ||
          connectivityResult == ConnectivityResult.ethernet ||
          connectivityResult == ConnectivityResult.mobile) {
        emit(ConnectivityTrue());
      } else {
        emit(ConnectivityErr());
      }
    });
  }
}
