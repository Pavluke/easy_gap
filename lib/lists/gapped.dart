part of 'spaced_list.dart';

/// A widget list with automatic [Gap] spacing between children.
///
/// [Gapped] provides a convenient way to create a list of widgets with
/// consistent spacing between them, without manually adding [Gap] widgets.
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
///   children: Gapped(
///     spacing: 16,
///     children: [
///       Text('First item'),
///       Text('Second item'),
///       Text('Third item'),
///     ],
///   ),
/// )
/// ```
///
/// This is equivalent to:
/// ```dart
/// Column(
///   children: [
///     Text('First item'),
///     Gap(16),
///     Text('Second item'),
///     Gap(16),
///     Text('Third item'),
///   ],
/// )
/// ```
///
/// See also:
///  * [Gap], which creates a fixed-size gap.
///  * [GappedSlivers], for adding gaps between slivers.
class Gapped extends SpacedList {
  /// Creates a [Gapped] with spacing between regular widgets.
  ///
  /// The [spacing] parameter defines the size of the gap between widgets.
  /// It must be non-null and positive.
  ///
  /// The optional [crossAxisExtent] parameter allows you to specify the gap size
  /// along the cross axis (e.g., width of gap in a Column).
  ///
  /// The optional [color] parameter is useful for debugging to visualize
  /// where gaps are placed.
  Gapped({
    required double spacing,
    required List<Widget> children,
    double? crossAxisExtent,
    Color? color,
  }) : super._(
          widgets: children.gap(spacing, crossAxisExtent: crossAxisExtent, color: color),
        );
}
