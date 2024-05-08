import 'package:flutter/material.dart';

class FullscreenImage extends StatelessWidget {
  final String url;
  const FullscreenImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Image.network(url);
  }
}
