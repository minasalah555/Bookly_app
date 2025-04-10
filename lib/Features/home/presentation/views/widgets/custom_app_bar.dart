import 'package:bookly_app/core/utils/app_routers.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(AssetsData.logo, width: 100, height: 100),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouters.searchView);
            },
            icon: Icon(FontAwesomeIcons.magnifyingGlass, size: 26),
          ),
        ],
      ),
    );
  }
}
