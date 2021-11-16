import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login/screens/login/LoginScreen.dart';
import 'package:login/screens/signup/background.dart';
import 'file:///D:/Jaymin/Demos/Flutter-Action-Item/Login/login_action_item/login/lib/shared/or_divider.dart';
import 'file:///D:/Jaymin/Demos/Flutter-Action-Item/Login/login_action_item/login/lib/shared/social_icon.dart';
import 'package:login/shared/already_have_an_account_acheck.dart';
import 'package:login/shared/rounded_button.dart';
import 'package:login/shared/rounded_input_field.dart';
import 'package:login/shared/rounded_password_field.dart';
import 'package:login/utility/String.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                TXT_SIGN_UP,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/signup.svg",
                height: size.height * 0.35,
              ),
              RoundedInputField(
                hintText: HINT_EMAIL,
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              RoundedButton(
                text: TXT_SIGN_UP,
                press: () {},
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocialIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {},
                  ),
                  SocialIcon(
                    iconSrc: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                  SocialIcon(
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
