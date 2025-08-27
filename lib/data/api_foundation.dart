import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart'; // <-- THIS LINE WAS MISSING
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ApiFoundation {

  // Updated base URL for the new project
  static String baseUrl(){
    // All modes (debug, profile, release) will use the same base URL
    return "https://qa.smartinvestordeck.ai/qxbox/apiV1/";
  }

  static Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) {
        return true;
      }
    } catch (e) {
      return false;
    }

    return false;
  }

}
class ConnectivityNotifier extends ValueNotifier<bool> {
  bool _restored = false;

  ConnectivityNotifier() : super(true);

  void setConnected(bool isConnected) {
    if (isConnected && !value) {
      _restored = true;
      notifyListeners();
      Timer(const Duration(seconds: 3), () {
        _restored = false;
        notifyListeners();
      });
    }
    value = isConnected;
    notifyListeners();
  }

  bool get restored => _restored;
}

final connectivityNotifier = ConnectivityNotifier();

class InternetIndicator extends StatelessWidget {
  const InternetIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: connectivityNotifier,
      builder: (context, isConnected, child) {
        if (!isConnected) {
          return Container(
            color: Colors.red,
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            width: double.infinity,
            child: const Padding(
              padding: EdgeInsets.only(top: 35.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.signal_cellular_nodata,color: Colors.white,size: 20,),
                    SizedBox(width: 5,),
                    Text(
                      "No Internet Connection",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (connectivityNotifier.restored) {
          return Container(
            color: Colors.green,
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            width: double.infinity,
            child: const Padding(
              padding: EdgeInsets.only(top: 35.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle,color: Colors.white,size: 20,),
                    SizedBox(width: 5,),
                    Text(
                      "Internet Connection Restored",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
