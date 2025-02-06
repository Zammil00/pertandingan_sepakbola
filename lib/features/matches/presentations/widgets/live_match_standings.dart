// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pertandingan_sepakbola/core/config/app_colors.dart';
import 'package:pertandingan_sepakbola/core/utils/extensions/context_extension.dart';
import 'package:pertandingan_sepakbola/features/matches/data/models/match.dart';
import 'package:pertandingan_sepakbola/features/matches/presentations/bloc/matches_bloc.dart';
import 'package:pertandingan_sepakbola/gen/assets.gen.dart';

class LiveMatchStandings extends StatelessWidget {
  const LiveMatchStandings({
    super.key,
    required this.bloc,
    required this.match,
  });
  final MatchesBloc bloc;
  final MatchModel match;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 15.h,
      ),
      child: Card(
        color: context.colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        elevation: 6,
        shadowColor: AppColors.backgroundDark.withOpacity(0.15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Live Match Standings",
                    style: context.textTheme.bodySmall!.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  Row(
                    children: [
                      Assets.images.laligalogo.image(
                        width: 24.w,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "LaLiga",
                        style: context.textTheme.bodySmall!.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 15.h,
                horizontal: 10.w,
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: 1.sw,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: bloc.matchStandings.map((e) {
                        return Container(
                          margin: EdgeInsets.only(
                            right: 10.w,
                          ),
                          child: SizedBox(
                            width: 20.w,
                            child: Text(
                              e,
                              textAlign: TextAlign.center,
                              style: context.textTheme.bodySmall!.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: e == "Pt"
                                    ? context.colorScheme.onSurface
                                    : AppColors.darkGrey,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  7.verticalSpace,
                  TeamStandings(
                    image: match.teams.home.logo,
                    name: match.teams.home.name,
                    stands: bloc.matchStandingValues,
                    number: "1",
                  ),
                  Divider(
                    color: AppColors.lightGrey,
                    thickness: 0.5,
                  ),
                  TeamStandings(
                    image: match.teams.away.logo,
                    name: match.teams.away.name,
                    stands: bloc.matchStandingValues1,
                    number: "2",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TeamStandings extends StatelessWidget {
  const TeamStandings({
    super.key,
    required this.name,
    required this.stands,
    required this.number,
    required this.image,
  });
  final List<String> stands;
  final String number;
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                number,
                style: context.textTheme.bodySmall!.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: context.colorScheme.onSurface),
              ),
              15.horizontalSpace,
              Image.asset(
                image,
                width: 24.w,
              ),
              15.horizontalSpace,
              SizedBox(
                width: 90.w,
                child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.bodySmall!.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: context.colorScheme.onSurface),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: stands.map((e) {
              return Container(
                margin: EdgeInsets.only(
                  right: 10.w,
                ),
                child: SizedBox(
                  width: 20.w,
                  child: Text(
                    e,
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodySmall!.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: e == "30"
                          ? context.colorScheme.onSurface
                          : AppColors.darkGrey,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
