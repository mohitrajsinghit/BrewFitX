// import 'package:brewfitx/common_widget/round_button.dart';
// import 'package:brewfitx/common_widget/round_textfield.dart';
// import 'package:brewfitx/view/login/what_your_goal_view.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:brewfitx/common/colo_extension.dart';
// import 'package:flutter/widgets.dart';

// class CompleteProfileView extends StatefulWidget {
//   const CompleteProfileView({super.key});

//   @override
//   State<CompleteProfileView> createState() => _CompleteProfileViewState();
// }

// class _CompleteProfileViewState extends State<CompleteProfileView> {
//   String? selectedGender;
//   TextEditingController txtDate = TextEditingController();
//   TextEditingController txtWeight = TextEditingController();
//   TextEditingController txtHeight = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     var media = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: TColor.white,
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Column(
//               children: [
//                 Image.asset(
//                   "assets/img/complete_profile.png",
//                   width: media.width,
//                   fit: BoxFit.fitWidth,
//                 ),
//                 SizedBox(
//                   height: media.width * 0.05,
//                 ),
//                 Text(
//                   "Let’s complete your profile",
//                   style: TextStyle(
//                       color: TColor.black,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w700),
//                 ),
//                 Text(
//                   "It will help us to know more about you!",
//                   style: TextStyle(color: TColor.gray, fontSize: 12),
//                 ),
//                 SizedBox(
//                   height: media.width * 0.05,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                   child: Column(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                             color: TColor.lightGray,
//                             borderRadius: BorderRadius.circular(15)),
//                         child: Row(
//                           children: [
//                             Container(
//                                 alignment: Alignment.center,
//                                 width: 50,
//                                 height: 50,
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 15),
//                                 child: Image.asset(
//                                   "assets/img/gender.png",
//                                   width: 20,
//                                   height: 20,
//                                   fit: BoxFit.contain,
//                                   color: TColor.gray,
//                                 )),
//                             Expanded(
//                               child: DropdownButtonHideUnderline(
//                                 child: DropdownButton(
//                                   items: ["Male", "Female"]
//                                       .map((name) => DropdownMenuItem(
//                                             value: name,
//                                             child: Text(
//                                               name,
//                                               style: TextStyle(
//                                                   color: TColor.gray,
//                                                   fontSize: 14),
//                                             ),
//                                           ))
//                                       .toList(),
//                                   onChanged: (value) {
//                                     setState(() {
//                                       selectedGender = value
//                                           as String?; // Update the selected gender
//                                     });
//                                   },
//                                   value:
//                                       selectedGender, // Set the selected value
//                                   isExpanded: true,
//                                   hint: Text(
//                                     "Choose Gender",
//                                     style: TextStyle(
//                                         color: TColor.gray, fontSize: 12),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 8,
//                             )
//                           ],
//                         ),
//                       ),

//                       SizedBox(
//                         height: media.width * 0.04,
//                       ),

//                       RoundTextField(
//                         controller: txtDate,
//                         hitText: "Date of Birth -> (DDMMYYYY)",
//                         icon: "assets/img/date.png",
//                       ),
//                       SizedBox(
//                         height: media.width * 0.04,
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: RoundTextField(
//                               controller: txtWeight,
//                               hitText: "Your Weight",
//                               icon: "assets/img/weight.png",
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 8,
//                           ),
//                           Container(
//                             width: 50,
//                             height: 50,
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 colors: TColor.secondaryG,
//                               ),
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: Text(
//                               "KG",
//                               style:
//                                   TextStyle(color: TColor.white, fontSize: 12),
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: media.width * 0.04,
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: RoundTextField(
//                               controller: txtHeight,
//                               hitText: "Your Height",
//                               icon: "assets/img/height.png",
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 8,
//                           ),
//                           Container(
//                             width: 50,
//                             height: 50,
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 colors: TColor.secondaryG,
//                               ),
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: Text(
//                               "CM",
//                               style:
//                                   TextStyle(color: TColor.white, fontSize: 12),
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: media.width * 0.3,
//                       ),
//                       RoundButton(
//                           title: "Next >",
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         const WhatYourGoalView()));
//                           }),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:brewfitx/common_widget/round_button.dart';
import 'package:brewfitx/common_widget/round_textfield.dart';
import 'package:brewfitx/view/login/what_your_goal_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:brewfitx/common/colo_extension.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CompleteProfileView extends StatefulWidget {
  const CompleteProfileView({super.key});

  @override
  State<CompleteProfileView> createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  String? selectedGender;
  TextEditingController txtDOB = TextEditingController();
  TextEditingController txtWeight = TextEditingController();
  TextEditingController txtHeight = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/img/complete_profile.png",
                  width: media.width,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Text(
                  "Let’s complete your profile",
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "It will help us to know more about you!",
                  style: TextStyle(color: TColor.gray, fontSize: 12),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: TColor.lightGray,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Image.asset(
                                  "assets/img/gender.png",
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.contain,
                                  color: TColor.gray,
                                )),
                            Expanded(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  items: ["Male", "Female"]
                                      .map((name) => DropdownMenuItem(
                                            value: name,
                                            child: Text(
                                              name,
                                              style: TextStyle(
                                                  color: TColor.gray,
                                                  fontSize: 14),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedGender = value
                                          as String?; // Update the selected gender
                                    });
                                  },
                                  value:
                                      selectedGender, // Set the selected value
                                  isExpanded: true,
                                  hint: Text(
                                    "Choose Gender",
                                    style: TextStyle(
                                        color: TColor.gray, fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      RoundTextField(
                        controller: txtDOB,
                        hitText: "Date of Birth -> (DDMMYYYY)",
                        icon: "assets/img/date.png",
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RoundTextField(
                              controller: txtWeight,
                              hitText: "Your Weight",
                              icon: "assets/img/weight.png",
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: TColor.secondaryG,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "KG",
                              style:
                                  TextStyle(color: TColor.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RoundTextField(
                              controller: txtHeight,
                              hitText: "Your Height",
                              icon: "assets/img/height.png",
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: TColor.secondaryG,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "CM",
                              style:
                                  TextStyle(color: TColor.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.3,
                      ),
                      RoundButton(
                        title: "Next >",
                        onPressed: () {
                          addUserToFirestore(selectedGender, txtDOB.text,
                              txtWeight.text, txtHeight.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WhatYourGoalView(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addUserToFirestore(
      String? selectedGender, String dob, String weight, String height) async {
    try {
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');
      await usersCollection.add({
        'gender': selectedGender == 'Male'
            ? 0
            : 1, // Numeric representation of gender
        'dob': int.tryParse(dob) ?? 0, // Convert to integer
        'weight': double.tryParse(weight) ?? 0.0, // Convert to double
        'height': double.tryParse(height) ?? 0.0, // Convert to double
      });
      print('User added to Firestore successfully');
    } catch (e) {
      print('Error adding user to Firestore: $e');
    }
  }
}
