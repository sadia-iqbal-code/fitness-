import 'package:flutter/material.dart';
import 'package:untitled1/nameScreen.dart';

class FitnessOnboardingScreen extends StatefulWidget {
  @override
  _FitnessOnboardingScreenState createState() =>
      _FitnessOnboardingScreenState();
}

class _FitnessOnboardingScreenState extends State<FitnessOnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'image': 'assets/free.avif', // Add your assets
      'title': 'Track Your Workouts',
      'description': 'Monitor your fitness progress and stay on track with personalized plans.',
    },
    {
      'image': 'assets/free2.avif',
      'title': 'Achieve Your Goals',
      'description': 'Set goals and crush them with our effective fitness tracking tools.',
    },
    {
      'image': 'assets/free1.avif',
      'title': 'Join the Community',
      'description': 'Connect with fitness enthusiasts and find your motivation.',
    },
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView for onboarding content
          PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: _onboardingData.length,
            itemBuilder: (context, index) {
              return OnboardingPage(
                image: _onboardingData[index]['image']!,
                title: _onboardingData[index]['title']!,
                description: _onboardingData[index]['description']!,
              );
            },
          ),

          // Navigation dots and buttons
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              children: [
                // Dots Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _onboardingData.length,
                        (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      height: 8,
                      width: _currentPage == index ? 24 : 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.blue
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (_currentPage < _onboardingData.length - 1)
                      TextButton(
                        onPressed: () {
                          _pageController.jumpToPage(_onboardingData.length - 1);
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        if (_currentPage < _onboardingData.length - 1) {
                          _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease);
                        } else {
                          _navigateToHome(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 30, vertical: 12),
                      ),
                      child: Text(
                        _currentPage < _onboardingData.length - 1
                            ? 'Next'
                            : 'Get Started',
                      ),
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

  void _navigateToHome(BuildContext context) {
    // Navigate to your app's main screen
    Navigator.push(context, MaterialPageRoute(builder: (context)=>nameScreen()));
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Image.asset(image, fit: BoxFit.cover),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
