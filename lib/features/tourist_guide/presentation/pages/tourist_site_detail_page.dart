import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/tourist_site.dart';
import '../providers/tourist_sites_provider.dart';
import '../widgets/button_section.dart';
import '../widgets/title_section.dart';
import '../widgets/text_section.dart';

class TouristSiteDetailPage extends ConsumerStatefulWidget {
  final TouristSite site;
  final String heroTag;

  const TouristSiteDetailPage({
    super.key,
    required this.site,
    required this.heroTag,
  });

  @override
  ConsumerState<TouristSiteDetailPage> createState() =>
      _TouristSiteDetailPageState();
}

class _TouristSiteDetailPageState
    extends ConsumerState<TouristSiteDetailPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _cascadeController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 800),
  );

  @override
  void initState() {
    super.initState();
    _cascadeController.forward();
  }

  @override
  void dispose() {
    _cascadeController.dispose();
    super.dispose();
  }

  Widget _cascade({
    required Widget child,
    required int order,
  }) {
    final start = order / 4.0;
    final end = (order + 1.5) / 4.0;
    final animation = CurvedAnimation(
      parent: _cascadeController,
      curve: Interval(start, end.clamp(0.0, 1.0), curve: Curves.easeOut),
    );

    return AnimatedBuilder(
      animation: _cascadeController,
      builder: (context, _) {
        return Opacity(
          opacity: animation.value,
          child: Transform.translate(
            offset: Offset(0, 24 * (1 - animation.value)),
            child: child,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final site = widget.site;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: Column(
              children: [
                _cascade(
                  order: 1,
                  child: TitleSection(
                    title: site.name,
                    subtitle: site.location,
                    isFavorite: site.isFavorite,
                    onFavoritePressed: () {
                      ref
                          .read(touristSitesProvider.notifier)
                          .toggleFavorite(site.id);
                    },
                  ),
                ),
                _cascade(
                  order: 2,
                  child: Column(
                    children: [
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
                    ],
                  ),
                ),
                _cascade(
                  order: 3,
                  child: Column(
                    children: [
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
          tag: widget.heroTag,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                widget.site.imageUrl,
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
