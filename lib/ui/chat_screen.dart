import 'dart:io';

import 'package:codexias_academy/model/student_moel.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({required this.studentModel,super.key});
  final StudentModel studentModel;

  @override
  State<ChatScreen> createState() => _ChatScreenState();

}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text(widget.studentModel.name),
       ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(
         hintText: 'Message',
              prefixIcon: Icon(Icons.emoji_emotions_outlined),
              suffixIcon: Icon(Icons.mic),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.grey
              )
            )
            ),
          )
        ],
            ),
      ),
    );
  }
}
