import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pertandingan_sepakbola/core/config/app_colors.dart';
import 'package:pertandingan_sepakbola/core/utils/extensions/context_extension.dart';
import 'package:pertandingan_sepakbola/features/matches/data/models/match.dart';
import 'package:pertandingan_sepakbola/features/matches/presentations/bloc/matches_bloc.dart';
import 'package:pertandingan_sepakbola/features/matches/presentations/widgets/live_match_standings.dart';
import 'package:pertandingan_sepakbola/features/matches/presentations/widgets/man_of_the_match.dart';
import 'package:pertandingan_sepakbola/features/matches/presentations/widgets/match_current_stat.dart';
import 'package:pertandingan_sepakbola/features/matches/presentations/widgets/match_infomation.dart';
import 'package:pertandingan_sepakbola/features/matches/presentations/widgets/penalty_shootout.dart';
import 'package:pertandingan_sepakbola/features/matches/presentations/widgets/team_overview.dart';
import 'package:pertandingan_sepakbola/features/matches/presentations/widgets/watch_hightlight.dart';
import 'package:pertandingan_sepakbola/gen/assets.gen.dart';

class MatchDetails extends StatefulWidget {
  const MatchDetails({
    super.key,
    required this.matchId,
  });
  final String matchId;

  @override
  State<MatchDetails> createState() => _MatchDetailsState();
}

class _MatchDetailsState extends State<MatchDetails> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final matchBloc = MatchesBloc();
        matchBloc.add(SeasonIndexChange(0));
        return matchBloc;
      },
      child: BlocBuilder<MatchesBloc, MatchesState>(builder: (context, state) {
        final matchesBloc = context.read<MatchesBloc>();

        if (state is MatchesLoaded || state is MatchesSeasonIndexUpdated) {
          MatchModel match = matchesBloc.pastMatches.firstWhere(
            (e) => e.matchId.toString() == widget.matchId,
          );
          String mainScore = match.score;
          String penaltyScore = "";

          if (match.score.contains("pens")) {
            mainScore = match.score.split('(').first.trim();
            penaltyScore = match.score
                .split('(')
                .last
                .replaceAll('pens', '')
                .replaceAll(')', '')
                .trim();
          }
          return Scaffold(
            body: DefaultTabController(
              length: 4,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Color(0xff002929),
                    expandedHeight: 300.h,
                    floating: false,
                    elevation: 0.05,
                    pinned: true,
                    title: Text(
                      "Match Details",
                      style: context.textTheme.bodySmall!.copyWith(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    automaticallyImplyLeading: true,
                    iconTheme: IconThemeData(
                      color: AppColors.whiteColor,
                    ),
                    centerTitle: true,
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: Assets.icons.alarmBell.svg(),
                      ),
                    ],
                    flexibleSpace: FlexibleSpaceBar(
                      background: SizedBox(
                        width: context.screenWidth,
                        height: 300.h,
                        child: Stack(
                          children: [
                            Container(
                              width: context.screenWidth,
                              color: Colors.black.withOpacity(0.2),
                              child: Assets.images.background2.image(
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 30.h,
                              left: 0,
                              right: 0,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TeamOverView(
                                    goals: match.events
                                        .where((e) => e.team == "home")
                                        .toList(),
                                    logo: match.teams.home.logo,
                                    name: match.teams.home.name,
                                  ),
                                  SizedBox(
                                    height: 210.h,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                text:
                                                    "${mainScore.split("-").first.trim()} - ",
                                                style: context
                                                    .textTheme.bodySmall!
                                                    .copyWith(
                                                  fontSize: 32.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.whiteColor,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: mainScore
                                                        .split("-")
                                                        .last
                                                        .trim(),
                                                    style: context
                                                        .textTheme.bodySmall!
                                                        .copyWith(
                                                      fontSize: 32.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: AppColors.darkGrey,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            if (penaltyScore != "")
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5.h),
                                                child: Text(
                                                  "($penaltyScore)\n penalty",
                                                  textAlign: TextAlign.center,
                                                  style: context
                                                      .textTheme.bodySmall!
                                                      .copyWith(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.darkGrey,
                                                  ),
                                                ),
                                              ),
                                            10.verticalSpace,
                                            Assets.images.footballSvgrepoCom
                                                .image(
                                              width: 15.w,
                                            )
                                          ],
                                        ),
                                        Assets.images.laligalogo.image(
                                          width: 24.w,
                                        ),
                                      ],
                                    ),
                                  ),
                                  TeamOverView(
                                    goals: match.events
                                        .where((e) => e.team == "away")
                                        .toList(),
                                    logo: match.teams.away.logo,
                                    name: match.teams.away.name,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _SliverAppBarDelegate(
                      minHeight: 50.0,
                      maxHeight: 50.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xff002929),
                          border: Border(
                            bottom: BorderSide(
                              color: context.colorScheme.tertiary,
                            ),
                          ),
                        ),
                        child: TabBar(
                          onTap: (e) {
                            setState(() {
                              pageIndex = e;
                            });
                          },
                          indicator: UnderlineTabIndicator(
                            borderRadius: BorderRadius.circular(4.r),
                            borderSide: BorderSide(
                              width: 3.0.w,
                              color: context.colorScheme.primary,
                            ),
                          ),
                          unselectedLabelStyle:
                              context.textTheme.labelLarge!.copyWith(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: AppColors.darkGrey,
                          ),
                          labelStyle: context.textTheme.labelLarge!.copyWith(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: AppColors.whiteColor,
                          ),
                          labelColor: AppColors.whiteColor,
                          unselectedLabelColor: AppColors.darkGrey,
                          indicatorColor: context.colorScheme.primary,
                          tabs: [
                            Tab(
                              text: "Overview",
                            ),
                            Tab(
                              text: "Line-up",
                            ),
                            Tab(
                              text: "Statistics",
                            ),
                            Tab(
                              text: "Matches",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Tab content for each tab

                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (pageIndex == 0) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                15.verticalSpace,
                                WatchHightlight(match: match),
                                ManOfTheMatch(match: match),
                                PenaltyShootout(match: match),
                                MatchCurrentStat(match: match),
                                LiveMatchStandings(
                                  bloc: matchesBloc,
                                  match: match,
                                ),
                                MatchInfomation(
                                  match: match,
                                ),
                                100.verticalSpace,
                              ],
                            ),
                          );
                        } else if (pageIndex == 1) {
                          return Column(
                            children: [
                              100.verticalSpace,
                              Center(child: Text("Line-up")),
                            ],
                          );
                        } else if (pageIndex == 2) {
                          return Column(
                            children: [
                              100.verticalSpace,
                              Center(child: Text("Statistics")),
                            ],
                          );
                        } else if (pageIndex == 3) {
                          return Column(
                            children: [
                              100.verticalSpace,
                              Center(child: Text("Matches")),
                            ],
                          );
                        }
                        return SizedBox();
                      },
                      childCount: 1,
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
