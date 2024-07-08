import 'package:emo_diary/src/constants/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BuildEmotionButton extends StatelessWidget {
  const BuildEmotionButton(
      {super.key,
      required this.isSelected,
      required this.label,
      required this.asset});
  final bool isSelected;
  final String label;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Column(
        children: [
          Container(
            width: 20.w,
            height: 15.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(78),
                border: Border.all(
                  color: isSelected ? Colors.orange : Colors.white,
                  width: 2,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1CB5A1C0),
                    blurRadius: 10.80,
                    offset: Offset(3, 4),
                    spreadRadius: 10,
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                asset.endsWith('.svg')
                    ? SvgPicture.asset(
                        asset,
                        height: 6.h,
                      )
                    : Image.asset(
                        asset,
                        height: 6.h,
                      ),
                SizedBox(height: 1.h),
                Text(
                  label,
                  style: AppTextStyles.emotionLabel.copyWith(fontSize: 14.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
