import 'package:flutter/material.dart';
class AppDecoration {
  static final switchButtonContainer = ShapeDecoration(
    color: const Color(0xFFF2F2F2),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(47),
    ),
  );

  static final switchButtonActive = ShapeDecoration(
    color: const Color(0xFFFF8702),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(47),
    ),
  );

  static final noteContainer = BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        spreadRadius: 3,
        blurRadius: 5,
        offset: const Offset(0, 4),
      ),
    ],
  );

  static final sliderContainer = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        spreadRadius: 2,
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  );

  static final listContainer = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(76),
    boxShadow: const [
      BoxShadow(
        color: Color(0x1CB5A1C0),
        blurRadius: 10.80,
        offset: Offset(2, 4),
        spreadRadius: 3,
      ),
    ],
  );

  static final saveContainer = BoxDecoration(
    color: const Color(0xFFF2F2F2),
    borderRadius: BorderRadius.circular(69),
  );
}
