import 'package:brewfitx/common_widget/round_button.dart';
import 'package:brewfitx/common_widget/round_textfield.dart';
import 'package:brewfitx/view/login/auth_service.dart';
import 'package:brewfitx/view/login/complete_profile_view.dart';
import 'package:brewfitx/view/login/login_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../common/colo_extension.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _auth = AuthService();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _fname = TextEditingController();
  //final _lname = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
    _fname.dispose();
    //_lname.dispose();
  }

  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: media.width * 0.04,
                ),
                Text(
                  "Hey there,",
                  style: TextStyle(color: TColor.gray, fontSize: 16),
                ),
                Text(
                  "Create an Account",
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.width * 0.1,
                ),
                RoundTextField(
                  hitText: "First Name",
                  controller: _fname,
                  icon: "assets/img/user_text.png",
                ),
                // SizedBox(
                //   height: media.width * 0.04,
                // ),
                // RoundTextField(
                //   hitText: "Last Name",
                //   controller: _lname,
                //   icon: "assets/img/user_text.png",
                // ),
                SizedBox(
                  height: media.width * 0.08,
                ),
                RoundTextField(
                  hitText: "Email",
                  controller: _email,
                  icon: "assets/img/email.png",
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: media.width * 0.08,
                ),

                RoundTextField(
                  hitText: "Password",
                  controller: _password,
                  icon: "assets/img/lock.png",
                  obscureText: true,
                  rigtIcon: TextButton(
                      onPressed: () {},
                      child: Container(
                          alignment: Alignment.center,
                          width: 20,
                          height: 20,
                          child: Image.asset(
                            "assets/img/show_password.png",
                            width: 20,
                            height: 20,
                            fit: BoxFit.contain,
                            color: TColor.gray,
                          ))),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isCheck = !isCheck;
                        });
                      },
                      icon: Icon(
                        isCheck
                            ? Icons.check_box_outlined
                            : Icons.check_box_outline_blank_outlined,
                        color: TColor.gray,
                        size: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "By continuing you accept our Privacy Policy and\nTerm of Use",
                        style: TextStyle(color: TColor.gray, fontSize: 10),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: media.width * 0.4,
                ),

                RoundButton(
                    title: "Register",
                    onPressed: () async {
                      final fireuser =
                          await _auth.createUserWithEmailAndPassword(
                              _email.text, _password.text);
                      if (fireuser != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CompleteProfileView(uid: fireuser.uid)));
                      }
                    }),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: TColor.gray.withOpacity(0.5),
                      ),
                    ),
                    Text(
                      "  Or  ",
                      style: TextStyle(color: TColor.black, fontSize: 12),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: TColor.gray.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: TColor.white,
                          border: Border.all(
                            width: 1,
                            color: TColor.gray.withOpacity(0.4),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          "assets/img/google.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: media.width * 0.04,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: TColor.white,
                          border: Border.all(
                            width: 1,
                            color: TColor.gray.withOpacity(0.4),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          "assets/img/apple.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: media.width * 0.04,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: TColor.white,
                          border: Border.all(
                            width: 1,
                            color: TColor.gray.withOpacity(0.4),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          "assets/img/facebook.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: media.width * 0.04,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: TColor.white,
                          border: Border.all(
                            width: 1,
                            color: TColor.gray.withOpacity(0.4),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          "assets/img/twitter.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginView()));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          color: TColor.black,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Login",
                        style: TextStyle(
                            color: TColor.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
