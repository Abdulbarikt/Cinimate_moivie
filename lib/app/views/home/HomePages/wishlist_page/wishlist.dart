import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../../utils/colors.dart';

class WishList extends StatelessWidget {
  const WishList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      appBar: AppBar(
        backgroundColor: AppColors.kBlackColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Wishlist",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: AppColors.kWhite,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 4),
        children: [
          WishListCard(
            title: ' Shani',
            subtitle: 'Ponmala ',
            imageUrl:
                "https://i.pinimg.com/564x/b9/15/f5/b915f535c5a791058b211a527612e83c.jpg",
            onRemove: () {},
          ),
          const SizedBox(height: 18),
          WishListCard(
            title: 'Shani',
            subtitle: 'Ponmala',
            imageUrl:
                'https://i.pinimg.com/564x/d2/72/65/d27265d5a2b6d1f28818d0a5fff82035.jpg',
            onRemove: () {},
          ),
          const SizedBox(height: 18),
          WishListCard(
            title: 'Shani',
            subtitle: 'Ponmala',
            imageUrl:
                'https://i.pinimg.com/564x/d2/72/65/d27265d5a2b6d1f28818d0a5fff82035.jpg',
            onRemove: () {},
          ),
        ],
      ),
    );
  }
}

class WishListCard extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? imageUrl;
  final VoidCallback? onRemove;

  const WishListCard({
    this.title,
    this.subtitle,
    this.imageUrl,
    this.onRemove,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
      color: AppColors.kBackground2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.network(
              imageUrl!,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            title: Text(
              title!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              subtitle!,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            trailing: IconButton(
              onPressed: onRemove,
              icon: const Icon(
                CupertinoIcons.delete,
                color: AppColors.kPrimary,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
