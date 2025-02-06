// ignore_for_file: deprecated_member_use
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pertandingan_sepakbola/core/config/app_colors.dart';
import 'package:pertandingan_sepakbola/core/utils/extensions/context_extension.dart';
import 'package:pertandingan_sepakbola/features/matches/data/models/match.dart';
import 'package:pertandingan_sepakbola/gen/assets.gen.dart';

class MatchCurrentStat extends StatelessWidget {
  const MatchCurrentStat({
    super.key,
    required this.match,
  });
  final MatchModel match;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.colorScheme.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      elevation: 6,
      shadowColor: AppColors.backgroundDark.withOpacity(0.15),
      child: Column(
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  match.teams.home.logo,
                  width: 24.w,
                ),
                Text(
                  "Match Current Stat",
                  style: context.textTheme.bodySmall!.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.whiteColor,
                  ),
                ),
                Image.asset(
                  match.teams.away.logo,
                  width: 24.w,
                ),
              ],
            ),
          ),
          10.verticalSpace,
          Stack(
            children: [
              Positioned(
                child: Column(
                  children: [
                    Assets.images.stopwatchTimeTimerSvgrepoCom.image(
                      width: 24.w,
                    ),
                    Center(
                      child: Dash(
                        direction: Axis.vertical,
                        length: match.matchId == 1 ? 700.h : 340.h,
                        dashLength: 3,
                        dashGap: 3,
                        dashThickness: 1.5,
                        dashColor: context.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 15.h,
                ),
                child: Column(
                  children: [
                    15.verticalSpace,
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: match.events.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final event = match.events[index];
                        String penaltyScore = "";
                        // List<int> minutes = match.events
                        //     .where((e) => e.minute != null)
                        //     .map((e) => e.minute!)
                        //     .toList()
                        //   ..sort((a, b) => b.compareTo(a));

                        if (match.score.contains("pens")) {
                          penaltyScore = match.score
                              .split('(')
                              .last
                              .replaceAll('pens', '')
                              .replaceAll(')', '')
                              .trim();
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (event.type == "penalty_shootout")
                              Penalties(
                                  penaltyScore: penaltyScore, event: event),
                            if (event.type == "goal") GoalEvent(event: event),
                            if (event.type == "substitution")
                              SubstitutionEvent(event: event),
                            if (event.type == "yellow_card")
                              YellowCardEvent(event: event),
                            if (event.type == "penalty")
                              PenaltyEvent(event: event),
                            if (event.type == "end_of_90_minutes")
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: 10.h,
                                    bottom: 20.h,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15.w,
                                    vertical: 4.h,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: Color(0xffE0E0E0),
                                  ),
                                  child: Text(
                                    "End of 90 Minutes ${match.matchId == 1 ? (2 - 2) : "(2 - 1)"}",
                                    style:
                                        context.textTheme.bodySmall!.copyWith(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                      color: context.colorScheme.onSurface,
                                    ),
                                  ),
                                ),
                              ),
                            if (event.type == "end_of_extra_time")
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: 10.h,
                                    bottom: 20.h,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15.w,
                                    vertical: 4.h,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: Color(0xffE0E0E0),
                                  ),
                                  child: Text(
                                    "End of Extra Time (3 - 3)",
                                    style:
                                        context.textTheme.bodySmall!.copyWith(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                      color: context.colorScheme.onSurface,
                                    ),
                                  ),
                                ),
                              ),
                            if (event.type == "half_time")
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: 10.h,
                                    bottom: 20.h,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15.w,
                                    vertical: 4.h,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: Color(0xffE0E0E0),
                                  ),
                                  child: Text(
                                    "Half Time ${match.matchId == 1 ? (2 - 1) : "(1 - 0)"}",
                                    style:
                                        context.textTheme.bodySmall!.copyWith(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                      color: context.colorScheme.onSurface,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class PenaltyEvent extends StatelessWidget {
  const PenaltyEvent({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: Row(
        mainAxisAlignment: event.team == "home"
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          if (event.team == "home")
            Container(
              padding: EdgeInsets.only(
                bottom: 15.h,
              ),
              child: SizedBox(
                width: 0.467.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 15.r,
                          backgroundColor: context.colorScheme.background,
                          backgroundImage: AssetImage(
                            event.playerImage ?? "",
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 90.w,
                              child: Text(
                                event.player ?? "",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: context.textTheme.bodyMedium,
                              ),
                            ),
                            SizedBox(
                              width: 100.w,
                              child: Text(
                                "(Pen. ${event.outcome == "scored" ? "Scored" : "Missed"})",
                                overflow: TextOverflow.ellipsis,
                                style: context.textTheme.bodySmall!.copyWith(
                                  fontSize: 12.sp,
                                  color: AppColors.lightGrey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        event.outcome == "scored"
                            ? Assets.images.goal.image(
                                width: 20.w,
                              )
                            : Assets.images.notgoal.image(
                                width: 20.w,
                              ),
                        10.horizontalSpace,
                        CircleAvatar(
                          radius: 11.r,
                          backgroundColor: context.colorScheme.primary,
                          child: Text(
                            "${event.minute}",
                            style: context.textTheme.bodySmall!.copyWith(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          else
            Container(
              padding: EdgeInsets.only(
                bottom: 15.h,
              ),
              child: SizedBox(
                width: 0.449.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 10.r,
                          backgroundColor: context.colorScheme.primary,
                          child: Text(
                            "${event.minute}",
                            style: context.textTheme.bodySmall!.copyWith(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                        10.horizontalSpace,
                        event.outcome == "scored"
                            ? Assets.images.goal.image(
                                width: 20.w,
                              )
                            : Assets.images.notgoal.image(
                                width: 20.w,
                              ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 90.w,
                              child: Text(
                                event.player ?? "",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.right,
                                style: context.textTheme.bodyMedium,
                              ),
                            ),
                            SizedBox(
                              width: 95.w,
                              child: Text(
                                "(Pen. ${event.outcome == "scored" ? "Scored" : "Missed"})",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.end,
                                style: context.textTheme.bodySmall!.copyWith(
                                  fontSize: 12.sp,
                                  color: AppColors.lightGrey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 8.w),
                        CircleAvatar(
                          radius: 15.r,
                          backgroundColor: context.colorScheme.background,
                          backgroundImage: AssetImage(
                            event.playerImage ?? "",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class YellowCardEvent extends StatelessWidget {
  const YellowCardEvent({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: Row(
        mainAxisAlignment: event.team == "home"
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          if (event.team == "home")
            Container(
              padding: EdgeInsets.only(
                bottom: 15.h,
              ),
              child: SizedBox(
                width: 0.467.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 15.r,
                          backgroundColor: context.colorScheme.background,
                          backgroundImage: AssetImage(
                            event.playerImage ?? "",
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 90.w,
                              child: Text(
                                event.player ?? "",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: context.textTheme.bodyMedium,
                              ),
                            ),
                            SizedBox(
                              width: 100.w,
                              child: Text(
                                "(Time Wasting)",
                                overflow: TextOverflow.ellipsis,
                                style: context.textTheme.bodySmall!.copyWith(
                                  fontSize: 12.sp,
                                  color: AppColors.lightGrey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Assets.images.yellowCard.image(
                          width: 20.w,
                        ),
                        10.horizontalSpace,
                        CircleAvatar(
                          radius: 10.r,
                          backgroundColor: context.colorScheme.primary,
                          child: Text(
                            "${event.minute}",
                            style: context.textTheme.bodySmall!.copyWith(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          else
            Container(
              padding: EdgeInsets.only(
                bottom: 15.h,
              ),
              child: SizedBox(
                width: 0.449.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 10.r,
                          backgroundColor: context.colorScheme.primary,
                          child: Text(
                            "${event.minute}",
                            style: context.textTheme.bodySmall!.copyWith(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                        10.horizontalSpace,
                        Assets.images.yellowCard.image(
                          width: 20.w,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 90.w,
                              child: Text(
                                event.player ?? "",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.right,
                                style: context.textTheme.bodyMedium,
                              ),
                            ),
                            SizedBox(
                              width: 95.w,
                              child: Text(
                                "(Time Wasting)",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.end,
                                style: context.textTheme.bodySmall!.copyWith(
                                  fontSize: 12.sp,
                                  color: AppColors.lightGrey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 8.w),
                        CircleAvatar(
                          radius: 15.r,
                          backgroundColor: context.colorScheme.background,
                          backgroundImage: AssetImage(
                            event.playerImage ?? "",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class SubstitutionEvent extends StatelessWidget {
  const SubstitutionEvent({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: Row(
        children: [
          if (event.team == "home")
            Container(
              padding: EdgeInsets.only(
                bottom: 15.h,
              ),
              child: SizedBox(
                width: 0.465.sw,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_forward,
                              color: AppColors.lightGreen,
                              size: 20.sp,
                            ),
                            5.horizontalSpace,
                            Text(
                              event.playerIn ?? "",
                              style: context.textTheme.bodySmall!.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightGreen,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: AppColors.redColor,
                              size: 20.sp,
                            ),
                            5.horizontalSpace,
                            Text(
                              event.playerIn ?? "",
                              style: context.textTheme.bodySmall!.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.redColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Assets.images.sub.image(
                          width: 20.w,
                        ),
                        10.horizontalSpace,
                        CircleAvatar(
                          radius: 10.r,
                          backgroundColor: context.colorScheme.primary,
                          child: Text(
                            "${event.minute}",
                            style: context.textTheme.bodySmall!.copyWith(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}

class GoalEvent extends StatelessWidget {
  const GoalEvent({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: Row(
        mainAxisAlignment: event.team == "home"
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          if (event.team == "home")
            Container(
              padding: EdgeInsets.only(
                bottom: 15.h,
              ),
              child: SizedBox(
                width: 0.55.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 15.r,
                          backgroundColor: context.colorScheme.background,
                          backgroundImage: AssetImage(
                            event.playerImage ?? "",
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 90.w,
                              child: Text(
                                event.player ?? "",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: context.textTheme.bodyMedium,
                              ),
                            ),
                            SizedBox(
                              width: 100.w,
                              child: Text(
                                "(Assi.: ${event.assist})",
                                overflow: TextOverflow.ellipsis,
                                style: context.textTheme.bodySmall!.copyWith(
                                  fontSize: 12.sp,
                                  color: AppColors.lightGrey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Assets.images.footballSvgrepoCom.image(
                          width: 20.w,
                          color: context.colorScheme.onSurface,
                        ),
                        10.horizontalSpace,
                        CircleAvatar(
                          radius: 10.r,
                          backgroundColor: context.colorScheme.primary,
                          child: Text(
                            "${event.minute}",
                            style: context.textTheme.bodySmall!.copyWith(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                        10.horizontalSpace,
                        Assets.icons.playSvgrepoCom.svg(),
                      ],
                    ),
                  ],
                ),
              ),
            )
          else
            Container(
              padding: EdgeInsets.only(
                bottom: 15.h,
              ),
              child: SizedBox(
                width: 0.53.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Assets.icons.playSvgrepoCom.svg(),
                        10.horizontalSpace,
                        CircleAvatar(
                          radius: 10.r,
                          backgroundColor: context.colorScheme.primary,
                          child: Text(
                            "${event.minute}",
                            style: context.textTheme.bodySmall!.copyWith(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                        10.horizontalSpace,
                        Assets.images.footballSvgrepoCom.image(
                          width: 20.w,
                          color: context.colorScheme.onSurface,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 90.w,
                              child: Text(
                                event.player ?? "",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.right,
                                style: context.textTheme.bodyMedium,
                              ),
                            ),
                            SizedBox(
                              width: 95.w,
                              child: Text(
                                "(Assi.: ${event.assist})",
                                overflow: TextOverflow.ellipsis,
                                style: context.textTheme.bodySmall!.copyWith(
                                  fontSize: 12.sp,
                                  color: AppColors.lightGrey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 8.w),
                        CircleAvatar(
                          radius: 15.r,
                          backgroundColor: context.colorScheme.background,
                          backgroundImage: AssetImage(
                            event.playerImage ?? "",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class Penalties extends StatelessWidget {
  const Penalties({
    super.key,
    required this.penaltyScore,
    required this.event,
  });

  final String penaltyScore;
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 4.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Color(0xffE0E0E0),
          ),
          child: Text(
            "Penalties ($penaltyScore)",
            style: context.textTheme.bodySmall!.copyWith(
              fontSize: 11.sp,
              fontWeight: FontWeight.w400,
              color: context.colorScheme.onSurface,
            ),
          ),
        ),
        15.verticalSpace,
        ListView.builder(
          itemCount: (event.details?.length ?? 0) ~/ 2,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            final homePenalty = event.details?[index * 2];
            final awayPenalty = event.details?[(index * 2) + 1];

            return Padding(
              padding: EdgeInsets.only(
                bottom: 25.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 15.r,
                              backgroundColor: context.colorScheme.background,
                              backgroundImage: AssetImage(
                                homePenalty?.playerImage ?? "",
                              ),
                            ),
                            SizedBox(width: 8.w),
                            SizedBox(
                              width: 100.w,
                              child: Text(
                                homePenalty?.player ?? "",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: context.textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            right: 10.w,
                          ),
                          child: homePenalty?.outcome == "scored"
                              ? Assets.images.goal.image(width: 20.w)
                              : Assets.images.notgoal.image(width: 20.w),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 10.r,
                    backgroundColor: context.colorScheme.primary,
                    child: Text(
                      "${index + 1}",
                      style: context.textTheme.bodySmall!.copyWith(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 10.w,
                          ),
                          child: awayPenalty?.outcome == "scored"
                              ? Assets.images.goal.image(width: 20.w)
                              : Assets.images.notgoal.image(width: 20.w),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 100.w,
                              child: Text(
                                awayPenalty?.player ?? "",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.right,
                                style: context.textTheme.bodyMedium!.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: context.colorScheme.onSurface,
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            CircleAvatar(
                              radius: 15.r,
                              backgroundColor: context.colorScheme.background,
                              backgroundImage: AssetImage(
                                awayPenalty?.playerImage ?? "",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
