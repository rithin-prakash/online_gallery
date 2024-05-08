import 'package:flutter/material.dart';

import '../../../core/debouncer.dart';

class SearchText extends StatelessWidget {
  SearchText({
    super.key,
    required this.controller,
    required this.onSearch,
  });
  final TextEditingController controller;
  final VoidCallback onSearch;

  final debouncer = Debouncer(milliseconds: 500);

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
              onPressed: () {
                //debouncer added
                debouncer.run(() {
                  onSearch();
                });
              },
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
