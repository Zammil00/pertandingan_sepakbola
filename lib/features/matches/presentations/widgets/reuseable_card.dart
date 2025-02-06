// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pertandingan_sepakbola/core/config/app_colors.dart';
import 'package:pertandingan_sepakbola/core/utils/extensions/context_extension.dart';

class ReuseableCard extends StatelessWidget {
  const ReuseableCard({
    super.key,
    required this.child,
    this.onTap,
    required this.title,
  });
  final String title;
  final Function()? onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 15.h,
        top: 15.h,
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Card(
          color: context.colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          elevation: 6,
          shadowColor: AppColors.backgroundDark.withOpacity(0.15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: context.screenWidth,
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: 10.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      15.r,
                    ),
                    topRight: Radius.circular(
                      15.r,
                    ),
                  ),
                  color: context.colorScheme.primary,
                ),
                child: Text(
                  title,
                  style: context.textTheme.bodySmall!.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
