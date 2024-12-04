import 'package:flutter/material.dart';
import 'package:untitled1/onBoardingScreen.dart';

    import 'package:video_player/video_player.dart';

    class BackgroundVideoScreen extends StatefulWidget {
    @override
    _BackgroundVideoScreenState createState() => _BackgroundVideoScreenState();
    }

    class _BackgroundVideoScreenState extends State<BackgroundVideoScreen> {
    late VideoPlayerController _controller;

    @override
    void initState() {
    super.initState();
    // Initialize the video controller
    _controller = VideoPlayerController.asset('assets/piyari.mp4')
    ..initialize().then((_) {
    // Once the video is initialized, start playing
    setState(() {
    _controller.setLooping(true);
    _controller.setVolume(8);
    _controller.play();
    });
    });
    }

    @override
    void dispose() {
    // Dispose of the controller when not in use
    _controller.dispose();
    super.dispose();
    }

    @override
    Widget build(BuildContext context) {
    return Scaffold(
    body: Stack(
    children: [
    // Background Video
    _controller.value.isInitialized
    ? SizedBox.expand(
    child: FittedBox(
    fit: BoxFit.cover,
    child: SizedBox(
    width: _controller.value.size.width,
    height: _controller.value.size.height,
    child: VideoPlayer(_controller),
    ),
    ),
    )
        : Center(child: CircularProgressIndicator()),

    // Foreground content
    Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Image(image: AssetImage('assets/fit.png'),height: 200,width: 200,),
    SizedBox(height: 20),
    Column(
        crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal,),
        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>FitnessOnboardingScreen()));},
        child: Text('Get Started',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
        ),
      ],
    ),
    ],
    ),
    ),
    ],
    ),
    );
    }
    }
