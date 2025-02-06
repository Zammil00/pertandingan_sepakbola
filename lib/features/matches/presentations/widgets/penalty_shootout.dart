import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pertandingan_sepakbola/core/config/app_colors.dart';
import 'package:pertandingan_sepakbola/core/utils/extensions/context_extension.dart';
import 'package:pertandingan_sepakbola/features/matches/data/models/match.dart';
import 'package:pertandingan_sepakbola/features/matches/presentations/widgets/reuseable_card.dart';
import 'package:pertandingan_sepakbola/gen/assets.gen.dart';

class PenaltyShootout extends StatelessWidget {
  const PenaltyShootout({
    super.key,
    required this.match,
  });
  final MatchModel match;
  @override
  Widget build(BuildContext context) {
    String penaltyScore = "";

    if (match.score.contains("pens")) {
      penaltyScore = match.score
          .split('(')
          .last
          .replaceAll('pens', '')
          .replaceAll(')', '')
          .trim();
    }
    List<Event> penalty = match.events
        .where(
          (e) => e.type == "penalty_shootout",
        )
        .toList();

    return penalty.isNotEmpty
        ? ReuseableCard(
            title: 'Penalty Shootout',
            child: Padding(
              padding: EdgeInsets.only(
                left: 15.w,
                top: 18.h,
                bottom: 18.h,
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            "(${penaltyScore.split("-").first.trim()})",
                            style: context.textTheme.bodySmall!.copyWith(
                              fontSize: 11.sp,
                              color: AppColors.lightGreen,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          2.verticalSpace,
                          Image.asset(
                            match.teams.home.logo,
                            width: 20.w,
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      Column(
                        children: [
                          Text(
                            "(${penaltyScore.split("-").last.trim()})",
                            style: context.textTheme.bodySmall!.copyWith(
                              fontSize: 11.sp,
                              color: AppColors.redColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          2.verticalSpace,
                          Image.asset(
                            match.teams.away.logo,
                            width: 20.w,
                          ),
                        ],
                      ),
                    ],
                  ),
                  10.horizontalSpace,
                  Column(
                    children: [
                      Container(
                        width: 0.8.sw,
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: AppColors.gold.withOpacity(0.15),
                        ),
                        child: SizedBox(
                          width: 0.8.sw,
                          height: 48.h,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: penalty[0]
                                  .details
                                  ?.where((e) => e.team == "home")
                                  .toList()
                                  .length,
                              itemBuilder: (context, index) {
                                final p = penalty[0]
                                    .details
                                    ?.where((e) => e.team == "home")
                                    .toList()[index];
                                return Container(
                                  padding: EdgeInsets.only(
                                    left: 20.w,
                                  ),
                                  child: p?.outcome == "scored"
                                      ? Assets.images.goal.image(
                                          width: 24.w,
                                        )
                                      : Assets.images.notgoal.image(
                                          width: 24.w,
                                        ),
                                );
                              }),
                        ),
                      ),
                      Container(
                        width: 0.8.sw,
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: AppColors.redColor.withOpacity(0.15),
                        ),
                        child: SizedBox(
                          width: 0.8.sw,
                          height: 48.h,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: penalty[0]
                                  .details
                                  ?.where((e) => e.team == "away")
                                  .toList()
                                  .length,
                              itemBuilder: (context, index) {
                                final p = penalty[0]
                                    .details
                                    ?.where((e) => e.team == "away")
                                    .toList()[index];
                                return Container(
                                  padding: EdgeInsets.only(
                                    left: 20.w,
                                  ),
                                  child: p?.outcome == "scored"
                                      ? Assets.images.goal.image(
                                          width: 24.w,
                                        )
                                      : Assets.images.notgoal.image(
                                          width: 24.w,
                                        ),
                                );
                              }),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        : SizedBox.shrink();
  }
}
