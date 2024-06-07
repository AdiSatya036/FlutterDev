import 'package:flutter/material.dart';

class HalamanSatu extends StatefulWidget {
  const HalamanSatu({super.key});

  @override
  State<HalamanSatu> createState() => _HalamanSatuState();
}

class _HalamanSatuState extends State<HalamanSatu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Back"), 
          onPressed: () {
            Navigator.pop(context);
          }
        ),
      ),
    ); //const Placeholder();
  }
}