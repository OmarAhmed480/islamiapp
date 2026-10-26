import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableGridView extends StatelessWidget {
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double childAspectRatio;
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;

  const ReusableGridView({
    super.key,
    this.crossAxisCount = 2,
    this.crossAxisSpacing = 12,
    this.mainAxisSpacing = 12,
    this.childAspectRatio = 0.68,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing.w,
        mainAxisSpacing: mainAxisSpacing.h,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
