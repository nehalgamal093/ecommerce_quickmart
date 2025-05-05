import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce_shop/core/network/network_helper/network_bloc/network_bloc.dart';

class NetworkHelper {
  static void observeNetwork() {
    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      if (result[0].name == 'none') {
        NetworkBloc().add(NetworkNotify(isConnected: false));
      } else {
        NetworkBloc().add(NetworkNotify(isConnected: true));
      }
    });
  }
}
