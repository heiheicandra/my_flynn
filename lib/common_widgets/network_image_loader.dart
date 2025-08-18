import 'package:flutter/material.dart';
import 'package:my_flynn/utils/bool_extension.dart';
import 'package:my_flynn/utils/num_extension.dart';

class NetworkImageLoader extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double? aspectRatio;
  final BoxFit? fit;
  const NetworkImageLoader({
    super.key,
    required this.imageUrl,
    this.aspectRatio,
    this.width,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(8),
      child: SizedBox(
        width: width ?? 100.w(context),
        height: height ?? 100.w(context),
        child: Image.network(
          imageUrl,
          fit: fit ?? BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            final progress = loadingProgress.cumulativeBytesLoaded;
            final total = loadingProgress.expectedTotalBytes;
            return Center(
              child: CircularProgressIndicator(
                value: (total != null).either(
                  trueV: () {
                    return progress / total!;
                  },
                  falseV: () => null,
                ),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return ColoredBox(
              color: Colors.grey.shade300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.broken_image,
                    size: 20.sp(context),
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
