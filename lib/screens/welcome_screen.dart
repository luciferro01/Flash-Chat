import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../component/elevated_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // animation = CurvedAnimation(
    //   parent: controller,
    //   curve: Curves.bounceOut,
    // );

    animation = ColorTween(
      begin: Colors.blueGrey,
      end: Colors.lightBlueAccent,
    ).animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
      // print(animation.value);
    });

    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red.withOpacity(controller.value), // Only with values 0 to 1 of controller.value
      // backgroundColor: Colors.white,
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 60.0,
                    // height: controller.value,
                    // height: animation.value * 100,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                // const Text(
                //   'Flash Chat',
                //   // '${controller.value.toInt()}%',
                //   style: TextStyle(
                //     color: Colors.black,
                //     fontSize: 45.0,
                //     fontWeight: FontWeight.w900,
                //   ),
                // ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                      speed: const Duration(milliseconds: 300),
                    ),
                  ],
                  totalRepeatCount: 4,
                  stopPauseOnTap: true,
                  displayFullTextOnTap: true,
                  pause: const Duration(milliseconds: 1000),
                )
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            ElevatedButtonWidget(
                buttonColor: Colors.lightBlueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                elevatedButtonText: 'Log In'),
            ElevatedButtonWidget(
                buttonColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.ied);
                },
                elevatedButtonText: 'Register')
          ],
        ),
      ),
    );
  }
}
