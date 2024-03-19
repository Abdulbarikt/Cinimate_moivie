import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';

class buildListTile extends StatelessWidget {
  const buildListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.kPrimary, AppColors.kBlackColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.kPrimary.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.white,
          ),
          title: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          trailing: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
