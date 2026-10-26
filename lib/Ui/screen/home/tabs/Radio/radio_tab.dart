import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/models/reciters_model/Moshaf.dart';
import 'package:islami_app/models/reciters_model/Reciters.dart';
import 'package:islami_app/models/reciters_response_model.dart';
import 'package:islami_app/Ui/screen/home/tabs/Radio/wedget/customRadioIcon.dart';
import 'package:islami_app/Ui/screen/home/tabs/Radio/wedget/customRadioTab.dart';
import 'package:islami_app/Ui/widget/customErrorWidget.dart';
import 'package:islami_app/Ui/widget/customLoadingWidget.dart';

import 'package:islami_app/api/dio_manager.dart';
import 'package:islami_app/function/dialogUtils.dart';
import 'package:islami_app/models/radios_model/Radios_response_model.dart';

import 'package:islami_app/notification_service/audio_player_service.dart';

import 'package:islami_app/uitils/app_assets.dart';
import 'package:islami_app/uitils/app_colors.dart';
import 'package:islami_app/uitils/app_style.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int isSelected = 0;

  bool radioPlaying = false;
  bool radioMuted = false;
  bool isLoadingAudio = false;

  String? currentPlayingUrl;

  int? selectedReciterId;
  int selectedSurahNumber = 1;

  late Future<RadiosResponseModel> radiosFuture;
  late Future<RecitersResponseModel> recitersFuture;

  final AudioPlayerService audioService = AudioPlayerService.instance;

  static const List<String> surahNames = [
    'الفاتحة',
    'البقرة',
    'آل عمران',
    'النساء',
    'المائدة',
    'الأنعام',
    'الأعراف',
    'الأنفال',
    'التوبة',
    'يونس',
    'هود',
    'يوسف',
    'الرعد',
    'إبراهيم',
    'الحجر',
    'النحل',
    'الإسراء',
    'الكهف',
    'مريم',
    'طه',
    'الأنبياء',
    'الحج',
    'المؤمنون',
    'النور',
    'الفرقان',
    'الشعراء',
    'النمل',
    'القصص',
    'العنكبوت',
    'الروم',
    'لقمان',
    'السجدة',
    'الأحزاب',
    'سبأ',
    'فاطر',
    'يس',
    'الصافات',
    'ص',
    'الزمر',
    'غافر',
    'فصلت',
    'الشورى',
    'الزخرف',
    'الدخان',
    'الجاثية',
    'الأحقاف',
    'محمد',
    'الفتح',
    'الحجرات',
    'ق',
    'الذاريات',
    'الطور',
    'النجم',
    'القمر',
    'الرحمن',
    'الواقعة',
    'الحديد',
    'المجادلة',
    'الحشر',
    'الممتحنة',
    'الصف',
    'الجمعة',
    'المنافقون',
    'التغابن',
    'الطلاق',
    'التحريم',
    'الملك',
    'القلم',
    'الحاقة',
    'المعارج',
    'نوح',
    'الجن',
    'المزمل',
    'المدثر',
    'القيامة',
    'الإنسان',
    'المرسلات',
    'النبأ',
    'النازعات',
    'عبس',
    'التكوير',
    'الانفطار',
    'المطففين',
    'الانشقاق',
    'البروج',
    'الطارق',
    'الأعلى',
    'الغاشية',
    'الفجر',
    'البلد',
    'الشمس',
    'الليل',
    'الضحى',
    'الشرح',
    'التين',
    'العلق',
    'القدر',
    'البينة',
    'الزلزلة',
    'العاديات',
    'القارعة',
    'التكاثر',
    'العصر',
    'الهمزة',
    'الفيل',
    'قريش',
    'الماعون',
    'الكوثر',
    'الكافرون',
    'النصر',
    'المسد',
    'الإخلاص',
    'الفلق',
    'الناس',
  ];

  @override
  void initState() {
    super.initState();

    radiosFuture = DioManager.getRadioData();
    recitersFuture = DioManager.getReciters();

    currentPlayingUrl = audioService.currentUrl;
    radioPlaying = audioService.isPlaying;
    radioMuted = audioService.isMuted;
  }

  void retryRadios() {
    setState(() {
      radiosFuture = DioManager.getRadioData();
    });
  }

  void retryReciters() {
    setState(() {
      recitersFuture = DioManager.getReciters();
    });
  }

  @override
  void dispose() {
    audioService.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            TabBar(
              onTap: (index) {
                setState(() {
                  isSelected = index;
                });
              },
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              tabs: [
                Tab(
                  child: CustomRadioTab(
                    title: 'Radio',
                    isSelected: isSelected == 0,
                  ),
                ),
                Tab(
                  child: CustomRadioTab(
                    title: 'Reciters',
                    isSelected: isSelected == 1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: TabBarView(
                children: [_buildRadiosList(), _buildRecitersList()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==================== RADIO LIST ====================
  Widget _buildRadiosList() {
    return FutureBuilder<RadiosResponseModel>(
      future: radiosFuture,
      builder: (context, snapshot) {
        // Loading state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CustomLoadingWidget();
        }

        // Error state
        if (snapshot.hasError) {
          return CustomErrorWidget(
            error: snapshot.error.toString(),
            onRetry: retryRadios,
          );
        }

        final radios = snapshot.data?.radios ?? [];

        // Empty state

        if (radios.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 110.w,
                  height: 110.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.gold.withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.radio_rounded,
                    size: 60.sp,
                    color: AppColors.gold,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  'No radio stations available',
                  textAlign: TextAlign.center,
                  style: AppStyle.bold20bl,
                ),
              ],
            ),
          );
        }

        // Radios list
        return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          itemCount: radios.length,
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            final radio = radios[index];
            final radioUrl = radio.url ?? '';

            final isThisRadioPlaying =
                currentPlayingUrl == radioUrl && audioService.isPlaying;

            return _buildRadioCard(
              title: radio.name ?? 'Unknown Radio',
              isPlaying: isThisRadioPlaying,
              isMuted: isThisRadioPlaying && audioService.isMuted,

              // Play radio
              onPlayTap: () async {
                if (radioUrl.isEmpty) {
                  await DialogUtils.showMessageDialog(
                    context: context,
                    title: 'Invalid Radio',
                    text: 'The radio station URL is unavailable.',
                    icon: Icons.error_outline,
                    iconColor: Colors.red,
                    showOkButton: true,
                  );
                  return;
                }

                await _handleRadioPlay(radioUrl);
              },

              // Mute / Unmute radio
              onMuteTap: () async {
                if (!isThisRadioPlaying) return;

                try {
                  await audioService.toggleMute();

                  if (!mounted) return;

                  setState(() {
                    radioMuted = audioService.isMuted;
                  });
                } catch (e, stackTrace) {
                  debugPrint('Mute error: $e');
                  debugPrintStack(stackTrace: stackTrace);

                  if (!mounted) return;

                  await DialogUtils.showMessageDialog(
                    context: context,
                    title: 'Audio Error',
                    text: 'تعذر تغيير مستوى الصوت، حاول مرة أخرى.',
                    icon: Icons.error_outline,
                    iconColor: Colors.red,
                    showOkButton: true,
                  );
                }
              },
            );
          },
        );
      },
    );
  }

  // ==================== PLAY RADIO ====================

  Future<void> _handleRadioPlay(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null ||
        !uri.hasScheme ||
        (uri.scheme != 'http' && uri.scheme != 'https') ||
        uri.host.isEmpty) {
      await DialogUtils.showMessageDialog(
        context: context,
        title: 'Invalid URL',
        text: 'The audio URL is invalid.',
        icon: Icons.error_outline,
        iconColor: Colors.red,
        showOkButton: true,
      );
      return;
    }

    setState(() {
      isLoadingAudio = true;
    });

    // Show loading dialog
    final loadingDialog = DialogUtils.showLoadingDialog(
      context: context,
      backgroundColor: Colors.white,
      circularBackground: Colors.green,
    );

    try {
      await audioService.togglePlay(url);

      if (!mounted) return;

      setState(() {
        currentPlayingUrl = url;
        radioPlaying = true;
        radioMuted = false;
      });
    } catch (e) {
      if (!mounted) return;

      await DialogUtils.showMessageDialog(
        context: context,
        title: 'Playback Error',
        text: 'Failed to play audio. Please try again.',
        icon: Icons.error_outline,
        iconColor: Colors.red,
        showOkButton: true,
        onPressedOk: () {
          debugPrint('Audio playback error: $e');
        },
      );
    } finally {
      // Close loading dialog
      if (mounted) {
        Navigator.of(context, rootNavigator: true).pop();

        setState(() {
          isLoadingAudio = false;
        });
      }

      await loadingDialog;
    }
  }

  // ==================== RECITERS LIST ====================

  Widget _buildRecitersList() {
    return FutureBuilder<RecitersResponseModel>(
      future: recitersFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CustomLoadingWidget();
        }

        if (snapshot.hasError) {
          return CustomErrorWidget(
            error: snapshot.error.toString(),
            onRetry: retryReciters,
          );
        }

        final reciters = snapshot.data?.reciters ?? <Reciters>[];
        if (reciters.isEmpty) {
          return const Center(child: Text('No reciters available'));
        }

        return ListView.builder(
          itemCount: reciters.length,
          itemBuilder: (context, index) {
            final reciter = reciters[index];

            final List<Moshaf> moshafList = reciter.moshaf ?? <Moshaf>[];

            final Moshaf? moshaf = moshafList.isNotEmpty
                ? moshafList.first
                : null;

            final String server = moshaf?.server ?? '';

            final bool isThisReciterPlaying =
                server.isNotEmpty &&
                audioService.currentUrl?.startsWith(server) == true &&
                audioService.isPlaying;

            final int reciterSurahNumber = selectedReciterId == reciter.id
                ? selectedSurahNumber
                : 1;

            return Container(
              margin: EdgeInsets.only(bottom: 12.h),
              padding: EdgeInsets.all(14.w),
              decoration: BoxDecoration(
                color: AppColors.gold,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                children: [
                  Text(
                    reciter.name ?? 'قارئ غير معروف',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyle.bold20bl,
                  ),

                  SizedBox(height: 12.h),

                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.black,
                      foregroundColor: AppColors.gold,
                    ),
                    onPressed: () async {
                      if (server.isEmpty) {
                        await DialogUtils.showMessageDialog(
                          context: context,
                          title: 'تنبيه',
                          text: 'رابط التلاوات غير متاح لهذا القارئ.',
                          icon: Icons.warning_amber_rounded,
                          iconColor: Colors.orange,
                          showOkButton: true,
                        );
                        return;
                      }

                      final surahNumber = await _showSurahPicker();

                      if (surahNumber == null || !mounted) {
                        return;
                      }

                      setState(() {
                        selectedReciterId = reciter.id;
                        selectedSurahNumber = surahNumber;
                      });

                      await _playReciterSurah(
                        server: server,
                        surahNumber: surahNumber,
                      );
                    },
                    icon: const Icon(Icons.menu_book),
                    label: Text(
                      selectedReciterId == reciter.id
                          ? 'سورة ${surahNames[selectedSurahNumber - 1]}'
                          : 'اختيار السورة',
                    ),
                  ),

                  SizedBox(height: 8.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomRadioIcon(
                        isSelected: isThisReciterPlaying,
                        selectedIcon: AppAssets.stop,
                        unSelectedIcon: AppAssets.paley,
                        onTap: () async {
                          if (server.isEmpty) {
                            await DialogUtils.showMessageDialog(
                              context: context,
                              title: 'تنبيه',
                              text: 'رابط التلاوات غير متاح لهذا القارئ.',
                              icon: Icons.warning_amber_rounded,
                              iconColor: Colors.orange,
                              showOkButton: true,
                            );
                            return;
                          }

                          if (selectedReciterId != reciter.id) {
                            setState(() {
                              selectedReciterId = reciter.id;
                              selectedSurahNumber = 1;
                            });
                          }

                          await _playReciterSurah(
                            server: server,
                            surahNumber: reciterSurahNumber,
                          );
                        },
                      ),

                      SizedBox(width: 24.w),

                      CustomRadioIcon(
                        isSelected:
                            isThisReciterPlaying && audioService.isMuted,
                        selectedIcon: AppAssets.volumeCross,
                        unSelectedIcon: AppAssets.volumeHigh,
                        onTap: () async {
                          if (!isThisReciterPlaying) {
                            return;
                          }

                          try {
                            await audioService.toggleMute();

                            if (mounted) {
                              setState(() {
                                radioMuted = audioService.isMuted;
                              });
                            }
                          } catch (e) {
                            debugPrint('Mute error: $e');
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // ==================== PLAY RECITER SURAH ====================

  Future<void> _playReciterSurah({
    required String server,
    required int surahNumber,
  }) async {
    final normalizedServer = server.endsWith('/') ? server : '$server/';

    final surahUrl =
        '$normalizedServer${surahNumber.toString().padLeft(3, '0')}.mp3';

    await _handleRadioPlay(surahUrl);
  }

  // ==================== SURAH PICKER ====================

  Future<int?> _showSurahPicker() async {
    return showDialog<int>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: AppColors.gold,
          title: Text(
            'اختار السورة',
            textAlign: TextAlign.center,
            style: AppStyle.bold20bl,
          ),
          content: SizedBox(
            width: double.maxFinite,
            height: 400.h,
            child: ListView.builder(
              itemCount: surahNames.length,
              itemBuilder: (context, index) {
                final surahNumber = index + 1;

                return ListTile(
                  title: Text(
                    '${surahNames[index]} - $surahNumber',
                    textAlign: TextAlign.center,
                    style: AppStyle.bold20bl,
                  ),
                  onTap: () {
                    Navigator.pop(dialogContext, surahNumber);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  // ==================== RADIO CARD ====================

  Widget _buildRadioCard({
    required String title,
    required bool isPlaying,
    required bool isMuted,
    required VoidCallback onPlayTap,
    required VoidCallback onMuteTap,
  }) {
    return Container(
      height: 141.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.gold,
      ),
      child: Stack(
        children: [
          Positioned(
            top: isPlaying ? 90.h : 55.h,
            left: 1.w,
            right: 1.w,
            child: Image.asset(
              isPlaying ? AppAssets.rectangle : AppAssets.imgBottomDecoration,
              width: double.infinity,
              fit: BoxFit.cover,
              color: AppColors.black,
            ),
          ),
          Positioned(
            top: 10.h,
            left: 10.w,
            right: 10.w,
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyle.bold20bl,
            ),
          ),
          Positioned(
            bottom: 20.h,
            left: 0,
            right: 20.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                CustomRadioIcon(
                  isSelected: isPlaying,
                  selectedIcon: AppAssets.stop,
                  unSelectedIcon: AppAssets.paley,
                  onTap: onPlayTap,
                ),
                SizedBox(width: 20.w),
                CustomRadioIcon(
                  isSelected: isMuted,
                  selectedIcon: AppAssets.volumeCross,
                  unSelectedIcon: AppAssets.volumeHigh,
                  onTap: onMuteTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
