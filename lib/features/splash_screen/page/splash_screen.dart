import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mycareer_new/features/on_boarding/page/on_boarding.dart';
import 'package:video_player/video_player.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/videos/splash.mp4")
      ..initialize().then((_) {
        debugPrint("Video berhasil diinisialisasi");
        setState(() {});
        _controller.play();
      }).catchError((error) {
        debugPrint("Error inisialisasi video: $error");
      }); // Putar video langsung
    _controller.setLooping(false); // Tidak mengulang
    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => OnBoardingPage()),
        );
      }
    });
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light, // Icon status bar gelap
      ),
    );

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _controller.value.isInitialized
              ? VideoPlayer(_controller)
              : Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
