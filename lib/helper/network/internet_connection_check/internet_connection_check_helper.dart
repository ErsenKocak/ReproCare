import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectionCheckHelper {
  ConnectivityResult _connectionStatus = ConnectivityResult.wifi;
  final Connectivity _connectivity = Connectivity();
  bool isPopUpOpen = false;

  void initializeConnectivityStream() {
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _connectionStatus = result;

      if (_connectionStatus == ConnectivityResult.none) {
        if (isPopUpOpen == false) {
          // SHOW POPUP
          isPopUpOpen = true;
        }
      } else {
        checkConnectivity();
      }
      // Got a new connectivity status!
    });
  }

  Future<bool> checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      final bool isConnected = await InternetConnectionChecker().hasConnection;
      return isConnected;
    } else {
      final bool isConnected = await InternetConnectionChecker().hasConnection;
      return isConnected;
    }
  }
}
