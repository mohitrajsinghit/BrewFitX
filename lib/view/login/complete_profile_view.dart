import 'package:brewfitx/common_widget/round_button.dart';
import 'package:brewfitx/common_widget/round_textfield.dart';
import 'package:brewfitx/view/login/welcome_view.dart';
import 'package:brewfitx/view/login/what_your_goal_view.dart';
import 'package:flutter/material.dart';
import 'package:brewfitx/common/colo_extension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CompleteProfileView extends StatefulWidget {
  const CompleteProfileView({Key? key}) : super(key: key);

  @override
  State<CompleteProfileView> createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  String? selectedGender;
  DateTime? selectedDate;
  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  TextEditingController txtDOB = TextEditingController();
  TextEditingController txtWeight = TextEditingController();
  TextEditingController txtHeight = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtMobileNumber = TextEditingController();
  TextEditingController txtCity = TextEditingController();
  TextEditingController txtZipCode = TextEditingController();
  TextEditingController txtCountry = TextEditingController();
  TextEditingController txtAge = TextEditingController();
  TextEditingController txtBloodType = TextEditingController();
  String? selectedState;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        txtDOB.text = pickedDate.toString();
      });
    }
  }

  List<String> indianStates = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
    'Andaman and Nicobar Islands',
    'Chandigarh',
    'Dadra and Nagar Haveli and Daman and Diu',
    'Lakshadweep',
    'Delhi',
    'Puducherry',
  ];

  @override
  void dispose() {
    super.dispose();
    txtFirstName.dispose();
    txtLastName.dispose();
    txtDOB.dispose();
    txtWeight.dispose();
    txtHeight.dispose();
    txtEmail.dispose();
    txtMobileNumber.dispose();
    txtCity.dispose();
    txtZipCode.dispose();
    txtCountry.dispose();
    txtAge.dispose();
    txtBloodType.dispose();
  }

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
                // Personal Details Section
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 250, 220, 192),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: media.width * 0.02),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Personal Details:-",
                          style: TextStyle(color: TColor.black, fontSize: 20),
                        ),
                      ),
                      SizedBox(height: media.width * 0.02),
                      // First Name Field
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 1, vertical: 2),
                        child: RoundTextField(
                          controller: txtFirstName,
                          hitText: "First Name",
                          icon: "assets/img/user_text.png",
                        ),
                      ),
                      SizedBox(height: media.width * 0.04),
                      // Last Name Field
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 1, vertical: 2),
                        child: RoundTextField(
                          controller: txtLastName,
                          hitText: "Last Name",
                          icon: "assets/img/user_text.png",
                        ),
                      ),
                      SizedBox(height: media.width * 0.04),
                      // Gender Dropdown
                      Container(
                        decoration: BoxDecoration(
                          color: TColor.lightGray,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 50,
                              height: 50,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 1, vertical: 2),
                              child: Image.asset(
                                "assets/img/gender.png",
                                width: 20,
                                height: 20,
                                fit: BoxFit.contain,
                                color: TColor.gray,
                              ),
                            ),
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
                                                fontSize: 14,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedGender = value as String?;
                                    });
                                  },
                                  value: selectedGender,
                                  isExpanded: true,
                                  hint: Text(
                                    "Choose Gender",
                                    style: TextStyle(
                                      color: TColor.gray,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ),
                      SizedBox(height: media.width * 0.04),
                      // Email Field
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 1, vertical: 2),
                        child: RoundTextField(
                          controller: txtEmail,
                          hitText: "Email",
                          icon: "assets/img/email.png",
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      SizedBox(height: media.width * 0.04),
                      // Mobile Number Field
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 1, vertical: 2),
                        child: RoundTextField(
                          controller: txtMobileNumber,
                          hitText: "Mobile Number",
                          icon: "assets/img/mobile_number.png",
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(height: media.width * 0.05),
                    ],
                  ),
                ),
                SizedBox(height: media.width * 0.05),

                // Physical Details Section
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 250, 220, 192),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: media.width * 0.02),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Physical Details:-",
                          style: TextStyle(color: TColor.black, fontSize: 20),
                        ),
                      ),
                      SizedBox(height: media.width * 0.02),
                      // Date of Birth Field
                      Container(
                        height: 50, // Set the height to 50
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextFormField(
                          controller: txtDOB,
                          decoration: const InputDecoration(
                            hintText: 'Select Date of Birth',
                            hintStyle: TextStyle(fontSize: 12),
                            prefixIcon: Icon(Icons.calendar_today),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                          ),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );
                            if (pickedDate != null) {
                              setState(() {
                                txtDOB.text =
                                    pickedDate.toString().split(' ')[0];
                              });
                            }
                          },
                        ),
                      ),

                      SizedBox(height: media.width * 0.04),
                      // Weight Field
                      Row(
                        children: [
                          Expanded(
                            child: RoundTextField(
                              controller: txtWeight,
                              hitText: "Your Weight",
                              icon: "assets/img/weight.png",
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(width: 8),
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
                      SizedBox(height: media.width * 0.04),
                      // Height Field
                      Row(
                        children: [
                          Expanded(
                            child: RoundTextField(
                              controller: txtHeight,
                              hitText: "Your Height",
                              icon: "assets/img/height.png",
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(width: 8),
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
                          ),
                        ],
                      ),

                      SizedBox(height: media.width * 0.04),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 1, vertical: 2),
                        child: RoundTextField(
                          controller: txtAge,
                          hitText: "Your Age",
                          icon: "assets/img/age.png",
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(height: media.width * 0.05),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 1, vertical: 2),
                        child: RoundTextField(
                          controller: txtBloodType,
                          hitText: "Blood Group (e.g., B+ve, O+ve)",
                          icon: "assets/img/blood.png",
                        ),
                      ),
                      SizedBox(height: media.width * 0.05),
                    ],
                  ),
                ),
                SizedBox(height: media.width * 0.05),

                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 250, 220, 192),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: media.width * 0.02),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Residential Address:-",
                          style: TextStyle(color: TColor.black, fontSize: 20),
                        ),
                      ),
                      SizedBox(height: media.width * 0.02),
                      // First Name Field
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 1, vertical: 2),
                        child: RoundTextField(
                          controller: txtCity,
                          hitText: "City",
                          icon: "assets/img/city.png",
                        ),
                      ),
                      SizedBox(height: media.width * 0.04),
                      // Last Name Field
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 1, vertical: 2),
                        child: RoundTextField(
                          controller: txtZipCode,
                          hitText: "Zip Code",
                          icon: "assets/img/zipcode.png",
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(height: media.width * 0.04),
                      // Gender Dropdown
                      Container(
                        decoration: BoxDecoration(
                          color: TColor.lightGray,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 50,
                              height: 50,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 1, vertical: 2),
                              child: Image.asset(
                                "assets/img/location.png",
                                width: 20,
                                height: 20,
                                fit: BoxFit.contain,
                                color: TColor.gray,
                              ),
                            ),
                            Expanded(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  items: indianStates
                                      .map((state) => DropdownMenuItem(
                                            value: state,
                                            child: Text(
                                              state,
                                              style: TextStyle(
                                                color: TColor.gray,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedState = value as String?;
                                    });
                                  },
                                  value: selectedState,
                                  isExpanded: true,
                                  hint: Text(
                                    "Select State",
                                    style: TextStyle(
                                      color: TColor.gray,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ),

                      SizedBox(height: media.width * 0.04),
                      // Email Field
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 1, vertical: 2),
                        child: RoundTextField(
                          controller: txtCountry,
                          hitText: "Country",
                          icon: "assets/img/country.png",
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      SizedBox(height: media.width * 0.05),
                    ],
                  ),
                ),
                SizedBox(height: media.width * 0.05),
                // Next Button
                RoundButton(
                  title: "Next >",
                  onPressed: () {
                    if (validateFields()) {
                      addUserToFirestore();
                      _showMessage(context, "Success",
                          "User details added successfully", Colors.lightGreen);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              WelcomeView(firstName: txtFirstName.text),
                        ),
                      );

                    } else {
                      _showMessage(context, "Error", "Please fill all fields",
                          Colors.red);
                    }
                  },
                ),

                SizedBox(height: media.width * 0.04),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateFields() {
    if (selectedGender == null ||
        txtDOB.text.isEmpty ||
        txtWeight.text.isEmpty ||
        txtHeight.text.isEmpty ||
        txtFirstName.text.isEmpty ||
        txtLastName.text.isEmpty ||
        txtEmail.text.isEmpty ||
        txtMobileNumber.text.isEmpty ||
        txtCity.text.isEmpty ||
        txtZipCode.text.isEmpty ||
        txtCountry.text.isEmpty ||
        selectedState == null) {
      return false;
    }

    // Validate zip code length
    if (txtZipCode.text.length != 6) {
      return false;
    }

    // Validate zip code contains only numbers
    if (!RegExp(r'^[0-9]*$').hasMatch(txtZipCode.text)) {
      return false;
    }

    return true;
  }

  void addUserToFirestore() async {
    try {
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');
      await usersCollection.add({
        'gender': selectedGender == 'Male' ? 'Male' : 'Female',
        'dob': Timestamp.fromDate(selectedDate!),
        'weight': double.tryParse(txtWeight.text) ?? 0.0,
        'height': double.tryParse(txtHeight.text) ?? 0.0,
        'firstName': txtFirstName.text,
        'lastName': txtLastName.text,
        'email': txtEmail.text,
        'mobileNumber': int.tryParse(txtMobileNumber.text) ?? 0,
        'city': txtCity.text,
        'zipCode': int.tryParse(txtZipCode.text) ?? 0,
        'country': txtCountry.text,
        'state': selectedState,
        'age': int.tryParse(txtAge.text) ?? 0,
        'bloodType': txtBloodType.text,
      });

      print('User added to Firestore successfully');
    } catch (e) {
      print('Error adding user to Firestore: $e');
    }
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
}
