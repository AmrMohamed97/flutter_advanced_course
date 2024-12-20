import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theaming/styles.dart';
import 'package:flutter_complete_project/features/onboarding/widgets/doc_logo_and_name.dart';
import 'package:flutter_complete_project/features/onboarding/widgets/doctor_image_and_text.dart';
import 'package:flutter_complete_project/features/onboarding/widgets/get_started_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 20.h,
              bottom: 30.h,
            ),
            child: Column(
              children: [
                DocLogoAndName(),
                SizedBox(
                  height: 30.h,
                ),
                DoctorImageAndText(),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.h),
                    child: Column(
                      children: [
                        Text(
                          'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                          textAlign: TextAlign.center,
                          style: TextStyles.font13GreyRegular,
                        ),
                        GetStartedButton(),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
