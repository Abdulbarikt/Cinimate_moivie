import '../utils/images.dart';

class Onboarding {
  String bgImage;
  String title;
  String info;
  Onboarding({
    required this.bgImage,
    required this.title,
    required this.info,
  });
}

List<Onboarding> onboardingList = [
  Onboarding(
    bgImage: AppAssets.kOnboardingFirst,
    title: 'Welcome to Cinimate: Your Gateway to Unlimited Movie Magic!',
    info:
        'Where You Can Discover, Watch, and Enjoy a Vast Array of Films, TV Shows, and Documentaries! ',
  ),
  Onboarding(
    bgImage: AppAssets.kOnboardingSecond,
    title: "Enter the Reel World with CinemaSphere: Where Every Genre Shines!",
    info:
        'Explore Thousands of Titles, Engaging Recommendations, and Exciting Features Await You! ',
  ),
  Onboarding(
    bgImage: AppAssets.kOnboardingThird,
    title: "Discover the Magic of Storytelling on Screen",
    info:
        ' Immerse yourself in captivating narratives and characters that will transport you to new worlds. ',
  ),
];
