import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pertandingan_sepakbola/core/utils/extensions/context_extension.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shop",
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colorScheme.onSurface,
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: Text(
          "Shop",
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
