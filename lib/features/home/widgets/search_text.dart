import 'package:flutter/material.dart';

class SearchText extends StatelessWidget {
  const SearchText({
    super.key,
    required this.controller,
    required this.onSearch,
  });
  final TextEditingController controller;
  final VoidCallback onSearch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(hintText: 'Search for images'),
            ),
          ),
          Container(
            decoration: const ShapeDecoration(
              color: Colors.black26,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
            child: IconButton(
              onPressed: onSearch,
              icon: const Icon(
                Icons.search,
              ),
            ),
          )
        ],
      ),
    );
  }
}
