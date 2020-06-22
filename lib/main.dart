import 'package:flutter/material.dart';
import 'homepage.dart';

void main() => runApp(VoiceNews());

class VoiceNews extends StatefulWidget {
  @override
  _VoiceNewsState createState() => _VoiceNewsState();
}

class _VoiceNewsState extends State<VoiceNews> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'voicenews',
      theme: ThemeData(
        primarySwatch: Colors.grey
      ),
      home: HomePage()
    );
  }
}