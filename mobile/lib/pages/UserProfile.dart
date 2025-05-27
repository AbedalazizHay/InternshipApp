import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xpertbot/pages/login.dart';

class UserProfilePage extends StatefulWidget {
  final List<String> selectedTracks;
  final String academicLevel;

  const UserProfilePage({
    super.key,
    required this.selectedTracks,
    required this.academicLevel,
  });

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  File? _image;
  String _name = "Your Name";
  String _email = "your.email@example.com";
  String _bio = "Short bio about yourself...";
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _bioController = TextEditingController();

  String getTrackImage(String track) {
    switch (track.toLowerCase()) {
      case 'data science':
        return 'images/data_science.png';
      case 'web development':
        return 'images/web_development.jpg';
      case 'mobile development':
        return 'images/mobile_development.jpg';
      case 'project management':
        return 'images/project_management.jpg';
      case 'quality assurance':
        return 'images/quality_assurance.jpg';
      case 'artificial intelligence':
        return 'images/ai.jpg';
      case 'cyber security':
        return 'images/cyber_security.jpg';
      default:
        return 'images/default.jpg';
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _openSettings() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          padding: const EdgeInsets.all(20),
          children: [
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text("Edit Profile"),
              onTap: () {
                Navigator.pop(context);
                _showEditProfileDialog();
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap:() {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _showEditProfileDialog() {
    _nameController.text = _name;
    _emailController.text = _email;
    _bioController.text = _bio;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Profile"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email"),
              ),
              TextField(
                controller: _bioController,
                decoration: const InputDecoration(labelText: "Bio"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _name = _nameController.text;
                  _email = _emailController.text;
                  _bio = _bioController.text;
                });
                Navigator.pop(context);
              },
              child: const Text("Save"),
            )
          ],
        );
      },
    );
  }

  void _showTrackDetails(String track) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(track),
        content: Text("More details about $track will appear here."),
        actions: [
          TextButton(
            child: const Text("Close"),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text('Your Profile'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: _openSettings,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Animate(
                effects: [FadeEffect(duration: 400.ms), SlideEffect(begin: Offset(0, -0.2))],
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: _image != null
                            ? FileImage(_image!)
                            : const AssetImage('assets/images/logo.png') as ImageProvider,
                        child: _image == null
                            ? const Icon(Icons.camera_alt, size: 30, color: Colors.white)
                            : null,
                      ),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueAccent,
                        ),
                        child: const Icon(Icons.edit, size: 18, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _name,
                style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                _email,
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[700]),
              ),
              const SizedBox(height: 6),
              Text(
                _bio,
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
              ),
              const SizedBox(height: 10),
              Animate(
                effects: [FadeEffect(duration: 400.ms), SlideEffect(begin: Offset(0, 0.1))],
                child: Text(
                  'Academic Level: ${widget.academicLevel}',
                  style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 20),
              Animate(
                effects: [FadeEffect(duration: 400.ms), SlideEffect(begin: Offset(0, 0.1))],
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Your Learning Tracks:',
                    style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.selectedTracks.length,
                  itemBuilder: (context, index) {
                    final track = widget.selectedTracks[index];
                    return Animate(
                      effects: const [
                        SlideEffect(duration: Duration(milliseconds: 600)),
                        FadeEffect(duration: Duration(milliseconds: 300)),
                      ],
                      child: InkWell(
                        onTap: () => _showTrackDetails(track),
                        child: Container(
                          width: 160,
                          margin: const EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: const Offset(2, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Stack(
                              children: [
                                Image.asset(
                                  getTrackImage(track),
                                  width: 160,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.purpleAccent.withOpacity(0.7),
                                        Colors.transparent
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 12,
                                  left: 12,
                                  right: 12,
                                  child: Text(
                                    track,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
