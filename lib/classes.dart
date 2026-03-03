import 'package:flutter/material.dart';

class ClassesPage extends StatelessWidget {
  final List<Map<String, String>> classes = [
    {
      'type': 'Cardio',
      'coach': 'Osama Aziz',
      'time': '5:00 - 7:00',
      'imageUrl':
          'https://images.pexels.com/photos/3763868/pexels-photo-3763868.jpeg',
          
    },
    {
      'type': 'Yoga',
      'coach': 'Ali Hamdan',
      'time': '7:00 - 9:00',
      'imageUrl':
          'https://images.pexels.com/photos/3772502/pexels-photo-3772502.jpeg',
    },
    {
      'type': 'HIIT',
      'coach': 'Sarah Alkhatteeb',
      'time': '10:00 - 12:00',
      'imageUrl':
          'https://images.pexels.com/photos/8736748/pexels-photo-8736748.jpeg',
    },
    {
      'type': 'Strength Training',
      'coach': 'Layan Tamari',
      'time': '2:00 - 4:00',
      'imageUrl':
          'https://images.pexels.com/photos/7690830/pexels-photo-7690830.jpeg',
    },
  ];

  ClassesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Classes'),
        backgroundColor: Color(0xFFFFBC00), 
      ),
      body: Container(
        color: Colors.black, // Set background color to black
        child: ListView.builder(
          itemCount: classes.length,
          itemBuilder: (context, index) {
            final classData = classes[index];
            return Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0), // Add vertical spacing
              child: ClassCard(
                type: classData['type']!,
                coach: classData['coach']!,
                time: classData['time']!,
                imageUrl: classData['imageUrl']!,
              ),
            );
          },
        ),
      ),
    );
  }
}

class ClassCard extends StatelessWidget {
  final String type;
  final String coach;
  final String time;
  final String imageUrl;

  const ClassCard({
    super.key,
    required this.type,
    required this.coach,
    required this.time,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      color: Color(0xFFFFBC00) .withOpacity(0.9),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image on the left side
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                height: 120, // height of the image
                width: 120, // width of the image
              ),
            ),
            const SizedBox(width: 16), // Space between the image and text
            // Text information on the right side
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Class Type: $type',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Colors.black, // Text color for better visibility
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Coach: $coach',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  Text(
                    'Time: $time',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  const SizedBox(height: 16),
                  // Join Live Button
                  ElevatedButton(
                    onPressed: () {
                      // Handle button press (e.g., navigate to live video)
                      print('Join Live Video');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Join Live Video',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10), // Button text color
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
