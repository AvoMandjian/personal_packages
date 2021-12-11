import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildPopularSearches extends StatelessWidget {
  const BuildPopularSearches({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 26.h, bottom: 17.h),
          child: const Text(
            'TOP SEARCHES',
            style: TextStyle(color: Colors.red),
          ),
        ),
        Wrap(
          spacing: 10.h,
          runSpacing: 10.w,
          children: [1, 2, 3234234, 4, 5, 6, 2, 3234234, 4, 5, 6]
              .map(
                (e) => FittedBox(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          e.toString(),
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
