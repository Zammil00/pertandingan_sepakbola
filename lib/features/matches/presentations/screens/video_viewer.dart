import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pertandingan_sepakbola/core/config/app_colors.dart';
import 'package:pertandingan_sepakbola/core/utils/extensions/context_extension.dart';
import 'package:video_player/video_player.dart';

class VideoViewer extends StatefulWidget {
  const VideoViewer({
    super.key,
    required this.url,
  });
  final String url;
  @override
  State<VideoViewer> createState() => _VideoViewerState();
}

class _VideoViewerState extends State<VideoViewer> {
  late VideoPlayerController _controller;
  bool _showControls = true;
  Timer? _hideTimer;
  bool _isMuted = false;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    if (widget.url.contains("https://")) {
      _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url))
        ..initialize().then((_) {
          setState(() {});
        })
        ..setLooping(true);
      _controller.play();
    } else {
      _controller = VideoPlayerController.asset(widget.url)
        ..initialize().then((_) {
          setState(() {});
        })
        ..setLooping(true);
      _controller.play();
    }

    _startHideTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    _hideTimer?.cancel();
    super.dispose();
  }

  void _startHideTimer() {
    _hideTimer?.cancel(); // Reset the timer
    _hideTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _showControls = false;
      });
    });
  }

  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
      if (_showControls) {
        _startHideTimer();
      }
    });
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _controller.setVolume(_isMuted ? 0 : 1); // Toggle mute
    });
  }

  void _seekForward() {
    final currentPosition = _controller.value.position;
    final duration = _controller.value.duration;
    if (currentPosition + const Duration(seconds: 10) < duration) {
      _controller.seekTo(currentPosition + const Duration(seconds: 10));
    }
  }

  void _seekBackward() {
    final currentPosition = _controller.value.position;
    if (currentPosition - const Duration(seconds: 10) > Duration.zero) {
      _controller.seekTo(currentPosition - const Duration(seconds: 10));
    }
  }

  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
      if (_isFullScreen) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      } else {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      }
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: widget.url,
          child: Scaffold(
            extendBodyBehindAppBar: true,
            extendBody: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leadingWidth: 50.w,
              leading: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 8.0.w,
                  ),
                  child: CircleAvatar(
                    backgroundColor: AppColors.backgroundDark.withOpacity(0.3),
                    radius: 20.r,
                    child: Icon(
                      Icons.close,
                      color: AppColors.whiteColor,
                      size: 20.sp,
                    ),
                  ),
                ),
              ),
            ),
            backgroundColor: Colors.black,
            body: GestureDetector(
              onTap: _toggleControls, // Show/Hide controls on tap
              child: SizedBox(
                width: 1.sw,
                height: 1.sh,
                child: Stack(
                  children: [
                    Center(
                      child: _controller.value.isInitialized
                          ? _controller.value.aspectRatio < 1
                              // Portrait video
                              ? SizedBox(
                                  width: 1.sw,
                                  height: 1.sh,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: SizedBox(
                                      width: _controller.value.size.width,
                                      height: _controller.value.size.height,
                                      child: VideoPlayer(_controller),
                                    ),
                                  ),
                                )
                              // Landscape video
                              : AspectRatio(
                                  aspectRatio: _controller.value.aspectRatio,
                                  child: VideoPlayer(_controller),
                                )
                          : const CircularProgressIndicator(),
                    ),
                    if (_showControls) ...[
                      // Play/Pause button and additional controls
                      Positioned.fill(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Rewind 10 seconds
                              IconButton(
                                icon: Icon(Icons.replay_10,
                                    color: Colors.white, size: 30.sp),
                                onPressed: _seekBackward,
                              ),
                              // Play/Pause button
                              CircleAvatar(
                                radius: 30.r,
                                backgroundColor: Colors.black45,
                                child: IconButton(
                                  iconSize: 24.sp,
                                  icon: Icon(
                                    _controller.value.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _controller.value.isPlaying
                                          ? _controller.pause()
                                          : _controller.play();
                                    });
                                    _startHideTimer(); // Reset the timer on interaction
                                  },
                                ),
                              ),
                              // Forward 10 seconds
                              IconButton(
                                icon: Icon(Icons.forward_10,
                                    color: Colors.white, size: 30.sp),
                                onPressed: _seekForward,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Progress bar at the bottom
                      Positioned(
                        bottom: 90.h,
                        left: 0,
                        right: 0,
                        child: Column(
                          children: [
                            VideoProgressIndicator(
                              _controller,
                              allowScrubbing: true,
                              colors: VideoProgressColors(
                                playedColor: context.colorScheme.primary,
                                bufferedColor: Colors.grey,
                                backgroundColor: Colors.white38,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _formatDuration(_controller.value.position),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  Text(
                                    _formatDuration(_controller.value.duration),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Mute/Unmute, Fullscreen button
                      Positioned(
                        bottom: 120.h,
                        right: 15.w,
                        child: Row(
                          children: [
                            // Mute/Unmute button
                            IconButton(
                              icon: Icon(
                                _isMuted ? Icons.volume_off : Icons.volume_up,
                                color: Colors.white,
                                size: 30.sp,
                              ),
                              onPressed: _toggleMute,
                            ),
                            // Fullscreen button
                            IconButton(
                              icon: Icon(
                                _isFullScreen
                                    ? Icons.fullscreen_exit
                                    : Icons.fullscreen,
                                color: Colors.white,
                                size: 30.sp,
                              ),
                              onPressed: _toggleFullScreen,
                            ),
                          ],
                        ),
                      ),
                    ],
                    // Close button at the top-left
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
