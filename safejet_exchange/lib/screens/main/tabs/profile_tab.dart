import 'package:flutter/material.dart';
import '../../../config/theme/colors.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profile Tab',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
} 