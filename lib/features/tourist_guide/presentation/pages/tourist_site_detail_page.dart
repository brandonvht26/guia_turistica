import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/tourist_site.dart';
import '../providers/tourist_sites_provider.dart';
import '../widgets/button_section.dart';
import '../widgets/title_section.dart';
import '../widgets/text_section.dart';

class TouristSiteDetailPage extends ConsumerWidget {
  final TouristSite site;
  final String heroTag;

  const TouristSiteDetailPage({
    super.key,
    required this.site,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: Column(
              children: [
                TitleSection(
                  title: site.name,
                  subtitle: site.location,
                  isFavorite: site.isFavorite,
                  onFavoritePressed: () {
                    ref
                        .read(touristSitesProvider.notifier)
                        .toggleFavorite(site.id);
                  },
                ),
                Divider(
                  height: 1,
                  color: Colors.grey.shade200,
                  thickness: 1,
                ),
                ButtonSection(
                  phoneNumber: '+593 9 7778877663',
                  locationName: site.name,
                  shareMessage:
                      'Mira esto: ${site.name} - ${site.location}',
                ),
                Divider(
                  height: 1,
                  color: Colors.grey.shade200,
                  thickness: 1,
                ),
                TextSection(
                  description: site.description,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      elevation: 0,
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Theme.of(context).colorScheme.primary,
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
       flexibleSpace: FlexibleSpaceBar(
         background: Hero(
           tag: heroTag,
           child: Stack(
             fit: StackFit.expand,
             children: [
               Image.network(
                 site.imageUrl,
                 fit: BoxFit.cover,
                 errorBuilder: (context, error, stackTrace) {
                   return Container(
                     color: Colors.grey.shade300,
                     child: const Center(
                       child: Icon(Icons.image_not_supported),
                     ),
                   );
                 },
               ),
               Container(
                 decoration: BoxDecoration(
                   gradient: LinearGradient(
                     begin: Alignment.topCenter,
                     end: Alignment.bottomCenter,
                     colors: [
                       Colors.transparent,
                       Colors.black.withValues(alpha: 0.3),
                     ],
                   ),
                 ),
               ),
             ],
           ),
         ),
       ),
     );
   }
}
