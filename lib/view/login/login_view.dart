// import 'package:brewfitx/common_widget/round_button.dart';
// import 'package:brewfitx/common_widget/round_textfield.dart';
// import 'package:brewfitx/view/login/auth_service.dart';
// import 'package:brewfitx/view/login/forgot_pass_page.dart';
// import 'package:brewfitx/view/login/signup_view.dart';
// import 'package:brewfitx/view/login/welcome_view.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// import '../../common/colo_extension.dart';

// class LoginView extends StatefulWidget {
//   const LoginView({Key? key});

//   @override
//   State<LoginView> createState() => _LoginViewState();
// }

// class _LoginViewState extends State<LoginView> {
//   final _auth = AuthService();
//   final _email = TextEditingController();
//   final _password = TextEditingController();

//   @override
//   void dispose() {
//     super.dispose();
//     _email.dispose();
//     _password.dispose();
//   }

//   Future<String?> getFirstName(String email) async {
//     try {
//       var userDoc =
//           await FirebaseFirestore.instance.collection('users').doc(email).get();
//       print(userDoc.exists);
//       if (userDoc.exists &&
//           userDoc.data() != null &&
//           userDoc.data()!.containsKey('firstName')) {
//         return userDoc.data()!['firstName'];
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print('Error retrieving first name: $e');
//       return null;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var media = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: TColor.white,
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Builder(
//             builder: (context) => Container(
//               height: media.height * 0.9,
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: media.width * 0.04,
//                   ),
//                   Text(
//                     "Hey there,",
//                     style: TextStyle(color: TColor.gray, fontSize: 16),
//                   ),
//                   Text(
//                     "Welcome Back",
//                     style: TextStyle(
//                         color: TColor.black,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w700),
//                   ),
//                   SizedBox(
//                     height: media.width * 0.1,
//                   ),
//                   RoundTextField(
//                     hitText: "Email",
//                     controller: _email,
//                     icon: "assets/img/email.png",
//                     keyboardType: TextInputType.emailAddress,
//                   ),
//                   SizedBox(
//                     height: media.width * 0.08,
//                   ),
//                   RoundTextField(
//                     hitText: "Password",
//                     controller: _password,
//                     icon: "assets/img/lock.png",
//                     obscureText: true,
//                     rigtIcon: TextButton(
//                         onPressed: () {},
//                         child: Container(
//                             alignment: Alignment.center,
//                             width: 20,
//                             height: 20,
//                             child: Image.asset(
//                               "assets/img/show_password.png",
//                               width: 20,
//                               height: 20,
//                               fit: BoxFit.contain,
//                               color: TColor.gray,
//                             ))),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: media.width * 0.1,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 8.0),
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) {
//                                   return ForgotPasswordPage();
//                                 },
//                               ),
//                             );
//                           },
//                           child: Text(
//                             "Forgot your password?",
//                             style: TextStyle(
//                               color: TColor.gray,
//                               fontSize: 12,
//                               decoration: TextDecoration.underline,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const Spacer(),
//                   RoundButton(
//                     title: "Login",
//                     onPressed: () async {
//                       final user = await _auth.loginUserWithEmailAndPassword(
//                           _email.text, _password.text);
//                       if (user != null) {
//                         _showMessage(context, "Congratulations",
//                             "Successfully Logged in", Colors.lightGreen);
//                         String? firstName = await getFirstName(_email.text);
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 WelcomeView(firstName: firstName ?? ''),
//                           ),
//                         );
//                       } else {
//                         _showMessage(context, "Oops",
//                             "Wrong credentials, try again", Colors.red);
//                       }
//                     },
//                   ),
//                   SizedBox(
//                     height: media.width * 0.04,
//                   ),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Container(
//                           height: 1,
//                           color: TColor.gray.withOpacity(0.5),
//                         ),
//                       ),
//                       Text(
//                         "  Or  ",
//                         style: TextStyle(color: TColor.black, fontSize: 12),
//                       ),
//                       Expanded(
//                         child: Container(
//                           height: 1,
//                           color: TColor.gray.withOpacity(0.5),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: media.width * 0.04,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       GestureDetector(
//                         onTap: () async {
//                           await signInWithGoogle();
//                         },
//                         child: Container(
//                           width: 50,
//                           height: 50,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             color: TColor.white,
//                             border: Border.all(
//                                 width: 1, color: TColor.gray.withOpacity(0.4)),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: Image.asset("assets/img/google.png",
//                               width: 20, height: 20),
//                         ),
//                       ),
//                       SizedBox(
//                         width: media.width * 0.04,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           // Add your Apple button functionality here
//                           print('Apple button pressed!');
//                         },
//                         child: Container(
//                           width: 50,
//                           height: 50,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             color: TColor.white,
//                             border: Border.all(
//                               width: 1,
//                               color: TColor.gray.withOpacity(0.4),
//                             ),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: Image.asset(
//                             "assets/img/apple.png",
//                             width: 20,
//                             height: 20,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: media.width * 0.04,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           // Add your Facebook button functionality here
//                           print('Facebook button pressed!');
//                         },
//                         child: Container(
//                           width: 50,
//                           height: 50,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             color: TColor.white,
//                             border: Border.all(
//                               width: 1,
//                               color: TColor.gray.withOpacity(0.4),
//                             ),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: Image.asset(
//                             "assets/img/facebook.png",
//                             width: 20,
//                             height: 20,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: media.width * 0.04,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           // Add your Twitter button functionality here
//                           print('Twitter button pressed!');
//                         },
//                         child: Container(
//                           width: 50,
//                           height: 50,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             color: TColor.white,
//                             border: Border.all(
//                               width: 1,
//                               color: TColor.gray.withOpacity(0.4),
//                             ),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: Image.asset(
//                             "assets/img/twitter.png",
//                             width: 20,
//                             height: 20,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: media.width * 0.04,
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const SignUpView()),
//                       );
//                     },
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           "Don’t have an account yet? ",
//                           style: TextStyle(
//                             color: TColor.black,
//                             fontSize: 14,
//                           ),
//                         ),
//                         Text(
//                           "Register",
//                           style: TextStyle(
//                               color: TColor.black,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w700),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: media.width * 0.04,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _showMessage(
//       BuildContext context, String title, String message, Color color) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: color,
//         duration: const Duration(seconds: 1),
//       ),
//     );
//   }

