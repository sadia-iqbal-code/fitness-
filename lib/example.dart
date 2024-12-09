
import 'package:flutter/material.dart';
import 'package:untitled1/nameScreen.dart';
import 'package:untitled1/signUpScreen.dart';
import 'package:video_player/video_player.dart';

class FitnessVideoScreen extends StatefulWidget {
    @override
    _FitnessVideoScreenState createState() => _FitnessVideoScreenState();
}

class _FitnessVideoScreenState extends State<FitnessVideoScreen> {
    late VideoPlayerController _controller;
    bool _isButtonEnabled = false; // Initially, the button is disabled

    @override
    void initState() {
        super.initState();

        // Initialize video controller
        _controller = VideoPlayerController.asset('assets/exee.mp4')
            ..initialize().then((_) {
                setState(() {
                    _controller.setLooping(true);
                    _controller.setVolume(5.0); // High volume
                    _controller.play();

                    // Enable button after 5 seconds
                    Future.delayed(Duration(seconds: 7), () {
                        setState(() {
                            _isButtonEnabled = true;
                        });
                    });
                });
            }).catchError((error) {
                print("Video initialization error: $error");
            });
    }

    @override
    void dispose() {
        if (_controller.value.isInitialized) {
            _controller.dispose();
        }
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Stack(
                children: [
                    // Background video
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

                    // Foreground UI
                    Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                // Small image at the center
                                Image.asset(
                                    'assets/fit.png',
                                    height: 100, // Adjust size as needed
                                    width: 100,
                                ),
                                SizedBox(height: 100),
                                // "Get Started" button
                                ElevatedButton(
                                    onPressed: _isButtonEnabled
                                        ? () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => AuthScreen()), // Replace with your next screen
                                        );
                                    }
                                        : null, // Disable button until 5 seconds have passed
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: _isButtonEnabled
                                            ? Colors.teal
                                            : Colors.grey, // Button color based on state
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 8),
                                    ),
                                    child: Text(
                                        'Get Started',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                        ),
                                    ),
                                ),
                            ],
                        ),
                    ),
                ],
            ),
        );
    }
}


