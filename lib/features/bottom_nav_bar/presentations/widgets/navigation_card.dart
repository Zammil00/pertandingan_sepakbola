import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pertandingan_sepakbola/core/utils/extensions/context_extension.dart';

class NavigationCard extends StatelessWidget {
  const NavigationCard({
    super.key,
    required this.color,
    required this.icon,
    required this.onTap,
    required this.title,
  });
  final String title;
  final Color color;
  final Function() onTap;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            5.verticalSpace,
            Text(
              title,
              style: context.textTheme.bodySmall!.copyWith(
                fontSize: 11.0,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            )
          ],
        ),
      ),
    );
  }
}
