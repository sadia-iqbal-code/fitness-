import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:untitled1/userProvider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int completedDays = 0;

  final List<String> categories = [
    'Normal',
    'Underweight',
    'Overweight',
    'Obese'
  ];

  final Map<String, Color> themeColors = {
    'Normal': Colors.blueAccent,
    'Underweight': Colors.purpleAccent,
    'Overweight': Colors.orangeAccent,
    'Obese': Colors.redAccent,
  };

  final Map<String, List<Map<String, dynamic>>> plans = {
    'Underweight': List.generate(
      30,
      (index) => {
        'day': 'Day ${index + 1}',
        'quote': '“Gain strength, gain health!”',
        'exercise': [
          'Push-ups for ${10 + index % 5} minutes',
          'Yoga for ${15 + index % 5} minutes',
          'Squats for ${5 + index % 3} minutes',
        ],
        'diet': {
          'breakfast': 'Oatmeal with banana and nuts',
          'lunch': 'Grilled chicken with quinoa and veggies',
          'dinner': 'Salmon with green salad and avocado',
        },
        'isCompleted': false,
      },
    ),
    'Normal': List.generate(
      30,
      (index) => {
        'day': 'Day ${index + 1}',
        'quote': '“Stay consistent, stay healthy!”',
        'exercise': [
          'Jogging for ${15 + index % 5} minutes',
          'Planks for ${5 + index % 3} minutes',
          'Stretching for ${10 + index % 5} minutes',
        ],
        'diet': {
          'breakfast': 'Smoothie with berries, spinach, and protein powder',
          'lunch': 'Grilled turkey sandwich with whole grain bread',
          'dinner': 'Grilled fish with steamed vegetables',
        },
        'isCompleted': false,
      },
    ),
    'Overweight': List.generate(
      30,
      (index) => {
        'day': 'Day ${index + 1}',
        'quote': '“Small steps lead to big changes!”',
        'exercise': [
          'Walking for ${20 + index % 5} minutes',
          'Bodyweight exercises for ${10 + index % 5} minutes',
          'Yoga for relaxation for ${15 + index % 5} minutes',
        ],
        'diet': {
          'breakfast': 'Greek yogurt with a handful of almonds',
          'lunch': 'Grilled chicken salad with olive oil dressing',
          'dinner': 'Vegetable soup with lean meat',
        },
        'isCompleted': false,
      },
    ),
    'Obese': List.generate(
      30,
      (index) => {
        'day': 'Day ${index + 1}',
        'quote': '“Every step is progress!”',
        'exercise': [
          'Walking for ${20 + index % 5} minutes',
          'Chair exercises for ${10 + index % 5} minutes',
          'Light stretching for ${15 + index % 5} minutes',
        ],
        'diet': {
          'breakfast': 'Smoothie with spinach, cucumber, and ginger',
          'lunch': 'Grilled fish with steamed broccoli',
          'dinner': 'Quinoa salad with mixed vegetables',
        },
        'isCompleted': false,
      },
    ),
  };

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String getAppreciationMessage(int completedDays) {
    if (completedDays == 0) return 'Let’s get started! Today is the day! 🌟';
    if (completedDays == 1) return 'Amazing start! Keep it up! 🎉';
    if (completedDays == 2) return 'Great job completing 2 days! 💪';
    if (completedDays == 3) return 'Fantastic progress! You’ve done 3 days! 🌟';
    if (completedDays <= 5)
      return 'Wow! Keep going! Day $completedDays complete! 🚀';
    return 'Incredible! $completedDays days of progress! 🎯';
  }

  @override
  Widget build(BuildContext context) {
    final category = categories[_selectedIndex];
    final themeColor = themeColors[category]!;
    final categoryPlans = plans[category]!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness: $category'),
        backgroundColor: themeColor,
        centerTitle: true,
      ),
      body: Container(
        color: themeColor.withOpacity(0.1),
        child: Column(
          children: [
            Consumer<UserProvider>(
              builder: (context, userProvider, child) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${userProvider.username},Follow plan according to yours BMI and get target weight🎉💪",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                );
              },
            ),
            SizedBox(
              height: 40,
            ),
            // Appreciation Banner
            Text(
              getAppreciationMessage(completedDays),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            _buildProgressIndicator(categoryPlans, themeColor),
            Expanded(
              child: ListView.builder(
                itemCount: categoryPlans.length,
                itemBuilder: (context, index) {
                  final plan = categoryPlans[index];
                  final exercises = plan['exercise'] as List<String>;
                  final diet = plan['diet'] as Map<String, String>;
                  final quote = plan['quote'] as String;

                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                plan['day'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Checkbox(
                                value: plan['isCompleted'],
                                onChanged: (value) {
                                  setState(() {
                                    if (plan['isCompleted'] == false &&
                                        value == true) {
                                      completedDays++;
                                    } else if (plan['isCompleted'] == true &&
                                        value == false) {
                                      completedDays--;
                                    }
                                    plan['isCompleted'] = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            quote,
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: themeColor,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Exercises:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          ...exercises.map((exercise) => Text('- $exercise')),
                          const SizedBox(height: 10),
                          const Text(
                            'Diet:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('• Breakfast: ${diet['breakfast']}'),
                          Text('• Lunch: ${diet['lunch']}'),
                          Text('• Dinner: ${diet['dinner']}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: categories
            .map(
              (category) => BottomNavigationBarItem(
                icon: Icon(Icons.fitness_center, color: themeColors[category]),
                label: category,
              ),
            )
            .toList(),
        currentIndex: _selectedIndex,
        selectedItemColor: themeColor,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildProgressIndicator(
      List<Map<String, dynamic>> plans, Color themeColor) {
    final completedDays =
        plans.where((day) => day['isCompleted'] == true).length;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          LinearProgressIndicator(
            value: completedDays / 30,
            color: themeColor,
            backgroundColor: themeColor.withOpacity(0.3),
          ),
          const SizedBox(height: 8),
          Text(
            '$completedDays of 30 Days Completed',
            style: TextStyle(
              color: themeColor,
              fontWeight: FontWeight.bold,
            ),
          ),

        ],
      ),
    );
  }
}
