// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:get/get.dart';

// import '../../../../app/modules/homepage/controllers/homepage_controller.dart';

// String text = 'No Internet, check Wifi/Mobiledata toggle';

// class NoInternetPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Get.find<HomepageController>().currentIndex.value = 0;

//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               text,
//               style: TextStyle(color: Colors.red),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class InternetChecker extends StatefulWidget {
//   final Widget child;
//   const InternetChecker({
//     Key? key,
//     required this.child,
//   }) : super(key: key);
//   @override
//   _InternetCheckerState createState() => _InternetCheckerState();
// }

// class _InternetCheckerState extends State<InternetChecker> {
//   ConnectivityResult _connectionStatus = ConnectivityResult.wifi;
//   final Connectivity _connectivity = Connectivity();
//   late StreamSubscription<ConnectivityResult> _connectivitySubscription;

//   @override
//   Widget build(BuildContext context) {
//     return _connectionStatus == ConnectivityResult.none
//         ? NoInternetPage()
//         : widget.child;
//   }

//   @override
//   void dispose() {
//     _connectivitySubscription.cancel();
//     super.dispose();
//   }

//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initConnectivity() async {
//     ConnectivityResult result;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       result = await _connectivity.checkConnectivity();
//     } on PlatformException catch (e) {
//       setState(() {
//         text = e.toString();
//       });
//       return;
//     }

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) {
//       return Future.value(null);
//     }

//     return _updateConnectionStatus(result);
//   }

//   @override
//   void initState() {
//     super.initState();
//     initConnectivity();
//     _connectivitySubscription =
//         _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
//   }

//   Future<void> _updateConnectionStatus(ConnectivityResult result) async {
//     setState(() {
//       _connectionStatus = result;
//     });
//   }
// }
