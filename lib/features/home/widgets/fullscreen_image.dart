import 'package:flutter/material.dart';

class FullscreenImage extends StatelessWidget {
  final String url;
  const FullscreenImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
            // right: 0, left: 0, top: 0, bottom: 0,

            child: Image.network(url)),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
