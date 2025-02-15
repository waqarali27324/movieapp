import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sample_app/tabs/watch/controller/youtube_trailer_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeTrailerScreen extends StatelessWidget {
  const YouTubeTrailerScreen({super.key});

  @override
  Widget build(BuildContext context) {

return Scaffold(
      body: GetBuilder<YouTubeTrailerController>(
        builder: (controller) {
          if (controller.trailer == null) {
            return const Center(child: CircularProgressIndicator());
          }

          // Set landscape mode
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ]);

          // YouTube Player Controller
          final ytController = YoutubePlayerController(
            initialVideoId: controller.trailer!.key,
            flags: const YoutubePlayerFlags(
              autoPlay: true,
              mute: false,
              forceHD: true,
              disableDragSeek: true,
              loop: false,
              
            ),
          );

          return YoutubePlayerBuilder(

            player: YoutubePlayer(
              
              controller: ytController,
              showVideoProgressIndicator: true,
              
              onEnded: (metaData) {
                _exitFullScreen();
              },
            ),
            builder: (context, player) {
              return Stack(
                children: [
                  Positioned.fill(child: player),
                ],
              );
            },
          );
        },
      ),
    );
  }

  // Function to exit full-screen mode and go back
  void _exitFullScreen() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    Get.back();
  }
}