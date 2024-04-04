import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'app_text.dart';
import 'home_page_model.dart';

class BottomBarItemWidget extends StatelessWidget {
  final bool isSelected;
  final HomePageModel item;

  const BottomBarItemWidget({
    super.key,
    required this.isSelected,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: SizedBox(
        width: 1.sw / 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10.h),
            SvgPicture.asset(
              isSelected ? item.selectedIconUrl : item.unselectedIconUrl,
              width: 25.w,
              height: 25.w,
              colorFilter: ColorFilter.mode(
                isSelected ? Colors.blueAccent : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(height: 5.h),
            AppText(
              item.name,
              fontSize: 10.5.sp,
              color: isSelected ? Colors.blueAccent : Colors.grey,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
