import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pertandingan_sepakbola/core/config/app_colors.dart';
import 'package:pertandingan_sepakbola/core/utils/extensions/context_extension.dart';

class CustomeTextField extends StatelessWidget {
  const CustomeTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: context.textTheme.bodySmall!.copyWith(
        fontSize: 14.sp,
        color: AppColors.whiteColor,
      ),
      decoration: InputDecoration(
        prefixIconConstraints: BoxConstraints(
          maxWidth: 40.w,
          minWidth: 35.w,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.darkGrey,
        ),
        hintStyle: context.textTheme.bodySmall!.copyWith(
          fontSize: 16.sp,
          color: AppColors.darkGrey,
        ),
        hintText: "Search",
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 2.h,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.darkGrey,
          ),
          borderRadius: BorderRadius.circular(
            10.r,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(
            10.r,
          ),
        ),
      ),
    );
  }
}
