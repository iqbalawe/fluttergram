import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/utils.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: primaryColor,
        strokeWidth: 1.5,
      ),
    );
  }
}
