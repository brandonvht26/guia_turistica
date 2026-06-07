import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/tourist_site.dart';
import '../providers/tourist_sites_provider.dart';
import '../widgets/favorite_widget.dart';
import 'tourist_site_detail_page.dart';

class TouristSiteListPage extends ConsumerStatefulWidget {
  const TouristSiteListPage({super.key});

  @override
  ConsumerState<TouristSiteListPage> createState() =>
      _TouristSiteListPageState();
}

class _TouristSiteListPageState extends ConsumerState<TouristSiteListPage> {
  late final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sitesAsync = ref.watch(filteredTouristSitesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Guía turística del Ecuador',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildFilterChips(context),
          Expanded(
            child: sitesAsync.when(
              data: (sites) => _buildFadedList(context, sites),
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline,
                        size: 64, color: Colors.grey.shade400),
                    const SizedBox(height: 16),
                    Text('Error al cargar los sitios',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(error.toString(),
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips(BuildContext context) {
    final activeFilter = ref.watch(sortFilterProvider);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Wrap(
        spacing: 10,
        runSpacing: 6,
        children: [
          _buildChip(
            context,
            label: 'A-Z',
            icon: Icons.sort_by_alpha_rounded,
            selected: activeFilter == TouristSiteFilter.allAZ,
            onSelected: (_) =>
                ref.read(sortFilterProvider.notifier).set(TouristSiteFilter.allAZ),
          ),
          _buildChip(
            context,
            label: 'Z-A',
            icon: Icons.sort_by_alpha_rounded,
            selected: activeFilter == TouristSiteFilter.allZA,
            onSelected: (_) =>
                ref.read(sortFilterProvider.notifier).set(TouristSiteFilter.allZA),
          ),
          _buildChip(
            context,
            label: 'Favoritos',
            icon: Icons.favorite_rounded,
            selected: activeFilter == TouristSiteFilter.favorites,
            onSelected: (_) =>
                ref.read(sortFilterProvider.notifier).set(TouristSiteFilter.favorites),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(
    BuildContext context, {
    required String label,
    required IconData icon,
    required bool selected,
    required ValueChanged<bool> onSelected,
  }) {
    final primary = Theme.of(context).colorScheme.primary;

    return FilterChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: selected ? Colors.white : primary.withValues(alpha: 0.7),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
              color: selected ? Colors.white : primary,
            ),
          ),
        ],
      ),
      selected: selected,
      onSelected: onSelected,
      backgroundColor: primary.withValues(alpha: 0.08),
      selectedColor: primary,
      checkmarkColor: Colors.white,
      side: BorderSide(
        color: selected ? primary : primary.withValues(alpha: 0.2),
        width: 1.5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      visualDensity: VisualDensity.compact,
    );
  }

  Widget _buildFadedList(BuildContext context, List<TouristSite> sites) {
    if (sites.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border_rounded,
                size: 64, color: Colors.grey.shade300),
            const SizedBox(height: 16),
            Text(
              'Sin favoritos',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey.shade500,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              'Marca sitios con el ícono de corazón',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade400,
                  ),
            ),
          ],
        ),
      );
    }

    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: const [
            Colors.transparent,
            Colors.white,
            Colors.white,
            Colors.transparent,
          ],
          stops: const [0.0, 0.05, 0.93, 1.0],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.only(top: 16, bottom: 32),
        itemCount: sites.length,
        itemBuilder: (context, index) {
          final site = sites[index];
          final heroTag = 'site_${site.id}';
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
            child: _ParallaxCard(
              site: site,
              heroTag: heroTag,
              scrollController: _scrollController,
              index: index,
              onFavoritePressed: () {
                ref
                    .read(touristSitesProvider.notifier)
                    .toggleFavorite(site.id);
              },
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 450),
                    reverseTransitionDuration: const Duration(milliseconds: 350),
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return TouristSiteDetailPage(
                        site: site,
                        heroTag: heroTag,
                      );
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity:
                            CurveTween(curve: Curves.easeOut).animate(animation),
                        child: child,
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _ParallaxCard extends StatefulWidget {
  final TouristSite site;
  final String heroTag;
  final ScrollController scrollController;
  final int index;
  final VoidCallback onFavoritePressed;
  final VoidCallback onTap;

  const _ParallaxCard({
    required this.site,
    required this.heroTag,
    required this.scrollController,
    required this.index,
    required this.onFavoritePressed,
    required this.onTap,
  });

  @override
  State<_ParallaxCard> createState() => _ParallaxCardState();
}

class _ParallaxCardState extends State<_ParallaxCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pressController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
    value: 1.0,
  );

  @override
  void dispose() {
    _pressController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _pressController.animateTo(0.97, curve: Curves.easeOut);
  }

  void _onTapUp(TapUpDetails details) {
    _pressController.animateTo(1.0, curve: Curves.easeOut);
  }

  void _onTapCancel() {
    _pressController.animateTo(1.0, curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pressController,
      builder: (context, child) {
        return Transform.scale(
          scale: _pressController.value,
          child: child,
        );
      },
      child: Material(
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          onTap: widget.onTap,
          onTapDown: _onTapDown,
          onTapUp: _onTapUp,
          onTapCancel: _onTapCancel,
          borderRadius: BorderRadius.circular(18),
          child: Container(
            height: 260,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.10),
                  blurRadius: 20,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: widget.heroTag,
                    child: _ParallaxImage(
                      imageUrl: widget.site.imageUrl,
                      scrollController: widget.scrollController,
                      index: widget.index,
                    ),
                  ),
                  _buildGradientOverlay(),
                  _buildContentOverlay(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGradientOverlay() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withValues(alpha: 0.55),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContentOverlay(BuildContext context) {
    return Positioned.fill(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: FavoriteWidget(
                  isFavorite: widget.site.isFavorite,
                  onPressed: widget.onFavoritePressed,
                  size: 20,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.site.name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black.withValues(alpha: 0.5),
                            offset: const Offset(0, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.location_on_rounded,
                        color: Colors.white, size: 16),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        widget.site.location,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.white70),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ParallaxImage extends StatelessWidget {
  final String imageUrl;
  final ScrollController scrollController;
  final int index;

  const _ParallaxImage({
    required this.imageUrl,
    required this.scrollController,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    const double cardHeight = 260;
    const double verticalPadding = 8;

    return AnimatedBuilder(
      animation: scrollController,
      builder: (context, child) {
        final itemOffset = index * (cardHeight + verticalPadding * 2);
        final parallax = (scrollController.offset - itemOffset) * 0.10;
        return Transform.translate(
          offset: Offset(0, parallax),
          child: Transform.scale(
            scale: 1.25,
            child: child,
          ),
        );
      },
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.grey.shade300,
          child: const Center(child: Icon(Icons.image_not_supported)),
        ),
      ),
    );
  }
}
