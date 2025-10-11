part of 'spaced_list.dart';

/// A sliver list with automatic [SliverGap] spacing between children.
///
/// [GappedSlivers] provides a convenient way to create a list of slivers with
/// consistent spacing between them, without manually adding [SliverGap] widgets.
///
/// The [spacing] parameter defines the size of the gap between slivers.
/// It must be non-null and positive.
///
/// The optional [color] parameter is useful for debugging to visualize
/// where gaps are placed.
///
/// Example:
/// ```dart
/// CustomScrollView(
///   slivers: GappedSlivers(
///     spacing: 16,
///     slivers: [
///       SliverToBoxAdapter(child: Text('First item')),
///       SliverList(...),
///       SliverGrid(...),
///     ],
///   ),
/// )
/// ```
///
/// This is equivalent to:
/// ```dart
/// CustomScrollView(
///   slivers: [
///     SliverToBoxAdapter(child: Text('First item')),
///     SliverGap(16),
///     SliverList(...),
///     SliverGap(16),
///     SliverGrid(...),
///   ],
/// )
/// ```
///
/// See also:
///  * [SliverGap], which creates a fixed-size gap in a sliver context.
///  * [Gapped], for adding gaps between regular widgets.
class GappedSlivers extends SpacedList {
  /// Creates a [GappedSlivers] with spacing between slivers.
  ///
  /// The [spacing] parameter defines the size of the gap between slivers.
  /// It must be non-null and positive.
  ///
  /// The optional [color] parameter is useful for debugging to visualize
  /// where gaps are placed.
  GappedSlivers({
    required double spacing,
    required List<Widget> slivers,
    Color? color,
  }) : super._(
          widgets: slivers.sliverGap(spacing, color: color),
        );
}
