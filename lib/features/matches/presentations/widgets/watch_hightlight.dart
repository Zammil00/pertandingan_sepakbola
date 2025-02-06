import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pertandingan_sepakbola/core/config/app_colors.dart';
import 'package:pertandingan_sepakbola/core/utils/extensions/context_extension.dart';
import 'package:pertandingan_sepakbola/features/matches/data/models/match.dart';
import 'package:pertandingan_sepakbola/features/matches/presentations/screens/video_viewer.dart';

class WatchHightlight extends StatelessWidget {
  const WatchHightlight({
    super.key,
    required this.match,
  });
  final MatchModel match;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: context.screenWidth,
          height: 200.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(match.hightlightThumbnail),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.backgroundDark.withOpacity(0.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 200.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        match.teams.home.logo,
                        width: 80.w,
                      ),
                      5.verticalSpace,
                      Text(
                        match.teams.home.name,
                        style: context.textTheme.bodySmall!.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.whiteColor,
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoViewer(
                          url: "assets/videos/h.mp4"
                        ),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 30.r,
                    backgroundColor: AppColors.whiteColor.withOpacity(0.7),
                    child: Icon(
                      Icons.play_arrow,
                      size: 50,
                      color: context.colorScheme.primary,
                    ),
                  ),
                ),
                SizedBox(
                  height: 200.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        match.teams.away.logo,
                        width: 80.w,
                      ),
                      5.verticalSpace,
                      Text(
                        match.teams.away.name,
                        style: context.textTheme.bodySmall!.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.whiteColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 10.h,
          right: 10.w,
          child: Text(
            "Watch Highlight",
            style: context.textTheme.bodySmall!.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.whiteColor,
            ),
          ),
        )
      ],
    );
  }
}
