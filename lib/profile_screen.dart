

import 'package:flutter/material.dart';
import 'package:flutter_basic/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<AuthProvider>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    final workingDays = ["Sat", "Sun", "Mon", "Tue"];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text("Profile", style: TextStyle(color: Colors.black)),
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.edit, color: Colors.blue),
            label: const Text("Edit", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/profile.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: -5,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                       Icons.camera_alt,
                      size:30 ,

                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // TextFields
          Consumer<AuthProvider>(builder: (context, value, child) {
            return  _buildTextField(value.name);
          },),

          Consumer<AuthProvider>(builder: (context, value, child) {
            return  _buildTextField(value.email);
          },),
          _buildTextField("+880 1767 432445"),
          _buildTextField("Maan Store"),
          _buildTextField("Fashion Store"),

          // Country and Language buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBorderButton("United States"),
              _buildBorderButton("English"),
            ],
          ),

          const SizedBox(height: 24),

          const Text("Working Day",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

          const SizedBox(height: 12),

          Wrap(
            spacing: 10,
            children: workingDays.map((day) => _buildDayButton(day)).toList(),
          )
        ],
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }

  Widget _buildBorderButton(String text) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(text, style: const TextStyle(fontSize: 14)),
        ),
      ),
    );
  }

  Widget _buildDayButton(String day) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        day,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
