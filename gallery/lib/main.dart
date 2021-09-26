import 'package:flutter/material.dart';

void main() {
  runApp(const CupertinewGallery());
}

class CupertinewGallery extends StatelessWidget {
  const CupertinewGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cupertinew Gallery',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const TemporaryNotice(),
    );
  }
}

class TemporaryNotice extends StatelessWidget {
  const TemporaryNotice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Text(
            '⚠️ This gallery is currently under construction. ⚠️',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
