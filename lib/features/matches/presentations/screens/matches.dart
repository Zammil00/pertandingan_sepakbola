// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pertandingan_sepakbola/core/config/app_colors.dart';
import 'package:pertandingan_sepakbola/core/utils/extensions/context_extension.dart';
import 'package:pertandingan_sepakbola/core/utils/reuseables/custome_textField.dart';
import 'package:pertandingan_sepakbola/features/matches/data/models/match.dart';
import 'package:pertandingan_sepakbola/features/matches/presentations/bloc/matches_bloc.dart';
import 'package:pertandingan_sepakbola/gen/assets.gen.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
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
        if (state is MatchesSeasonIndexUpdated) {
          return Scaffold(
            body: DefaultTabController(
              length: 3,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Color(0xff002929),
                    expandedHeight: 187.h,
                    floating: false,
                    elevation: 0.05,
                    pinned: true,
                    title: Assets.images.a3ScorersR3021.image(
                      width: 60.w,
                    ),
                    leading: IconButton(
                      onPressed: () {},
                      icon: Assets.icons.burgerIcon.svg(),
                    ),
                    centerTitle: true,
                    actions: [
                      SizedBox(
                        width: 134.w,
                        height: 34.h,
                        child: CustomeTextField(),
                      ),
                      15.horizontalSpace,
                    ],
                    flexibleSpace: FlexibleSpaceBar(
                      background: SizedBox(
                        width: context.screenWidth,
                        height: 187.h,
                        child: Stack(
                          children: [
                            Container(
                              width: context.screenWidth,
                              color: Colors.black.withOpacity(0.2),
                              child: Assets.images.firstBackground.image(
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: context.screenWidth,
                                    height: 100.h,
                                    child: ListView.builder(
                                      itemCount: matchesBloc.seasons.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final season =
                                            matchesBloc.seasons[index];
                                        return GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () {
                                            matchesBloc
                                                .add(SeasonIndexChange(index));
                                          },
                                          child: Container(
                                            padding: EdgeInsets.only(
                                              left: 19.w,
                                              right: index == 5 ? 20.w : 0,
                                            ),
                                            child: Column(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor:
                                                      state.seasonIndex == index
                                                          ? context.colorScheme
                                                              .primary
                                                          : AppColors
                                                              .backgroundDark,
                                                  radius: 22.r,
                                                  child: season.icon,
                                                ),
                                                7.verticalSpace,
                                                Text(
                                                  season.title,
                                                  style: context
                                                      .textTheme.bodySmall!
                                                      .copyWith(
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        state.seasonIndex ==
                                                                index
                                                            ? FontWeight.w500
                                                            : FontWeight.w400,
                                                    color: state.seasonIndex ==
                                                            index
                                                        ? AppColors.whiteColor
                                                        : AppColors.lightGrey,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
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
                              text: "New Matches",
                            ),
                            Tab(
                              text: "Live Matches",
                            ),
                            Tab(
                              text: "Past Matches",
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
                          return Column(
                            children: [
                              150.verticalSpace,
                              Center(child: Text("New Matches")),
                            ],
                          );
                        } else if (pageIndex == 1) {
                          return Column(
                            children: [
                              150.verticalSpace,
                              Center(child: Text("Live Matches")),
                            ],
                          );
                        } else if (pageIndex == 2) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.w,
                            ),
                            child: Column(
                              children: [
                                15.verticalSpace,
                                ListView.builder(
                                  padding: EdgeInsets.zero,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: matchesBloc.pastMatches.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    final match =
                                        matchesBloc.pastMatches[index];
                                    return _buildMatchCard(
                                      match: match,
                                      context: context,
                                    );
                                  },
                                ),
                                90.verticalSpace,
                              ],
                            ),
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

Widget _buildMatchCard(
    {required MatchModel match, required BuildContext context}) {
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
  return Padding(
    padding: EdgeInsets.only(
      bottom: 15.h,
    ),
    child: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).pushNamed(
          '/match-details',
          arguments: '${match.matchId}',
        );
      },
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
                  Text(
                    match.gameWeek,
                    style: context.textTheme.bodySmall!.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
            ),

            // Match Details (Teams and Score)
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 15.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTeamInfo(
                    match.teams.home.name,
                    Image.asset(
                      match.teams.home.logo,
                      width: 40.w,
                    ),
                    context,
                  ),
                  Column(
                    children: [
                      Text(
                        match.gameDate,
                        style: context.textTheme.bodySmall!.copyWith(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.darkGrey,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                            text: mainScore,
                            style: context.textTheme.bodySmall!.copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.darkBackgroundColor,
                            ),
                            children: penaltyScore != "" ? [] : []),
                      ),
                      Text(
                        "Full-time",
                        style: context.textTheme.bodySmall!.copyWith(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.darkGrey,
                        ),
                      ),
                    ],
                  ),
                  _buildTeamInfo(
                    match.teams.away.name,
                    Image.asset(
                      match.teams.away.logo,
                      width: 40.w,
                    ),
                    context,
                  ),
                ],
              ),
            ),
            Divider(
              color: AppColors.grey,
            ),
            10.verticalSpace,
          ],
        ),
      ),
    ),
  );
}

Widget _buildTeamInfo(String teamName, Widget logo, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      logo,
      5.verticalSpace,
      Container(
        width: 100.w,
        alignment: Alignment.center,
        child: Text(
          teamName,
          textAlign: TextAlign.center,
          style: context.textTheme.bodySmall!.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.navyGrey,
          ),
        ),
      ),
    ],
  );
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
