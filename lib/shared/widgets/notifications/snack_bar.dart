import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String message,
    [Color color = Colors.red]) {
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      bottom: MediaQuery.of(context).padding.bottom,
      left: 20,
      right: 20,
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(8),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    ),
  );

  Overlay.of(context).insert(overlayEntry);
  Future.delayed(const Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}
