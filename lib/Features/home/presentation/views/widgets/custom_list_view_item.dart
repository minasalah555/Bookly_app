import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class FeatureListViewItem extends StatelessWidget {
  const FeatureListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AssetsData.test),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
