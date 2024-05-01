import 'package:flutter/material.dart';
import 'package:online_gallery/services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ElevatedButton(
          child: Text('kdc'),
          onPressed: () {
            ApiService.instance.getImages('');
          },
        ),
      ),
    );
  }
}
