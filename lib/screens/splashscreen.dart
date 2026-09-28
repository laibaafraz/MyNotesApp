import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notesapp/screens/homescreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
     Timer(Duration(seconds:3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homescreen()));
      
     }); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
    body: Column(
      children: [
        SizedBox(height: 300),
        Center(
          child: CircleAvatar(
            radius: 100,
            backgroundColor: Colors.amber, 
            child: Icon(
              Icons.notes,
              color: Colors.white, 
              size: 60, 
            ),
          ),
        ),
          Text("My Notes", style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w800,
              letterSpacing: 2,
               color: Color(0xFF212121),
  ),
),
        SizedBox(height: 30),
        CircularProgressIndicator(
          color: Colors.amber),
       ],

      ),

    );
  }
}