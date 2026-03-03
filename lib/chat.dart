import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  // Placeholder for live chat action
  void _startLiveChat() {
    // Here you would trigger your live chat logic
    print("Live chat started.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        backgroundColor: Color(0xFFFFBC00),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Phone number section
            const Text(
              'Phone Number:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '062683766', // Replace with your actual phone number
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Email section
            const Text(
              'Email:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'support@FitnessMore.com', // Replace with your actual email
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Live chat button
            SizedBox(
              width: double.infinity, // To make the button full width
              child: ElevatedButton(
                onPressed: _startLiveChat,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFBC00),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text(
                  'Start Live Chat',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
