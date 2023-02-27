import 'dart:async';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

class ConnectivityPlusService {
  bool getInternetStatus() {
    return GetIt.I<ConnectivityPlusService>()._connectedStatus;
  }

  ConnectivityStatus getIntialStatus() {
    if (GetIt.I<ConnectivityPlusService>()._connectedStatus) {
      return ConnectivityStatus.wiFi;
    } else {
      return ConnectivityStatus.offline;
    }
  }

  //late StreamSubscription<ConnectivityResult> _subscription;
  late StreamController<ConnectivityStatus> _streamController;
  late Stream<ConnectivityStatus> connectivityStream;
  ConnectivityStatus _connectivityResult = ConnectivityStatus.init;
  bool _connectedStatus = true;
  void initConnectivityService() {
    GetIt.I
        .registerSingleton<ConnectivityPlusService>(ConnectivityPlusService());
    GetIt.I<ConnectivityPlusService>()._callingInternetStatusCallBackService();
  }

  void _callingInternetStatusCallBackService() async {
    _streamController = StreamController<ConnectivityStatus>.broadcast();

    connectivityStream = _streamController.stream.asBroadcastStream(
      onCancel: (subscription) {
        subscription.pause();
      },
      onListen: (subscription) {
        subscription.resume();
      },
    );
    var checkConnectionForFirstTime =
        await (Connectivity().checkConnectivity());
    _connectivityResult = _getStatusFromResult(checkConnectionForFirstTime);
    _connectedStatus =
        _getConnectedStatusFromResult(checkConnectionForFirstTime);
    log(_connectivityResult.name, name: "logConnectivity");
    _streamController.sink.add(_connectivityResult);

    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      _connectivityResult = _getStatusFromResult(result);
      _connectedStatus = _getConnectedStatusFromResult(result);
      _streamController.sink.add(_connectivityResult);
      log(_connectivityResult.name, name: "logConnectivity");
    });
  }

  ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.cellular;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.wiFi;
      case ConnectivityResult.none:
        return ConnectivityStatus.offline;
      default:
        return ConnectivityStatus.offline;
    }
  }

  bool _getConnectedStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return true;
      case ConnectivityResult.wifi:
        return true;
      case ConnectivityResult.none:
        return false;
      default:
        return false;
    }
  }
}

enum ConnectivityStatus { wiFi, cellular, offline, init }
