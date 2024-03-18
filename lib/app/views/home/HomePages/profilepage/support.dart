import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      appBar: AppBar(
        backgroundColor: AppColors.kBlackColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Support Us',
          style: TextStyle(
              color: AppColors.kWhite,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to the Support Us Page!',
                style: TextStyle(
                  fontSize: 24.0,
                  color: AppColors.kWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              ExpansionTile(
                title: Text(
                  'Ways to Support',
                  style: TextStyle(
                    color: AppColors.kWhite,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'Spread the Word',
                      style: TextStyle(color: AppColors.kWhite, fontSize: 18.0),
                    ),
                    subtitle: Text(
                      'Tell your friends and family about our app. Word of mouth helps us grow!',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: AppColors.kWhite,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Rate and Review',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: AppColors.kWhite,
                      ),
                    ),
                    subtitle: Text(
                      'If you enjoy using our app, please consider leaving a positive review on the app store. Your feedback is invaluable!',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: AppColors.kWhite,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Provide Feedback',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: AppColors.kWhite,
                      ),
                    ),
                    subtitle: Text(
                      'We value your input! If you have suggestions for improvement or encounter any issues, please let us know at feedback@example.com.',
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
                'Thank you for your support!',
                style: TextStyle(
                  fontSize: 20.0,
                  color: AppColors.kWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
