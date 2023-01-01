import 'package:flutter/material.dart';
import 'package:flutter_pet_app/constants/constant_exports.dart';
import 'package:flutter_pet_app/utils/customClippers_util/customClippers_util.dart';
import 'package:flutter_pet_app/widgets/widget_exports.dart';
import 'package:gap/gap.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: CurvedBottomClipper(),
            child: Container(
              decoration: const BoxDecoration(
                color: ColorConstants.orange,
              ),
              height: MediaQuery.of(context).size.height / 2,
              child: PageView(
                onPageChanged: (pageViewIndex) {
                  setState(() {
                    _currentIndex = pageViewIndex;
                  });
                },
                controller: _pageController,
                children: [
                  Image.asset(ImageConstants.onboarding1, fit: BoxFit.fill),
                  Image.asset(ImageConstants.onboarding2, fit: BoxFit.fill),
                  Image.asset(ImageConstants.onboarding3, fit: BoxFit.fill),
                ],
              ),
            ),
          ),
          const Gap(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => DotContainerWidget(
                currentIndex: _currentIndex,
                index: index,
                onboardingContext: context,
              ),
            ),
          ),
          const Gap(40),
          Container(
            width: 250,
            child: Text(
              TextConstants.onBoardingTitle,
              style: FontConstants.onboardingTexts.titleLarge,
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          ),
          const Gap(12),
          Container(
            width: 250,
            child: Text(
              TextConstants.onBoardingSubTitle,
              style: FontConstants.onboardingTexts.titleSmall,
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          ),
          const Gap(40),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              )),
              minimumSize: MaterialStateProperty.all(
                const Size(180.0, 46.0),
              ),
              backgroundColor: MaterialStateProperty.all(
                ColorConstants.red,
              ),
            ),
            onPressed: () {},
            child: const Text(TextConstants.onboardingButtonText),
          )
        ],
      ),
    );
  }
}
