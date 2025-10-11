import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

/// Extension methods for adding gaps between widgets in a list.
///
/// Provides convenient methods to insert [Gap] or [SliverGap] widgets
/// between all elements in a widget list.
extension GapExt<T extends Widget> on List<T> {
  /// Returns a widget list with [Gap] between each widget.
  ///
  /// Inserts a [Gap] of the specified [spacing] between each widget in the list.
  ///
  /// The [spacing] parameter defines the size of the gap between widgets.
  /// It must be non-null and positive.
  ///
  /// The optional [crossAxisExtent] parameter allows you to specify the gap size
  /// along the cross axis (e.g., width of gap in a Column).
  ///
  /// The optional [color] parameter is useful for debugging to visualize
  /// where gaps are placed.
  ///
  /// Example:
  /// ```dart
  /// Column(
  ///   children: [
  ///     Text('First item'),
  ///     Text('Second item'),
  ///     Text('Third item'),
  ///   ].gap(16),
  /// )
  /// ```
  ///
  /// See also:
  ///  * [Gap], which creates a fixed-size gap.
  ///  * [sliverGap], for adding gaps between slivers.
  List<Widget> gap(double spacing, {double? crossAxisExtent, Color? color}) => _gapExtBuildWith(
        Gap(
          spacing,
          crossAxisExtent: crossAxisExtent,
          color: color,
        ),
      );

  /// Returns a sliver list with [SliverGap] between each sliver.
  ///
  /// Inserts a [SliverGap] of the specified [spacing] between each sliver in the list.
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
  ///   slivers: [
  ///     SliverList(...),
  ///     SliverGrid(...),
  ///     SliverToBoxAdapter(...),
  ///   ].sliverGap(16),
  /// )
  /// ```
  ///
  /// See also:
  ///  * [SliverGap], which creates a fixed-size gap in a sliver context.
  ///  * [gap], for adding gaps between regular widgets.
  List<Widget> sliverGap(double spacing, {Color? color}) => _gapExtBuildWith(
        SliverGap(spacing, color: color),
      );

  /// Internal helper method to build a list with gaps.
  ///
  /// Takes each widget in the list and expands it into a pair of [widget, gap],
  /// then removes the last gap to avoid trailing space.
  List<Widget> _gapExtBuildWith(Widget gap) => isEmpty ? this : expand((widget) => [widget, gap]).toList()
    ..removeLast();
}
