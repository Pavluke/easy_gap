import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

extension GapExt<T extends Widget> on List<T> {
  ///Creates a widget that takes a fixed [mainAxisExtent] of space in the direction of its parent.
  ///
  ///The [mainAxisExtent] must not be null and must be positive. The [crossAxisExtent] must be either null or positive.
  List<Widget> gap(
    double mainAxisExtent, {
    Key? key,
    double? crossAxisExtent,
    Color? color,
  }) =>
      _gapExtBuildWith(Gap(
        mainAxisExtent,
        key: key,
        crossAxisExtent: crossAxisExtent,
        color: color,
      ));

  ///Creates a widget that takes, at most, the specified [mainAxisExtent] of space in a [Row], [Column], or [Flex] widget.
  ///
  ///The [mainAxisExtent] must not be null and must be positive. The [crossAxisExtent] must be either null or positive.
  List<Widget> maxGap(
    double mainAxisExtent, {
    Key? key,
    double? crossAxisExtent,
    Color? color,
  }) =>
      _gapExtBuildWith(MaxGap(
        mainAxisExtent,
        key: key,
        crossAxisExtent: crossAxisExtent,
        color: color,
      ));

  ///Creates a sliver that takes a fixed [mainAxisExtent] of space.
  ///
  ///The [mainAxisExtent] must not be null and must be positive.
  List<Widget> sliverGap(
    double mainAxisExtent, {
    Key? key,
    Color? color,
  }) =>
      _gapExtBuildWith(SliverGap(
        mainAxisExtent,
        key: key,
        color: color,
      ));

  List<Widget> _gapExtBuildWith(Widget gap) =>
      isEmpty ? this : expand((widget) => [widget, gap]).toList()
        ..removeLast();
}
