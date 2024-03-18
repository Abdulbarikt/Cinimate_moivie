import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      appBar: AppBar(
        backgroundColor: AppColors.kBlackColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Help',
          style: TextStyle(
              color: AppColors.kWhite,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to the Help Page!',
                style: TextStyle(
                  color: AppColors.kWhite,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'If you are experiencing issues with our app or have any questions, we are here to help!',
                style: TextStyle(fontSize: 18.0, color: AppColors.kWhite),
              ),
              SizedBox(height: 16.0),
              ExpansionTile(
                title: Text(
                  'Common FAQs',
                  style: TextStyle(
                    color: AppColors.kWhite,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'How do I reset my password?',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: AppColors.kWhite,
                      ),
                    ),
                    subtitle: Text(
                      'If you forgot your password, you can use the "Forgot Password" feature on the login screen to reset it.',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: AppColors.kWhite,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'How can I update my profile information?',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: AppColors.kWhite,
                      ),
                    ),
                    subtitle: Text(
                      'You can update your profile information by navigating to the "Settings" page within the app.',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: AppColors.kWhite,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Contact Us',
                style: TextStyle(
                  color: AppColors.kWhite,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'If you have any further questions or need assistance, feel free to contact our support team at support@example.com.',
                style: TextStyle(
                  fontSize: 14.0,
                  color: AppColors.kWhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
