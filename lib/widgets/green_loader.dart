import 'package:flutter/material.dart';
import '../resources/colors.dart';

class GreenLoader extends StatelessWidget {
  const GreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
      ),
    );
  }
} 