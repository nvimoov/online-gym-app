import 'package:flutter/material.dart';
import 'payment.dart'; // Import PaymentPage

class CoachSelectionPage extends StatefulWidget {
  @override
  _CoachSelectionPageState createState() => _CoachSelectionPageState();
}

class _CoachSelectionPageState extends State<CoachSelectionPage> {
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
        title: Text('Select Your Coach'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose your Coach:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
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
              ),
              SizedBox(height: 20),
              Text(
                'Choose your workout type:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                isExpanded: true,
                value: _selectedWorkout,
                items: <String>['Yoga', 'HIIT', 'Strength Training', 'Cardio']
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
              ),
              SizedBox(height: 20),
              Text(
                'Choose your time:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                isExpanded: true,
                value: _selectedTime,
                items: <String>[
                  '10:00 AM - 12:00 PM', // Updated time options
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
              ),
              SizedBox(height: 20),
              Text(
                'Choose your Plan:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
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
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _navigateToPaymentPage(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFBC00), 
                    foregroundColor: Colors.black,
                  ),
                  child: Text('Proceed to Payment'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
