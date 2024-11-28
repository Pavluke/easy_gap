import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

extension GapExt<T extends Widget> on List<T> {
  /// Return a widget list with Gap between that takes a fixed [extent] of space.
  /// The [extent] must not be null and must be positive.
  List<Widget> gap(double extent) => _gapExtBuildWith(Gap(extent));

  /// Return a widget list with SliverGap between that takes a fixed [extent] of space.
  /// The [extent] must not be null and must be positive.
  List<Widget> sliverGap(double extent) => _gapExtBuildWith(SliverGap(extent));

  List<Widget> _gapExtBuildWith(Widget gap) =>
      isEmpty ? this : expand((widget) => [widget, gap]).toList()
        ..removeLast();
}
