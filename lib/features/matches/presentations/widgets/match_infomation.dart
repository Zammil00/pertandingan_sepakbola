import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pertandingan_sepakbola/core/utils/extensions/context_extension.dart';
import 'package:pertandingan_sepakbola/features/matches/data/models/match.dart';
import 'package:pertandingan_sepakbola/features/matches/presentations/widgets/reuseable_card.dart';
import 'package:pertandingan_sepakbola/gen/assets.gen.dart';

class MatchInfomation extends StatelessWidget {
  const MatchInfomation({
    super.key,
    required this.match,
  });
  final MatchModel match;
  @override
  Widget build(BuildContext context) {
    return ReuseableCard(
      title: "Game Information",
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 15.h,
        ),
        child: Column(
          children: [
            InforCard(
              icon: Assets.images.locationpin.image(width: 20.w),
              firstText: "Venue",
              secondText: "Camp Nou",
            ),
            InforCard(
              icon: Assets.images.date.image(width: 20.w),
              firstText: "Date",
              secondText: match.gameDate,
            ),
            InforCard(
              icon: Assets.images.clock.image(width: 20.w),
              firstText: "Time",
              secondText: "21:00",
            ),
            InforCard(
              icon: Assets.images.footballRefereeWithHandGesturesSvgrepoCom
                  .image(width: 20.w),
              firstText: "Referee",
              secondText: "Hozier Smith",
            ),
            InforCard(
              icon: Assets.images.footballStadium2SvgrepoCom.image(width: 20.w),
              firstText: "Stadium Capacity",
              secondText: "99,354",
            ),
          ],
        ),
      ),
    );
  }
}

class InforCard extends StatelessWidget {
  const InforCard({
    super.key,
    required this.firstText,
    required this.icon,
    required this.secondText,
  });
  final Widget icon;
  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 15.h,
      ),
      child: SizedBox(
        width: 1.sw,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                icon,
                30.horizontalSpace,
                Text(
                  firstText,
                  style: context.textTheme.bodySmall!.copyWith(
                    color: Color(0xff4F4F4F),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            Text(
              secondText,
              style: context.textTheme.bodySmall!.copyWith(
                color: context.colorScheme.onSurface,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
