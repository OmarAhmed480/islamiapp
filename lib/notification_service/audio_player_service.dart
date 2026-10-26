import 'package:audioplayers/audioplayers.dart';

class AudioPlayerService {
  AudioPlayerService._();

  static final AudioPlayerService instance = AudioPlayerService._();

  final AudioPlayer _player = AudioPlayer();

  String? currentUrl;

  bool isPlaying = false;
  bool isMuted = false;

  Future<void> togglePlay(String url) async {
    if (url.isEmpty) return;


    if (currentUrl == url && isPlaying) {
      await _player.stop();

      isPlaying = false;
      currentUrl = null;
      return;
    }

    await _player.stop();

    isPlaying = false;
    currentUrl = null;

    await _player.setVolume(isMuted ? 0 : 1);
    await _player.play(UrlSource(url));

    currentUrl = url;
    isPlaying = true;
  }


  Future<void> toggleMute() async {
    isMuted = !isMuted;
    await _player.setVolume(isMuted ? 0 : 1);
  }

  Future<void> stop() async {
    await _player.stop();
    isPlaying = false;
    currentUrl = null;
  }

  Future<void> dispose() async {
    await _player.dispose();
  }
}
