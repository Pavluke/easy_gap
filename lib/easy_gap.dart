import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

extension GapExt<T extends Widget> on List<T> {
  List<Widget> gap(double dimension, {bool removeLast = true}) =>
      _gapExtBuildWith(Gap(dimension), removeLast: removeLast);

  List<Widget> sliverGap(double dimension, {bool removeLast = true}) =>
      _gapExtBuildWith(SliverGap(dimension), removeLast: removeLast);

  List<Widget> _gapExtBuildWith(Widget widget, {required bool removeLast}) =>
      isEmpty
          ? []
          : expand((w) => [
                w,
                if (!(removeLast && indexOf(w) == indexOf(last))) widget
              ]).toList();
}
