// ignore_for_file: deprecated_member_use_from_same_package, deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pertandingan_sepakbola/core/utils/extensions/context_extension.dart';
import 'package:pertandingan_sepakbola/features/bottom_nav_bar/presentations/bloc/bottom_navigation_bloc.dart';
import 'package:pertandingan_sepakbola/features/bottom_nav_bar/presentations/widgets/navigation_card.dart';
import 'package:pertandingan_sepakbola/gen/assets.gen.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final bloc = BottomNavigationBloc();
        bloc.add(ChangeTabEvent(0));
        return bloc;
      },
      child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          final navigationBloc = context.read<BottomNavigationBloc>();
          if (state is BottomNavigationUpdated) {
            return SizedBox(
              width: context.screenWidth,
              height: context.screenHeight,
              child: Stack(
                children: [
                  Scaffold(
                    extendBody: false,
                    body: state.currentScreen,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.colorScheme.background,
                        border: Border(
                          top: BorderSide(
                            color:
                                context.colorScheme.tertiary.withOpacity(0.5),
                          ),
                        ),
                      ),
                      padding: EdgeInsets.only(
                        top: 7.h,
                        bottom: Platform.isIOS ? 25.h : 20.h,
                        left: 20.w,
                        right: 20.w,
                      ),
                      child: SizedBox(
                        width: context.screenWidth,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            NavigationCard(
                              color: state.tabIndex == 0
                                  ? context.colorScheme.primary
                                  : context.colorScheme.onBackground,
                              icon: Assets.icons.home.svg(
                                color: state.tabIndex == 0
                                    ? context.colorScheme.primary
                                    : context.colorScheme.onBackground,
                              ),
                              onTap: () {
                                navigationBloc.add(ChangeTabEvent(0));
                              },
                              title: 'Home',
                            ),
                            NavigationCard(
                              color: state.tabIndex == 1
                                  ? context.colorScheme.primary
                                  : context.colorScheme.onBackground,
                              icon: Assets.icons.football.svg(
                                color: state.tabIndex == 1
                                    ? context.colorScheme.primary
                                    : context.colorScheme.onBackground,
                              ),
                              onTap: () {
                                navigationBloc.add(ChangeTabEvent(1));
                              },
                              title: 'Matches',
                            ),
                            NavigationCard(
                              color: state.tabIndex == 2
                                  ? context.colorScheme.primary
                                  : context.colorScheme.onBackground,
                              icon: Assets.icons.fantasy.svg(
                                color: state.tabIndex == 2
                                    ? context.colorScheme.primary
                                    : context.colorScheme.onBackground,
                              ),
                              onTap: () {
                                navigationBloc.add(ChangeTabEvent(2));
                              },
                              title: 'Fantasy',
                            ),
                            NavigationCard(
                              color: state.tabIndex == 3
                                  ? context.colorScheme.primary
                                  : context.colorScheme.onBackground,
                              icon: Assets.icons.shop.svg(
                                color: state.tabIndex == 3
                                    ? context.colorScheme.primary
                                    : context.colorScheme.onBackground,
                              ),
                              onTap: () {
                                navigationBloc.add(ChangeTabEvent(3));
                              },
                              title: 'Shop',
                            ),
                            NavigationCard(
                              color: state.tabIndex == 4
                                  ? context.colorScheme.primary
                                  : context.colorScheme.onBackground,
                              icon: CircleAvatar(
                                radius: 15.r,
                                backgroundImage: AssetImage(
                                  Assets.images.nikola.path,
                                ),
                              ),
                              onTap: () {
                                navigationBloc.add(ChangeTabEvent(4));
                              },
                              title: 'My Profile',
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }

          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
