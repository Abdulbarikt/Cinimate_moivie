import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../services/api/apikey.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'data',
                      style: TextStyle(color: Colors.amber),
                    ),
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child:

                          // CachedNetworkImage(
                          //   imageUrl: snapshot.data.urlToImage.toString(),
                          //   height: 160,
                          //   width: double.infinity,
                          //   fit: BoxFit.cover,
                          //   placeholder: (context, url) =>
                          //       const Center(child: CircularProgressIndicator()),
                          //   errorWidget: (context, url, error) =>
                          //       const Icon(Icons.error, size: 160),
                          // ),

                          Image.network(
                        '${ApiKey.imagePath}${snapshot.data![index].urlToImage}',
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title

                          Text(
                            snapshot.data[index].title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.amber),
                          ),
                          const SizedBox(height: 8),
                          // Subtitle
                          Text(
                            snapshot.data[index].author,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Trailing widget
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Trailing widget content
                          IconButton(
                            icon: const Icon(Icons.favorite), // Example icon
                            onPressed: () {
                              // Add your onPressed logic here
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.share), // Example icon
                            onPressed: () {
                              // Add your onPressed logic here
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
