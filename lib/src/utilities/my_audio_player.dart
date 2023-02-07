import 'package:audioplayers/audioplayers.dart';

class MyAudioPlayer {
  // Singleton instance code
  static final MyAudioPlayer _instance = MyAudioPlayer._();
  static MyAudioPlayer get instance => _instance;
  MyAudioPlayer._();

  final AudioCache _audioCache = AudioCache(prefix: 'assets/audio/');

  Future<void> init() => _audioCache.loadAll([
        'applause.mp3',
        'receive.mp3',
        'sent.mp3',
        'level fail sound.mp3',
        'button tap.mp3',
        'tap failed.mp3',
        'success.wav',
        'scratching.mp3',
      ]);

  Future<AudioPlayer> playMessageSent() => _audioCache.play('sent.mp3');

  Future<AudioPlayer> playMessageReceived() => _audioCache.play('receive.mp3');

  Future<AudioPlayer> playApplause() => _audioCache.play('applause.mp3');
  Future<AudioPlayer> playLevelFailed() =>
      _audioCache.play('level fail sound.mp3');
  Future<AudioPlayer> playSuccess() => _audioCache.play('success.wav');
  Future<AudioPlayer> playButtonTap() => _audioCache.play('button tap.mp3');
  Future<AudioPlayer> playTapFailed() => _audioCache.play('tap failed.mp3');
}