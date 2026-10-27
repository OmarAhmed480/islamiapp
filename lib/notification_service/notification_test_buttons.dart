import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'notification_service.dart';

class NotificationTestButtons extends StatefulWidget {
  const NotificationTestButtons({super.key});

  @override
  State<NotificationTestButtons> createState() =>
      _NotificationTestButtonsState();
}

class _NotificationTestButtonsState extends State<NotificationTestButtons> {
  final AudioPlayer _adhanPlayer = AudioPlayer();

  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();

    _adhanPlayer.onPlayerComplete.listen((_) {
      if (!mounted) return;

      setState(() {
        _isPlaying = false;
      });
    });
  }

  // تشغيل وإيقاف الأذان
  Future<void> _toggleAdhan() async {
    try {
      if (_isPlaying) {
        // إيقاف الأذان
        await _adhanPlayer.stop();

        if (!mounted) return;

        setState(() {
          _isPlaying = false;
        });

        debugPrint('تم إيقاف الأذان');
      } else {
        // تشغيل الأذان من البداية
        await _adhanPlayer.play(AssetSource('audio/adhan.mp3'), volume: 1.0);

        if (!mounted) return;

        setState(() {
          _isPlaying = true;
        });

        debugPrint('بدأ تشغيل الأذان');
      }
    } catch (e) {
      debugPrint('خطأ في تشغيل الأذان: $e');
    }
  }

  @override
  void dispose() {
    _adhanPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () async {
              try {
                await NotificationService.instance.showTestNotification();

                debugPrint('تم إرسال طلب الإشعار الفوري');
              } catch (e) {
                debugPrint('خطأ في الإشعار: $e');
              }
            },
            icon: const Icon(Icons.notifications_active),
            label: const Text('تجربة الإشعار الفوري'),
          ),
        ),

        const SizedBox(height: 12),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: _toggleAdhan,
            icon: Icon(_isPlaying ? Icons.stop_circle : Icons.mosque),
            label: Text(_isPlaying ? 'تجربه إيقاف الأذان ' : ' تجربه تشغيل الأذان'),
          ),
        ),
      ],
    );
  }
}
