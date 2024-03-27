import 'package:brewfitx/common/colo_extension.dart';
import 'package:brewfitx/common_widget/round_button.dart';
import 'package:brewfitx/view/on_boarding/on_boarding_view.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

class StartedView extends StatefulWidget {
   const StartedView({super.key});

   @override
   State<StartedView> createState() => _StartedViewState();
 }

class _StartedViewState extends State<StartedView> {
  bool isChangeColor = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: Container(
        width: media.width,
        decoration: BoxDecoration(
          gradient: isChangeColor
              ? LinearGradient(
                  colors: TColor.primaryG,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              "BrewFit",
              style: TextStyle(
                  color: TColor.black,
                  fontSize: 36,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "Hustle for that muscle",
              style: TextStyle(color: TColor.gray, fontSize: 18),
            ),
            const Spacer(),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom:
                          20), // Adjust this value to move the button higher
                  child: RoundButton(
                    title: "Get Started",
                    type: isChangeColor
                        ? RoundButtonType.textGradient
                        : RoundButtonType.bgGradient,
                    onPressed: () {
                      if (isChangeColor) {
                        // Go to Next SCreen
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OnBoardingView()));
                      } else {
                        // Change Color
                        setState(() {
                          isChangeColor = true;
                        });
                      }
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
