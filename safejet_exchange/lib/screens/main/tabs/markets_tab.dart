import 'package:flutter/material.dart';
import '../../../config/theme/colors.dart';

class MarketsTab extends StatelessWidget {
  const MarketsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Markets Tab',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
} 