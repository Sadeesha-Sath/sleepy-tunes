// import 'dart:async';
// import 'package:audio_service/audio_service.dart';
// import 'package:just_audio/just_audio.dart';

// MediaControl playControl = MediaControl(androidIcon: 'drawable/play_arrow', label: 'Play', action: MediaAction.play);
// MediaControl pauseControl = MediaControl(androidIcon: 'drawable/pause', label: 'Pause', action: MediaAction.pause);
// MediaControl stopControl = MediaControl(androidIcon: 'drawable/stop', label: 'Stop', action: MediaAction.stop);

// class AudioPlayerTask extends BackgroundAudioTask {
//   final _player = AudioPlayer();
//   AudioProcessingState _audioProcessingState = AudioProcessingState.none;
//   bool _playing = false;
//   var _playerStateSubscription;
//   var _eventSubscription;

//   @override
//   Future<void> onStart(Map<String, dynamic>? params) {
//     _playerStateSubscription =
//         _player.playerStateStream.where((event) => event == AudioProcessingState.completed).listen((event) {
//       handlePlaybackComplete();
//     });
//     _eventSubscription = _player.playbackEventStream.listen((event) {
//       final bufferingState = AudioProcessingState.buffering;
//       switch (event.processingState) {
//         case AudioService.playbackState.playing:
          
//           break;
//         default:
//       }
//     });
//     return super.onStart(params);
//   }

//   @override
//   Future<void> onPlay() {
//     if (_audioProcessingState == AudioProcessingState.none) {
//       _playing = true;
//       _player.play();
//     }
//     return super.onPlay();
//   }

//   @override
//   Future<void> onPause() {
//     _playing = false;
//     _player.pause();
//     return super.onPause();
//   }

//   @override
//   Future<void> onClick(MediaButton button) {
//     // TODO: implement onClick
//     return super.onClick(button);
//   }

//   @override
//   Future<void> onStop() async {
//     await _player.stop();
//     await _player.dispose();

//     return await super.onStop();
//   }

//   Future<void> _setState({AudioProcessingState? processingState}) async {
//     await AudioServiceBackground.setState(
//         controls: getControls(),
//         processingState: processingState ?? AudioServiceBackground.state.processingState,
//         playing: _playing);
//   }

//   List<MediaControl> getControls() {
//     if (_playing) {
//       return [pauseControl, stopControl];
//     }
//     return [playControl, stopControl];
//   }
// }
