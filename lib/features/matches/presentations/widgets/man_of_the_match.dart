// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pertandingan_sepakbola/core/config/app_colors.dart';
import 'package:pertandingan_sepakbola/core/utils/extensions/context_extension.dart';
import 'package:pertandingan_sepakbola/features/matches/data/models/match.dart';
import 'package:pertandingan_sepakbola/features/matches/presentations/widgets/reuseable_card.dart';

class ManOfTheMatch extends StatelessWidget {
  const ManOfTheMatch({
    super.key,
    required this.match,
  });
  final MatchModel match;
  @override
  Widget build(BuildContext context) {
    return ReuseableCard(
      title: "Player Of The Match",
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 20.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 32.r,
                  backgroundColor: context.colorScheme.background,
                  backgroundImage: AssetImage(match.playerOfTheMatch.image),
                ),
                10.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      match.playerOfTheMatch.name,
                      style: context.textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: context.colorScheme.onSurface,
                      ),
                    ),
                    7.verticalSpace,
                    Row(
                      children: [
                        Image.asset(
                          match.playerOfTheMatch.clubLogo,
                          width: 20.w,
                        ),
                        5.horizontalSpace,
                        Text(
                          match.playerOfTheMatch.club,
                          style: context.textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: AppColors.darkGrey,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            Container(
              alignment: Alignment.center,
              width: 33.h,
              height: 21.h,
              decoration: BoxDecoration(
                  color: context.colorScheme.primary,
                  borderRadius: BorderRadius.circular(4.r)),
              child: Text(
                "8.0",
                style: context.textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 11.sp,
                  color: AppColors.whiteColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
