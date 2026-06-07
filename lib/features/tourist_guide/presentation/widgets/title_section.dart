import 'package:flutter/material.dart';
import 'favorite_widget.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  const TitleSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isFavorite,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          FavoriteWidget(
            isFavorite: isFavorite,
            onPressed: onFavoritePressed,
            size: 32,
          ),
        ],
      ),
    );
  }
}
