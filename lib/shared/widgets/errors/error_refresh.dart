import 'package:flutter/material.dart';

class ErrorRefresh extends StatelessWidget {
  final VoidCallback onRefresh;
  final String message;
  const ErrorRefresh(
      {super.key,
      required this.onRefresh,
      this.message = 'Something went wrong'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          const Icon(Icons.highlight_off, color: Colors.red, size: 76),
          Text(
            message,
            style: const TextStyle(fontSize: 18),
          ),
          ElevatedButton(
            onPressed: onRefresh,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            child: const Text(
              'Refresh',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
