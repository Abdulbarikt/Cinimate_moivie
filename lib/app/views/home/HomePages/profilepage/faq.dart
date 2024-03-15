import 'package:flutter/material.dart';

class Faq extends StatelessWidget {
  const Faq({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Adjust padding as needed
            child: Container(
              margin: const EdgeInsets.all(20),
              child: const Text('''About  Cinimate
What devices does  Cinimate support?
We support all Smartphones that meet the following requirements:
- Android running Android 5.0 and above.
- iPhone running iOS 12 and above.
- Your phone is able to receive SMS during the verification process.
You will also need a data plan in order to receive messages when outside the range of a Wi-Fi network.

Which country/region is  Cinimate available in?
 Cinimate is globally available in all countries/regions.

How to create a  Cinimate account?
Make sure you use an active phone number to create a  Cinimate account.
An SMS will be delivered to your phone.
The SMS will contain a 6-digit verification code.
The verification code is unique to your account.
Do not guess the verification code.

Will my  Cinimate account work on multiple phones or with multiple numbers?
 Cinimate verifies your account on only one device and one number at a time. If your device is dual-SIM, you need to select the number to use with  Cinimate

Troubleshooting  Cinimate
Contacts management
 Cinimate will ask permission to access your device address book so you can see your contacts who also use  Cinimate

Displaying contacts correctly:
Make sure that your contacts have active  Cinimate accounts
Save the contact details in your device address book with proper formats
Where possible, use the use the full international format: + [country/region code] [full phone number].
Remove any leading zero or special calling codes.
Ensure you accept the  Cinimate contact permission request (or go to your device settings and enable it)
If your device address book allows, ensure that all accounts and groups are set to "visible" or "viewable".
Blocking Contacts
Blocking contacts will prevent you from receiving calls or messages from them:

Blocking Contacts: go to Profile -> Settings -> Account ->Privacy
To un-block, follow the same flow and select the contact to un-block
Note: A blocked contact will still show in your address book.

Receiving or Sending Messages
If you have a bad internet connection, you will not receive  Cinimate messages

In addition, if you still have issues, check the following:

The contact you are messaging has not blocked your number.
Your  Cinimate account registration is complete.
Message Timestamps
If you notice that timestamp on your received messages are incorrect:

Check the time settings on your phone and set it to automatic or network provided.
If you need to set it manually, Make sure you select the correct time zone for your location.'''),
            ),
          ),
        ),
      ),
    );
  }
}
