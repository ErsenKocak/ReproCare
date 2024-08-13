import 'dart:async';
import 'dart:developer';

import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerHandler extends BaseAudioHandler {
  late AudioPlayer _audioPlayer;

  late StreamSubscription<PlayerState> _playerStateStreamSub;
  late StreamSubscription<Duration?> _playerDurationStreamSub;

  AudioPlayerHandler({LoopMode? loopMode}) {
    _audioPlayer = AudioPlayer();
    _audioPlayer.setLoopMode(loopMode ?? LoopMode.off);
  }

  initializeStream() {
    _playerStateStreamSub = _audioPlayer.playerStateStream.listen((event) {
      log('playerStateStream $event');
    });
  }

  initializeDurationStream({
    Function({Duration? totalDuration, required Duration currentDuration})?
        durationStreamFunction,
  }) {
    _playerDurationStreamSub = _audioPlayer.positionStream.listen((event) {
      // log(' Total Duration ${_audioPlayer.duration?.inSeconds}');
      // log('Current Duration Stream $event');
      if (durationStreamFunction != null) {
        durationStreamFunction(
          totalDuration: _audioPlayer.duration,
          currentDuration: event,
        );
      }
    });
  }

  Future<void> play() async {
    await _audioPlayer.play();
  }

  Future<void> setUrl({required String url}) => _audioPlayer.setUrl(url);

  Future<void> setAsset({required String path}) => _audioPlayer.setAsset(path);

  Future<void> playerStop() => _audioPlayer.stop();

  Future<void> pause() async {
    _audioPlayer.pause();
  }

  playerIsPlaying() => _audioPlayer.playing;

  Future<void> setPlayerVolume({required double volume}) =>
      _audioPlayer.setVolume(volume);

  @override
  PlayerState playerState() => _audioPlayer.playerState;

  Future setLoopmode(LoopMode mode) async =>
      await _audioPlayer.setLoopMode(mode).then((value) => Future.value(true));

  Future<void> setAudioSource(AudioSource source) async {
    await _audioPlayer.setAudioSource(source);
  }
}
