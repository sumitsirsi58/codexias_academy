import 'package:flutter/material.dart';

class PaYScreen extends StatefulWidget {
  const PaYScreen({super.key});

  @override
  State<PaYScreen> createState() => _PaYScreenState();
}

class _PaYScreenState extends State<PaYScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOjynLaramHQQQCsoObb7Jpp9ebhcy98dxiA&s',
            ),
          ),
          Text(
            'Please Scan Qr Code and Pay your Fees',
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
