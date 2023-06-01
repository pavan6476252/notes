import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String msg, bool IsError) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: IsError ? Colors.redAccent : Colors.green));
}
