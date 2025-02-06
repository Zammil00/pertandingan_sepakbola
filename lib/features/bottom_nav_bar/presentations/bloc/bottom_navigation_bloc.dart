import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pertandingan_sepakbola/features/fantasy/presentations/screens/fantasy.dart';
import 'package:pertandingan_sepakbola/features/home/presentations/screens/home.dart';
import 'package:pertandingan_sepakbola/features/matches/presentations/widgets/match_navigator.dart';
import 'package:pertandingan_sepakbola/features/my_profile/presentations/screens/my_profile.dart';
import 'package:pertandingan_sepakbola/features/shop/presentations/screens/shop.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  final List<Widget> screens = [
    const Home(),
    const Matches(),
    const Fantasy(),
    const Shop(),
    const MyProfile(),
  ];

  BottomNavigationBloc() : super(const BottomNavigationInitial()) {
    on<ChangeTabEvent>((event, emit) {
      emit(
        BottomNavigationUpdated(
          tabIndex: event.tabIndex,
          currentScreen: screens[event.tabIndex],
        ),
      );
    });
  }
}
