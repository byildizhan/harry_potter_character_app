import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget infoRowWidget(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      children: [
        Text('$label: ', style: TextStyle(fontSize: 12.sp)),
        Expanded(
          child: Text(value, style: TextStyle(fontSize: 12.sp)),
        ),
      ],
    ),
  );
}
