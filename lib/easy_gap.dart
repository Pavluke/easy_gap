import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

extension GapExt<T extends Widget> on List<T> {
  List<Widget> gap(double dimension, {bool removeLast = true}) =>
      _gapExtBuildWith(Gap(dimension));

  List<Widget> sliverGap(double dimension, {bool removeLast = true}) =>
      _gapExtBuildWith(SliverGap(dimension));

  List<Widget> _gapExtBuildWith(Widget widget) => isEmpty
      ? []
      : expand((w) => [w, if (!(indexOf(w) == indexOf(last))) widget]).toList();
}
