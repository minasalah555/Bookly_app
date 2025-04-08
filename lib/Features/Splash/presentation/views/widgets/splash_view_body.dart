import 'package:bookly_app/Features/Splash/presentation/views/widgets/animation_text.dart';
import 'package:bookly_app/Features/home/presentation/views/home_view.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplachViewBody extends StatefulWidget {
  const SplachViewBody({super.key});

  @override
  State<SplachViewBody> createState() => _SplachViewBodyState();
}

class _SplachViewBodyState extends State<SplachViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController ainmationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigationToHome();
  }

  @override
  void dispose() {
    ainmationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // main Axis is y
      crossAxisAlignment: CrossAxisAlignment.stretch, // Cross axis x
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(height: 8),
        AnimationText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    ainmationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation = Tween<Offset>(
      begin: Offset(0, 10),
      end: Offset(0, 0),
    ).animate(ainmationController);
    ainmationController.forward();
    // slidingAnimation.addListener(() {
    //   setState(() {});
    // });
  }

  void navigationToHome() {
    Future.delayed(Duration(seconds: 2), () {
      Get.to(
        () => HomeView(),
        transition: Transition.fade,
        duration: kNavigationDuration,
      );
    });
  }
}
