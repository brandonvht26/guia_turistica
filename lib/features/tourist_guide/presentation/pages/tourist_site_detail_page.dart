import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
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

  Widget _buildCard({required Widget child}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final sitesAsync = ref.watch(touristSitesProvider);
    final site = sitesAsync.asData?.value.firstWhere(
          (s) => s.id == widget.site.id,
          orElse: () => widget.site,
        ) ??
        widget.site;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
              child: Column(
                children: [
                  _cascade(
                    order: 1,
                    child: _buildCard(
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
                  ),
                  const SizedBox(height: 12),
                  _cascade(
                    order: 2,
                    child: _buildCard(
                      child: ButtonSection(
                        phoneNumber: '+593 9 7778877663',
                        locationName: site.name,
                        shareMessage:
                            'Mira esto: ${site.name} - ${site.location}',
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _cascade(
                    order: 3,
                    child: _buildCard(
                      child: TextSection(
                        description: site.description,
                      ),
                    ),
                  ),
                ],
              ),
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
            color:
                Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(14),
          ),
          child: IconButton(
            icon: const Icon(LucideIcons.arrowLeft),
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
              widget.site.imageUrl.startsWith('http')
                  ? Image.network(
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
                    )
                  : Image.asset(
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
