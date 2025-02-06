import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pertandingan_sepakbola/core/config/app_colors.dart';
import 'package:pertandingan_sepakbola/core/utils/extensions/context_extension.dart';
import 'package:pertandingan_sepakbola/features/matches/data/models/match.dart';

class TeamOverView extends StatelessWidget {
  const TeamOverView({
    super.key,
    required this.logo,
    required this.goals,
    required this.name,
  });

  final String logo;
  final List<Event> goals;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                logo,
                width: 50.w,
              ),
            ),
            7.verticalSpace,
            SizedBox(
              width: 80.w,
              child: Text(
                name,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodySmall!.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            10.verticalSpace,
          ],
        ),
        ...goals.map((e) {
          if (e.type == "goal"|| e.type == "penalty") {
            return Padding(
              padding: EdgeInsets.only(
                bottom: 10.h,
              ),
              child: Text(
                "${e.player} ${e.minute}'",
                style: context.textTheme.bodySmall!.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.veryLightGrey,
                ),
              ),
            );
          } else {
            return SizedBox.shrink();
          }
        })
      ],
    );
  }
}
