import 'package:flutter/material.dart';
import 'dart:math';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  String? _liveCallUrl;
  List<String> members = [
    'Ahmed Al-Fahad',
    'Fatima Al-Hashim',
    'Yousef Al-Khatib',
    'Mona Al-Tayeb',
    'Khaled Al-Mansoor',
    'Rania Al-Jaber',
    'Omar Al-Salem',
    'Laila Al-Dosari',
    'Ali Al-Faris',
    'Sana Al-Khalil',
    'Zainab Al-Hamdan',
    'Yassir Al-Khatib',
    'Nora Al-Fayez',
    'Samir Al-Basha',
    'Amina Al-Sayed',
    'Hassan Al-Qudsi',
    'Marwa Al-Ahmad',
    'Osama Al-Sheikh',
    'Reem Al-Mazrouei',
    'Samiha Al-Hassan',
  ];
  List<String> selectedMembers = [];

  // Function to Generate Random Live Call URL
  String _generateLiveCallUrl() {
    const String baseUrl = "https://livecall.example.com/session/";
    final String sessionId = Random().nextInt(100000).toString();
    return "$baseUrl$sessionId";
  }

  // Function to Start Live Call
  void _startLiveCall() {
    setState(() {
      _liveCallUrl = _generateLiveCallUrl();
    });
    _showLiveCallDialog();
  }

  // Function to Toggle Member Selection
  void _toggleMemberSelection(String member) {
    setState(() {
      if (selectedMembers.contains(member)) {
        selectedMembers.remove(member);
      } else {
        selectedMembers.add(member);
      }
    });
  }

  // Function to Send URL to Selected Members
  void _sendUrlToMembers() {
    if (_liveCallUrl != null && selectedMembers.isNotEmpty) {
      // Simulate sending the URL to members
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: const Text(
              "URL Sent Successfully",
              style: TextStyle(color: Colors.yellow),
            ),
            content: Text(
              "The URL has been sent to ${selectedMembers.length} members.",
              style: const TextStyle(color: Colors.white70),
            ),
            actions: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.done, color: Colors.black),
                label: const Text(
                  "Close",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
              ),
            ],
          );
        },
      );
    } else {
      // Show a message if no URL or members are selected
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: const Text(
              "Error",
              style: TextStyle(color: Colors.yellow),
            ),
            content: const Text(
              "Please generate a live call URL and select members to send it to.",
              style: TextStyle(color: Colors.white70),
            ),
            actions: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close, color: Colors.black),
                label: const Text(
                  "Close",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
              ),
            ],
          );
        },
      );
    }
  }

  // Show Dialog with Live Call URL
  void _showLiveCallDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Text(
            "Live Call Started",
            style: TextStyle(color: Colors.yellow),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Share the following URL with members:",
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  border: Border.all(color: Colors.yellow),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SelectableText(
                  _liveCallUrl ?? "",
                  style: const TextStyle(
                      color: Colors.yellow, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _sendUrlToMembers,
                icon: const Icon(Icons.send, color: Colors.black),
                label: const Text(
                  "Send URL to Selected Members",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.done, color: Colors.black),
                label: const Text(
                  "Close",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFBC00),
        title: const Text(
          "Start Live Call",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _startLiveCall,
              icon: const Icon(Icons.video_call, color: Colors.black),
              label: const Text(
                "Start Live Call",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFBC00),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "Select Members to Send URL",
              style: TextStyle(fontSize: 18, color: Colors.white70),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: members.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(
                      members[index],
                      style: TextStyle(color: Colors.white),
                    ),
                    value: selectedMembers.contains(members[index]),
                    onChanged: (bool? value) {
                      _toggleMemberSelection(members[index]);
                    },
                    activeColor: Colors.yellow,
                    checkColor: Colors.black,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black87,
    );
  }
}
