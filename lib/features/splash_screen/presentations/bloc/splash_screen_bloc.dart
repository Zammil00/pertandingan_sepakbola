// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pertandingan_sepakbola/navigation/app_paths.dart';
import 'package:go_router/go_router.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc({required BuildContext context})
      : super(SplashScreenInitial()) {
    on<StartSplashScreenEvent>((event, emit) {
      _startTimer(event, emit);
    });
  }

  Future<void> _startTimer(
    StartSplashScreenEvent event,
    Emitter<SplashScreenState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 4)).then((e) {
      event.context.go(AppPaths.bottomNavBar);
    });
  }
}
