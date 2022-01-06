import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../util_functions.dart';

class BuildApiErrorWidget extends StatelessWidget {
  const BuildApiErrorWidget({
    Key? key,
    required this.function,
    required this.message,
    required this.myApp,
  }) : super(key: key);

  final Function() function;
  final String message;
  final Widget myApp;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          if (!message.contains('token'))
            SizedBox(
              height: 30.h,
            ),
          if (!message.contains('token'))
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(90.w, 0, 90.w, 0),
              child: ElevatedButton(
                child: const Text('Refresh'),
                onPressed: function,
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
            ),
          if (message.contains('token'))
            SizedBox(
              height: 30.h,
            ),
          if (message.contains('token'))
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(90.w, 0, 90.w, 0),
              child: ElevatedButton(
                  child: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () async {
                    await handleLogoutOrRestart(context, myApp);
                  }),
            ),
        ],
      ),
    );
  }
}
