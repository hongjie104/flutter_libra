import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget? placeholder;
  const CachedImage({
    super.key,
    this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return _buildError();
    }
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) =>
          placeholder ??
          const Center(
            child: CircularProgressIndicator(),
          ),
      errorWidget: (context, url, error) => _buildError(),
    );
  }

  Widget _buildError() => const Icon(Icons.error);
}