//   Future<void> signInWithGoogle() async {
//     try {
//       GoogleSignIn googleSignIn = GoogleSignIn();
//       GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//       if (googleUser != null) {
//         GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//         AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth.accessToken,
//           idToken: googleAuth.idToken,
//         );
//         UserCredential userCredential =
//             await FirebaseAuth.instance.signInWithCredential(credential);
//         String? firstName = await getFirstName(userCredential.user!.email!);
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//               builder: (context) => WelcomeView(firstName: firstName ?? '')),
//         );
//       }
//     } catch (error) {
//       print('Error signing in with Google: $error');
//       _showMessage(
//           context, "Error", "Failed to sign in with Google", Colors.red);
//     }
//   }
// }

import 'package:brewfitx/common_widget/round_button.dart';
import 'package:brewfitx/common_widget/round_textfield.dart';
import 'package:brewfitx/view/login/auth_service.dart';
import 'package:brewfitx/view/login/forgot_pass_page.dart';
import 'package:brewfitx/view/login/signup_view.dart';
import 'package:brewfitx/view/login/welcome_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../common/colo_extension.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _auth = AuthService();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  Future<String?> getFirstName(String email) async {
    try {
      var userDoc =
          await FirebaseFirestore.instance.collection('users').doc(email).get();
      print(userDoc.exists);
      if (userDoc.exists &&
          userDoc.data() != null &&
          userDoc.data()!.containsKey('firstName')) {
        return userDoc.data()!['firstName'];
      } else {
        return null;
      }
    } catch (e) {
      print('Error retrieving first name: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Builder(
            builder: (context) => Container(
              height: media.height * 0.9,
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
                    "Welcome Back",
                    style: TextStyle(
                        color: TColor.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: media.width * 0.1,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: media.width * 0.1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ForgotPasswordPage();
                                },
                              ),
                            );
                          },
                          child: Text(
                            "Forgot your password?",
                            style: TextStyle(
                              color: TColor.gray,
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  RoundButton(
                    title: "Login",
                    onPressed: () async {
                      final user = await _auth.loginUserWithEmailAndPassword(
                          _email.text, _password.text);
                      if (user != null) {
                        _showMessage(context, "Congratulations",
                            "Successfully Logged in", Colors.lightGreen);
                        CollectionReference usersCollection =
                            FirebaseFirestore.instance.collection('users');
                        final docref =
                            await usersCollection.doc(user.uid).get();
                        print(docref.data());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                WelcomeView(firstName:  ''),
                          ),
                        );
                      } else {
                        _showMessage(context, "Oops",
                            "Wrong credentials, try again", Colors.red);
                      }
                    },
                  ),
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
                        onTap: () async {
                          await signInWithGoogle();
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: TColor.white,
                            border: Border.all(
                                width: 1, color: TColor.gray.withOpacity(0.4)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset("assets/img/google.png",
                              width: 20, height: 20),
                        ),
                      ),
                      SizedBox(
                        width: media.width * 0.04,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Add your Apple button functionality here
                          print('Apple button pressed!');
                        },
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
                        onTap: () {
                          // Add your Facebook button functionality here
                          print('Facebook button pressed!');
                        },
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
                        onTap: () {
                          // Add your Twitter button functionality here
                          print('Twitter button pressed!');
                        },
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
                      ),
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
                            builder: (context) => const SignUpView()),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Don’t have an account yet? ",
                          style: TextStyle(
                            color: TColor.black,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "Register",
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
      ),
    );
  }

  void _showMessage(
      BuildContext context, String title, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  Future<void> signInWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        String? firstName = await getFirstName(userCredential.user!.email!);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => WelcomeView(
                  firstName:
                      firstName ?? userCredential.user!.displayName ?? '')),
        );
      }
    } catch (error) {
      print('Error signing in with Google: $error');
      _showMessage(
          context, "Error", "Failed to sign in with Google", Colors.red);
    }
  }
}
