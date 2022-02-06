// import 'dart:async';

// import 'package:flutter/material.dart';

// import 'package:dotted_line/dotted_line.dart';
// 
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_place/google_place.dart';
// import 'package:line_icons/line_icons.dart';
// import 'package:material_floating_search_bar/material_floating_search_bar.dart';

// import '../../../../app/modules/select_address_maps/controllers/select_address_controller.dart';
// import '../../../../global/widgets/appbar.dart';
// import '../constants.dart';
// import 'button_gradient_color.dart';

// class SelectAddressView extends GetView<SelectAddressController> {
//   final FloatingSearchBarController floatingSearchBarController =
//       FloatingSearchBarController();
//   final GooglePlace googlePlace = GooglePlace(kGoogleApiKey);
//   final Completer<GoogleMapController> _controller = Completer();

//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(33.8547, 35.8623),
//     zoom: 8,
//   );

//   void autoCompleteSearch(String value) async {
//     var result = await googlePlace.autocomplete.get(value);
//     if (result != null) {
//       controller.predictions.value = result.predictions!;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: BuildAppBar(title: 'Addresses'),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 624,
//             child: Stack(
//               children: [
//                 GoogleMap(
//                   initialCameraPosition: _kGooglePlex,
//                   onMapCreated: (GoogleMapController controller) {
//                     _controller.complete(controller);
//                   },
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 27,
//                     vertical: 20,
//                   ),
//                   child: FloatingSearchBar(
//                     controller: floatingSearchBarController,
//                     backdropColor: Colors.transparent,
//                     hint: 'Search',
//                     scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
//                     transitionDuration: const Duration(milliseconds: 800),
//                     transitionCurve: Curves.easeInOut,
//                     physics: const BouncingScrollPhysics(),
//                     openAxisAlignment: 0.0,
//                     debounceDelay: const Duration(milliseconds: 500),
//                     onQueryChanged: (query) {
//                       if (query.isNotEmpty) {
//                         autoCompleteSearch(query);
//                       } else {
//                         if (controller.predictions.length > 0) {
//                           controller.predictions.value = [];
//                         }
//                         // Call your model, bloc, controller here.
//                       }
//                     },
//                     // Specify a custom transition to be used for
//                     // animating between opened and closed stated.
//                     transition: CircularFloatingSearchBarTransition(),
//                     actions: [
//                       FloatingSearchBarAction(
//                         showIfOpened: false,
//                         child: CircularButton(
//                           icon: const Icon(Icons.place),
//                           onPressed: () {},
//                         ),
//                       ),
//                       FloatingSearchBarAction.searchToClear(
//                         showIfClosed: false,
//                       ),
//                     ],
//                     builder: (context, transition) {
//                       return ClipRRect(
//                         borderRadius: BorderRadius.circular(8),
//                         child: Material(
//                           color: Colors.white,
//                           elevation: 4.0,
//                           child: Obx(
//                             () => Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: controller.predictions.map((result) {
//                                 AutocompletePrediction recievedResult;
//                                 recievedResult = result;
//                                 return ListTile(
//                                   title: Container(
//                                     child:
//                                         recievedResult.structuredFormatting !=
//                                                 null
//                                             ? Text(
//                                                 recievedResult
//                                                         .structuredFormatting!
//                                                         .secondaryText ??
//                                                     '',
//                                               )
//                                             : null,
//                                   ),
//                                   subtitle: result.structuredFormatting != null
//                                       ? Text(
//                                           result.structuredFormatting!
//                                                   .mainText ??
//                                               '',
//                                         )
//                                       : null,
//                                 );
//                               }).toList(),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Obx(
//                   () => Visibility(
//                     visible: controller.predictions.length == 0 ? true : false,
//                     child: Center(
//                       child: Padding(
//                         padding: EdgeInsets.only(bottom: 40.0),
//                         child: Icon(
//                           LineIcons.mapPin,
//                           size: 40
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: Container(
//         color: Colors.white,
//         height: 180,
//         child: Column(
//           children: [
//             ListTile(
//               minVerticalPadding: 0,
//               contentPadding: EdgeInsets.only(left: 27, right: 27),
//               leading: Container(
//                 child: Icon(
//                   LineIcons.mapMarker,
//                   color: Colors.red,
//                 ),
//                 width: 40,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.red.withOpacity(0.1),
//                 ),
//               ),
//               title: Text(
//                 'Location',
//                 style: TextStyle(
//                   color: Colors.red,
//                 ),
//               ),
//               subtitle: Text(
//                 'Riyal, Saudi Arabia',
//                 style: TextStyle(
//                   color: Colors.red,
//                 ),
//               ),
//               trailing: Icon(
//                 LineIcons.angleRight,
//                 size: 14
//                 color: Colors.red,
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(bottom: 20.0, top: 7),
//               child: DottedLine(
//                 dashColor: Colors.black.withOpacity(0.07),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 27),
//               child: BuildGradientButton(
//                 buttonChild: Text(
//                   'CONFIRM ADDRESS',
//                   style: TextStyle(color: Colors.red),
//                 ),
//                 onPressed: () => print('CONFIRM ADDRESS'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
