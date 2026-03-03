import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: Color(0xFFFFBC00), // Set AppBar color to yellow
      ),
      body: SingleChildScrollView(
        // Wrap the Column in a SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image on the top
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://jordantraveler.com/wp-content/uploads/2023/03/Things-to-Do-in-Amman-Hero-1024x683.png',
                fit: BoxFit.cover,
                height: 200, // Adjust the height of the image
                width: double.infinity, // Make image take full width
              ),
            ),
            const SizedBox(height: 24), // Space between image and text
            // Text below the image
            const Text(
              'Welcome to FitnessMore',
              style: TextStyle(
                fontSize: 28, // Increased font size for the title
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Your go-to online fitness app! Based in the beautiful city of Amman, we’re all about helping you take care of your health in a fun and easy way. With our app, you’ll find personalized workout plans, nutrition tips, and a friendly community to support you on your fitness journey. Whether you’re just starting out or looking to level up, FitnessMore makes it simple to get fit and feel great from the comfort of your home. Join us and let’s make health a priority together!',
              style: TextStyle(
                fontSize: 18, // Increased font size for the paragraph
                height: 1.6,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
