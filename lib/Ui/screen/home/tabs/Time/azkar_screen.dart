import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/models/azkar_mode/morning_azkar.dart';
import 'package:islami_app/uitils/app_assets.dart';
import 'package:islami_app/uitils/app_colors.dart';

class AzkarScreen extends StatefulWidget {
  final String azkarType;

  const AzkarScreen({super.key, required this.azkarType});

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  late Future<List<MorningAzkar>> azkarFuture;

  @override
  void initState() {
    super.initState();
    azkarFuture = MorningAzkar.loadAzkarContent(widget.azkarType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.gold),
        centerTitle: true,
        title: Text(widget.azkarType,style: TextStyle(color: AppColors.gold),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: FutureBuilder<List<MorningAzkar>>(
        future: azkarFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'حدث خطأ: ${snapshot.error}',
                textDirection: TextDirection.rtl,
                style: const TextStyle(color: Colors.white),
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'لا توجد أذكار',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          final azkarList = snapshot.data!.take(8).toList();

          return ListView.builder(


            itemCount: azkarList.length,
            itemBuilder: (context, index) {
              final zekr = azkarList[index];

              return Container(
                margin: REdgeInsets.all(8) ,
                padding: REdgeInsets.all(5)  ,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.gold),
                    borderRadius: BorderRadius.circular(16.r)),
                child: Card(
                  color: AppColors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text(
                    zekr.content ?? '',
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style:  TextStyle(
                      fontSize: 22.sp,
                      height: 1.8.h,
                      color: AppColors.gold,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
