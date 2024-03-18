import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';

class Terms extends StatelessWidget {
  const Terms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.kBlackColor,
        centerTitle: true,
        title: const Text(
          'Terms of Service',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.kWhite,
          ),
        ),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TermsItem(
                title: 'Terms of Use',
                content:
                    '''Thanks for using our services. These Terms of Use (this Agreement) are provided by Poptin Ltd (the owner of Cinimate.app AKA “We” or “Us” or “Cinimate“) to you (“You” or “User/s“), and regulate the terms under which You shall use the Services (as defined therein). By accessing or using the Website, You sign that You have read, understood and agree to be bound by this Agreement. If you do not agree with the Agreement, You shall discontinue using the Services immediately. This Agreement includes the Privacy Policy (the “Privacy Policy“) as an integral part herein and shall apply to all Users. This Agreement was last updated on 28 December, 2021. It is effective between You and Us as of the date of You accepting this Agreement and in accordance with its terms and conditions as such may be updated from time to time in Our sole discretion.''',
              ),
              TermsItem(
                title: 'Definitions',
                content:
                    '''“Account” means the account opened within the Service under Your subscribed name;\n\n“Content” means, without limitation, text, graphics, and images, including photographs;\n\n“Malicious Code” means viruses, worms, time bombs, trojan horses and any and all other harmful code, files, scripts, agents or programs;\n\n“Cinimate” refers to our company, known as Poptin Ltd. our Website, our Service or a combination of all or some of the preceding definitions, depending on the context of the word;\n\n“Service(s)” refers collectively and/or individually, as the case may be, to the SaaS services that we provide through our Website, any other services we provide, as well as our Website itself;\n\n“You” or “User/s” includes, without limitation, individuals and entities authorised to use the Service as well as Your employees, consultants, contractors and agents;\n\n“User Data” includes all Content that a User posts, uploads, publishes, submits or transmits to be made available through the Website.\n\n“Website” refers to our website, available at https://Cinimate.app/''',
              ),
              TermsItem(
                title: 'The Service',
                content:
                    '''Cinimate is a SaaS (Software as a Service) software that allows users to display a chat button on their website and easily connect with their customers on their favorite messaging app like Messenger, WhatsApp, Telegram, Skype, Viber, and more!\n\nOur software is made available online and without requiring the purchase of a physical copy in order to use it;\n\nWe hereby grant to You a non-exclusive, non-transferable license to electronically access and use the Services and the Website in accordance with the terms of this Agreement, subject to Your (i) opening an Account with Us; (ii) subscribing as set forth on the Website and herein; and (iii) adhering to the terms and conditions of this Agreement;\n\nIn order to use the Service, You shall first be required to register with Cinimate by completing the online registration form on the Website. You shall register as a User by providing certain details, such as Your name, password and valid email address. Some features of the Website may contain a specific identification number for the purpose of tracking the number of unique instances of such features being used by You. You must provide true, complete and accurate registration information to Us and notify Us if Your information changes. We encourage You to use Your real name. If You are accessing the Services on behalf of a business, government, or non-profit entity, You must use the actual name of Your organisation and have authorisation to create their account and provide further details such as the office address and the organisation registration number. Furthermore, You agree that You are binding such organisation to this Agreement and undertake to indemnify Cinimate for any breaches caused by that organisation (without limitation on our right to obtain a remedy directly from the organisation in conjunction with or as an alternative to Your indemnification);''',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TermsItem extends StatelessWidget {
  final String title;
  final String content;

  const TermsItem({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
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
            content,
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
    home: Terms(),
  ));
}
