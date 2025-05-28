import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xpertbot/Models/UserProfile.dart' show UserProfile;
import 'package:xpertbot/widgets/button.dart'; // Custom Button
import 'package:xpertbot/widgets/header.dart';  // Header Widget
import 'package:xpertbot/pages/UserProfile.dart';

class PersonalInfo extends StatefulWidget {
  final List<String> selectedTracks;

  const PersonalInfo({super.key, required this.selectedTracks});

  @override
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfo> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String? _gender;
  String? _academicLevel;
  String? _institution;

  // Dummy data for dropdowns (to be replaced with API data)
  final List<String> _genderOptions = ['Male', 'Female'];
  final List<String> _academicLevels = ['Undergraduate', 'Postgraduate', 'Doctorate'];
  final List<String> _institutions = ['University A', 'University B', 'University C'];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header at the top
          const Header(
            title: "Personal Information",
          ),
          const SizedBox(height: 20),

          // Skip Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  // Skip to the next page or finish
                  Navigator.pop(context);
                },
                child: Text(
                  'Skip',
                  style: GoogleFonts.quicksand(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 70, 107, 139),
                  ),
                ),
              ),
            ),
          ),

          // Main content for entering personal info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              
                
                const SizedBox(height: 20),

                // Personal Information Form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Full Name
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: "Full Name",
                          hintText: "Enter your full name",
                          prefixIcon: const Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Phone Number
                      TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: "Phone Number",
                          hintText: "Enter your phone number",
                          prefixIcon: const Icon(Icons.phone),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Gender Dropdown
                      DropdownButtonFormField<String>(
                        value: _gender,
                        onChanged: (newValue) {
                          setState(() {
                            _gender = newValue;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Gender",
                          hintText: "Select your gender",
                          prefixIcon: const Icon(Icons.transgender),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        items: _genderOptions.map((gender) {
                          return DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                        validator: (val) {
                          if (val == null) {
                            return 'Please select your gender';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Academic Level Dropdown (to be replaced with API data)
                      DropdownButtonFormField<String>(
                        value: _academicLevel,
                        onChanged: (newValue) {
                          setState(() {
                            _academicLevel = newValue;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Academic Level",
                          hintText: "Select your academic level",
                          prefixIcon: const Icon(Icons.school),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        items: _academicLevels.map((level) {
                          return DropdownMenuItem(
                            value: level,
                            child: Text(level),
                          );
                        }).toList(),
                        validator: (val) {
                          if (val == null) {
                            return 'Please select your academic level';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Institution Dropdown (to be replaced with API data)
                      DropdownButtonFormField<String>(
                        value: _institution,
                        onChanged: (newValue) {
                          setState(() {
                            _institution = newValue;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Institution",
                          hintText: "Select your institution",
                          prefixIcon: const Icon(Icons.school),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        items: _institutions.map((institution) {
                          return DropdownMenuItem(
                            value: institution,
                            child: Text(institution),
                          );
                        }).toList(),
                        validator: (val) {
                          if (val == null) {
                            return 'Please select your institution';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Save Button
                CusButton(
                  title: 'Save',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Show success message for now (Later use for API integration)
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Personal Information saved.")),
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),

                // Next Button
                CusButton(
                  title: 'Next',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle the next action after successful form completion
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Proceeding to next step...")),
                      );

                      // You can navigate to another page or just finish
              Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserProfilePage(
                            selectedTracks: widget.selectedTracks,
                            academicLevel: _academicLevel!,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
