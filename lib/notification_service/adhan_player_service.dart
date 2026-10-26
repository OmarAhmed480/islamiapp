import 'package:audioplayers/audioplayers.dart';

class AdhanPlayerService {
  AdhanPlayerService._();

  static final AdhanPlayerService instance = AdhanPlayerService._();

  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> playAdhan() async {
    await _audioPlayer.stop();

    await _audioPlayer.play(AssetSource('audio/adhan.mp3'));
  }

  Future<void> stopAdhan() async {
    await _audioPlayer.stop();
  }

  Future<void> dispose() async {
    await _audioPlayer.dispose();
  }




}
