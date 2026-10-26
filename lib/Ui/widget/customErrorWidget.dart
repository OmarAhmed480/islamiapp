import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomErrorWidget extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;
  final bool isDark;

  const CustomErrorWidget({
    super.key,
    required this.error,
    required this.onRetry,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            error,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),

          SizedBox(height: 5.h),

          ElevatedButton(
            onPressed: onRetry,
            style: ElevatedButton.styleFrom(
              backgroundColor: isDark ? Colors.white : Colors.black,
              foregroundColor: isDark ? Colors.black : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 10.h,
              ),
            ),
            child: Text(
              "Try Again",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.black : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}