import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Privacy Policy",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Effective Date: [01 December 2024]\nLast Updated: [01 December 2024]",
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 16),
              Text(
                "1. Information We Collect",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "a. Personal Information:\n"
                    "- Name\n"
                    "- Age\n"
                    "- Height\n"
                    "- Weight\n"
                    "- Gender\n"
                    "- Target Weight\n\n"
                    "b. Usage Data:\n"
                    "- App usage patterns, such as exercise plans or diet plans accessed.\n"
                    "- Device information (e.g., device type, operating system, and app version).\n\n"
                    "c. Sensitive Data:\n"
                    "- Health-related data (e.g., BMI, fitness goals).\n\n"
                    "d. Automatically Collected Data:\n"
                    "- IP address\n"
                    "- Device identifiers\n"
                    "- Crash logs and analytics data.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "2. How We Use Your Information",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "We use the information we collect for the following purposes:\n"
                    "- To provide personalized diet and exercise plans.\n"
                    "- To track your fitness progress and recommend improvements.\n"
                    "- To improve app functionality and user experience.\n"
                    "- To communicate with you regarding updates or promotions.\n"
                    "- To comply with legal obligations.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "3. Data Sharing and Disclosure",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "We do not sell your personal information. We may share your data with third parties in the following cases:\n"
                    "- Service Providers: To analyze app performance and send notifications.\n"
                    "- Legal Compliance: If required to comply with legal obligations or protect our rights.\n"
                    "- Business Transfers: If the app is merged, acquired, or sold, your data may be transferred to the new owner.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "4. Data Security",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "We take reasonable measures to protect your data from unauthorized access, loss, or misuse. However, no method of transmission over the internet or electronic storage is 100% secure, and we cannot guarantee absolute security.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "5. Your Choices",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "You have the right to:\n"
                    "- Access, update, or delete your personal data.\n"
                    "- Opt-out of data collection by disabling certain features in the app.\n"
                    "- Revoke consent for data processing by contacting us.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "6. Contact Us",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "If you have any questions or concerns about this Privacy Policy or our data practices, please contact us at:\n\n"
                    "Email:  sadiiiqbal143@gmail.com\n"

                    "Address:  Jhelum, Pakistan",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
