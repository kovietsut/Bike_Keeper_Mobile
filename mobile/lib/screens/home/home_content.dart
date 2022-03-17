import 'package:mobile/screens/profile/profile_content.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  final double height;

  const HomeContent({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfileContent(height: height);
  }
}
