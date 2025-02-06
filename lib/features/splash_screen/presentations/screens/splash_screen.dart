import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pertandingan_sepakbola/core/utils/extensions/context_extension.dart';
import 'package:pertandingan_sepakbola/features/splash_screen/presentations/bloc/splash_screen_bloc.dart';
import 'package:pertandingan_sepakbola/gen/assets.gen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = SplashScreenBloc(context: context);
        bloc.add(StartSplashScreenEvent(context));
        return bloc;
      },
      child: BlocBuilder<SplashScreenBloc, SplashScreenState>(
          builder: (context, state) {
        return Scaffold(
          backgroundColor: context.colorScheme.primary,
          body: Center(
            child: Assets.images.a3ScorersR3021.image(
              width: 100.w,
            ),
          ),
        );
      }),
    );
  }
}
