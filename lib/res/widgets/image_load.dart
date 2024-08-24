import 'package:flutter/material.dart';

class ImageLoad extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;

  const ImageLoad({
    super.key,
    required this.imageUrl,
    this.width = 100.0,
    this.height = 100.0,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return Container(
            width: width,
            height: height,
            color: Colors.grey[200],
            child: Icon(
              Icons.image,
              size: width * 0.7,
              color: Colors.grey[400],
            ),
          );
        }
      },
      errorBuilder: (context, error, stackTrace) {
        // Error occurred while loading the image
        return Container(
          width: width,
          height: height,
          color: Colors.grey[200],
          child: Icon(
            Icons.image,
            size: width * 0.8,
            color: Colors.red,
          ),
        );
      },
    );
  }
}
