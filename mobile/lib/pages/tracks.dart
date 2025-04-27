import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xpertbot/widgets/button.dart'; // Custom Button
import 'package:xpertbot/widgets/header.dart';  // Header Widget
import 'package:xpertbot/pages/personal_info.dart';  // Next Page after Tracks

class TracksPage extends StatefulWidget {
  const TracksPage({super.key});

  @override
  _TracksPageState createState() => _TracksPageState();
}

class _TracksPageState extends State<TracksPage> {
  List<String> selectedTracks = [];

  final List<String> allTracks = [
    'Data Science',
    'Project Management',
    'Quality Assurance',
    'Web Development',
    'Cyber Security',
    'Artificial Intelligence',
    'Mobile  Development'
  ];

  // Toggle track selection
  void _toggleTrackSelection(String track) {
    setState(() {
      if (selectedTracks.contains(track)) {
        selectedTracks.remove(track);
      } else {
        selectedTracks.add(track);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header at the top
          const Header(
            title: "Select Your Tracks",
          ),
          const SizedBox(height: 40),

          // Main content for selecting tracks
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Main Title
                Text(
                  "Select the Track(s) you want",
                  style: GoogleFonts.quicksand(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 1, 38, 72),
                  ),
                ),
                const SizedBox(height: 20),

                // Track Selection Options
                Column(
                  children: allTracks.map((track) {
                    return CheckboxListTile(
                      title: Text(
                        track,
                        style: GoogleFonts.quicksand(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 70, 107, 139),
                        ),
                      ),
                      value: selectedTracks.contains(track),
                      onChanged: (bool? selected) {
                        _toggleTrackSelection(track);
                      },
                      activeColor: const Color.fromARGB(255, 70, 107, 139),
                      checkColor: Colors.white,
                    );
                  }).toList(),
                ),

                const SizedBox(height: 30),

                // Next Button
                CusButton(
                  title: 'Next',
                  onPressed: () {
                    // If no tracks are selected, show an error message
                    if (selectedTracks.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select at least one track.'),
                        ),
                      );
                    } else {
                      // Proceed to the next page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PersonalInfo(),
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
