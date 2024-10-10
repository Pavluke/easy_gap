import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

extension GapExt<T extends Widget> on List<T> {
  List<Widget> gap(double extent) => _gapExtBuildWith(Gap(extent));

  List<Widget> sliverGap(double extent) => _gapExtBuildWith(SliverGap(extent));

  List<Widget> _gapExtBuildWith(Widget gap) =>
      isEmpty ? this : expand((widget) => [widget, gap]).toList()
        ..removeLast();
}
