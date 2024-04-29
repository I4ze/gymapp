import 'package:flutter/material.dart';
import 'package:flutter_gymapp/_comum/cores.dart';

InputDecoration getInputDesign(String label) {
  return InputDecoration(
    hintText: label,
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(64),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(64),
      borderSide: const BorderSide(color: Colors.black, width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(64),
      borderSide: const BorderSide(color: Cores.azulEscuro, width: 4),
    ),
  );
}
