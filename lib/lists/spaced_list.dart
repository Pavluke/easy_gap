import 'dart:collection';

import 'package:easy_gap/extensions/extensions.dart';
import 'package:flutter/widgets.dart';

part 'gapped.dart';
part 'gapped_slivers.dart';

/// Abstract base class for creating widget lists with spacing.
///
/// This class extends [ListBase] to provide list-like behavior for collections
/// of widgets with automatic spacing between them. It serves as the foundation
/// for concrete implementations like [Gapped] and [GappedSlivers].
///
/// [SpacedList] cannot be instantiated directly. Instead, use one of its
/// concrete subclasses or factory constructors:
///  * [Gapped] - for regular widgets in Columns, Rows, etc.
///  * [GappedSlivers] - for slivers in CustomScrollView.
///  * [SpacedList] - factory constructor for creating [Gapped].
///  * [SpacedList.slivers] - factory constructor for creating [GappedSlivers].
///
/// The class wraps an internal list of widgets and exposes it through the
/// standard [List] interface, making it compatible with any Flutter widget
/// that accepts a `List<Widget>` parameter.
///
/// Example using factory constructors:
/// ```dart
/// // Using SpacedList factory
/// Column(
///   children: SpacedList(
///     spacing: 16,
///     children: [
///       Text('Item 1'),
///       Text('Item 2'),
///     ],
///   ),
/// )
///
/// // Using SpacedList.slivers factory
/// CustomScrollView(
///   slivers: SpacedList.slivers(
///     spacing: 16,
///     slivers: [
///       SliverList(...),
///       SliverGrid(...),
///     ],
///   ),
/// )
/// ```
abstract class SpacedList with ListBase<Widget> {
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
  factory SpacedList({
    required double spacing,
    required List<Widget> children,
    double? crossAxisExtent,
    Color? color,
  }) =>
      Gapped(spacing: spacing, children: children, crossAxisExtent: crossAxisExtent, color: color);

  /// Creates a [GappedSlivers] with spacing between slivers.
  ///
  /// The [spacing] parameter defines the size of the gap between slivers.
  /// It must be non-null and positive.
  ///
  /// The optional [color] parameter is useful for debugging to visualize
  /// where gaps are placed.
  factory SpacedList.slivers({
    required double spacing,
    required List<Widget> slivers,
    Color? color,
  }) =>
      GappedSlivers(spacing: spacing, slivers: slivers, color: color);

  SpacedList._({
    required List<Widget> widgets,
  }) : _widgets = widgets;

  final List<Widget> _widgets;

  @override
  int get length => _widgets.length;

  @override
  set length(int newLength) => _widgets.length = newLength;

  @override
  Widget operator [](int index) => _widgets[index];

  @override
  void operator []=(int index, Widget value) => _widgets[index] = value;
}
