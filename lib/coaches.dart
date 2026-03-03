import 'package:GP2/Payment.dart';
import 'package:flutter/material.dart';


class CoachesPage extends StatefulWidget {
  const CoachesPage({super.key});

  @override
  _coachesPageState createState() => _coachesPageState();
}

class _coachesPageState extends State<CoachesPage> {
  String _selectedCoach = 'ALI HAMDAN';
  String _selectedWorkout = 'Yoga';
  String _selectedTime = '10:00 AM - 12:00 PM'; // Default time updated
  String _selectedPlan = '1 Month : 25 JD';
  final _formKey = GlobalKey<FormState>();

  double _getPlanPrice(String plan) {
    switch (plan) {
      case '1 Month : 25 JD':
        return 25.0;
      case '3 Months : 70 JD':
        return 70.0;
      case '6 Months : 130 JD':
        return 130.0;
      case '12 Months : 250 JD':
        return 250.0;
      default:
        return 0.0; // Default case
    }
  }

  void _navigateToPaymentPage(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      double amount =
          _getPlanPrice(_selectedPlan); // Get the amount based on selected plan
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                PaymentPage(amount: amount)), // Pass the amount to PaymentPage
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFBC00), 
        title: Text(
          "FitnessMore",
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.black, // Black background for the entire page
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.network(
              'https://webassets-prod.ultimateperformance.com/uploads/2021/06/16163946/Ultimate-Performance-Banners-Nathan.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Semi-transparent Overlay for better contrast
          Positioned.fill(
            child: Container(
              color: const Color.fromARGB(255, 6, 6, 6)
                  .withOpacity(0.6), // Dark overlay for better contrast
            ),
          ),
          // Form Container
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Card(
                color: Colors.black
                    .withOpacity(0.1), // Black background for the card
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Logo/Title
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'One Step left ',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFFBC00),  // Yellow text for the logo
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'your Coach:',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        // Coach Dropdown
                        DropdownButton<String>(
                            isExpanded: true,
                            value: _selectedCoach,
                            items: <String>[
                              'ALI HAMDAN',
                              'SARAH ALKHATEEB',
                              'LAYAN TAMARI',
                              'OSAMA AZIZ'
                            ]
                                .map((String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    ))
                                .toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedCoach = newValue!;
                              });
                            },
                            style: const TextStyle(color: Color(0xFFFFBC00), ),
                            dropdownColor: Colors.black
                                .withOpacity(0.7) // Dropdown background black
                            ),
                        const SizedBox(height: 16),
                        const Text(
                          'workout type:',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        // Workout Dropdown
                        DropdownButton<String>(
                            isExpanded: true,
                            value: _selectedWorkout,
                            items: <String>[
                              'Yoga',
                              'HIIT',
                              'Strength Training',
                              'Cardio'
                            ]
                                .map((String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    ))
                                .toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedWorkout = newValue!;
                              });
                            },
                            style: const TextStyle(color: Color(0xFFFFBC00), ),
                            dropdownColor: Colors.black
                                .withOpacity(0.7) // Dropdown background black
                            ),
                        const SizedBox(height: 16),
                        const Text(
                          'time:',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        // Time Dropdown
                        DropdownButton<String>(
                            isExpanded: true,
                            value: _selectedTime,
                            items: <String>[
                              '10:00 AM - 12:00 PM',
                              '2:00 PM - 4:00 PM',
                              '5:00 PM - 7:00 PM',
                              '7:00 PM - 9:00 PM'
                            ]
                                .map((String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    ))
                                .toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedTime = newValue!;
                              });
                            },
                            style: const TextStyle(color: Color(0xFFFFBC00), ),
                            dropdownColor: Colors.black
                                .withOpacity(0.7) // Dropdown background black
                            ),
                        const SizedBox(height: 16),
                        const Text(
                          'your Plan:',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        // Plan Dropdown
                        DropdownButton<String>(
                            isExpanded: true,
                            value: _selectedPlan,
                            items: <String>[
                              '1 Month : 25 JD',
                              '3 Months : 70 JD',
                              '6 Months : 130 JD',
                              '12 Months : 250 JD',
                            ]
                                .map((String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    ))
                                .toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedPlan = newValue!;
                              });
                            },
                            style: const TextStyle(color: Color(0xFFFFBC00), ),
                            dropdownColor: Colors.black
                                .withOpacity(0.7) // Dropdown background black
                            ),
                        const SizedBox(height: 16),

                        // Proceed to Payment Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => _navigateToPaymentPage(context),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              backgroundColor: Color(0xFFFFBC00), 
                            ),
                            child: const Text(
                              'Proceed to Payment',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, // White text color
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
