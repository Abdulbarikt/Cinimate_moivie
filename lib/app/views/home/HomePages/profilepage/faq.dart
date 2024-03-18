import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';

class Faq extends StatelessWidget {
  const Faq({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.kBlackColor,
        title: const Text(
          'FAQ',
          style: TextStyle(
              color: AppColors.kWhite,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0), // Adjust padding as needed
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FaqItem(
              question: 'About Cinimate',
              answer:
                  '''What devices does Cinimate support?\n\nWe support all Smartphones that meet the following requirements:\n- Android running Android 5.0 and above.\n- iPhone running iOS 12 and above.\n- Your phone is able to receive SMS during the verification process.\nYou will also need a data plan in order to receive messages when outside the range of a Wi-Fi network.\n\nWhich country/region is Cinimate available in?\nCinimate is globally available in all countries/regions.\n\nHow to create a Cinimate account?\nMake sure you use an active phone number to create a Cinimate account.\nAn SMS will be delivered to your phone.\nThe SMS will contain a 6-digit verification code.\nThe verification code is unique to your account.\nDo not guess the verification code.\n\nWill my Cinimate account work on multiple phones or with multiple numbers?\nCinimate verifies your account on only one device and one number at a time. If your device is dual-SIM, you need to select the number to use with Cinimate''',
            ),
            FaqItem(
              question: 'Troubleshooting Cinimate',
              answer:
                  '''Contacts management\nCinimate will ask permission to access your device address book so you can see your contacts who also use Cinimate\n\nDisplaying contacts correctly:\nMake sure that your contacts have active Cinimate accounts\nSave the contact details in your device address book with proper formats\nWhere possible, use the use the full international format: + [country/region code] [full phone number].\nRemove any leading zero or special calling codes.\nEnsure you accept the Cinimate contact permission request (or go to your device settings and enable it)\nIf your device address book allows, ensure that all accounts and groups are set to "visible" or "viewable".\n\nBlocking Contacts\nBlocking contacts will prevent you from receiving calls or messages from them:\n\nBlocking Contacts: go to Profile -> Settings -> Account ->Privacy\nTo un-block, follow the same flow and select the contact to un-block\nNote: A blocked contact will still show in your address book.\n\nReceiving or Sending Messages\nIf you have a bad internet connection, you will not receive Cinimate messages\n\nIn addition, if you still have issues, check the following:\n\nThe contact you are messaging has not blocked your number.\nYour Cinimate account registration is complete.\nMessage Timestamps\nIf you notice that timestamp on your received messages are incorrect:\n\nCheck the time settings on your phone and set it to automatic or network provided.\nIf you need to set it manually, Make sure you select the correct time zone for your location.''',
            ),
          ],
        ),
      ),
    );
  }
}

class FaqItem extends StatelessWidget {
  final String question;
  final String answer;

  const FaqItem({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        question,
        style: const TextStyle(
          color: AppColors.kWhite,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            answer,
            style: const TextStyle(
              color: AppColors.kWhite,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Faq(),
  ));
}
