import 'package:flutter/material.dart';
import 'member.dart'; // Import the View Members page
import 'call.dart';   // Import the Live Call page

class CoachManagePage extends StatelessWidget {
  const CoachManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFBC00),
        title: const Text(
          "Coach Management",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          // Background Image from Pexels (optional)
          Positioned.fill(
            child: Image.network(
              'https://images.pexels.com/photos/1865131/pexels-photo-1865131.jpeg', // Pexels Image URL
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFFFFBC00),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Text(
                    "Failed to load image",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ),
          // Semi-transparent overlay for better contrast
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          // Content Area
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Title
                  const Text(
                    "Coach Management",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFBC00),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // View Members Button with Icon
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MemberPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFBC00),
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(
                      Icons.group,
                      size: 30,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'View Members',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Start Live Call Button with Icon
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CallPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFBC00),
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(
                      Icons.video_call,
                      size: 30,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Start Live Call',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
