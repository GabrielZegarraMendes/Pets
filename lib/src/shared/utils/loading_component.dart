import 'package:flutter/material.dart';

Widget getLoading(BuildContext context) {
  return const Center(
    child: CircularProgressIndicator(
      backgroundColor: Colors.transparent,
      color: Colors.indigo,
    ),
  );
}