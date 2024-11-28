# Easy Gap
Flutter extension for easily adding gaps between children widgets inside Flex widgets such as Columns and Rows or scrolling views.

[![Pub](https://img.shields.io/pub/v/easy_gap.svg)](https://pub.dartlang.org/packages/easy_gap)

### Introduction

When it comes to add empty space between children widgets inside a `Column` or a `Row`, we have multiple options:
- We can either add a `Padding` around these widgets but it's very verbose
- Or we can add `SizedBox` widgets between them.

## Getting started

In your library add the following import:

```dart
import 'package:easy_gap/easy_gap.dart';
```

Then you just have to call method `gap()` for widget list with the specified extent.

```dart
return Column(
  children: <Widget>[
    Container(color: Colors.red, width: 20),
    Container(color: Colors.green, width: 20),
    Container(color: Colors.blue, width: 20),
  ].gap(20) // Adds an empty spaces of 20 pixels between widgets.
);
```

The `gap()` method also works inside `Scrollable` widgets such as `ListViews`. In these cases, it will occupy the space in the same direction as the `Scrollable`.

### SliverGap

There is also a sliver version of the `gap()`:

```dart
return CustomScrollView(
  slivers: <Widget>[
  // Some slivers
  ].sliverGap(20) // Adds an empty spaces of 20 pixels between slivers.
);
```

## Changelog

Please see the [Changelog](https://github.com/pavluke/easy_gap/blob/main/CHANGELOG.md) page to know what's recently changed.

## Contributions

Feel free to contribute to this project.

If you find a bug or want a feature, but don't know how to fix/implement it, please fill an [issue](https://github.com/pavluke/easy_gap/issues).  
If you fixed a bug or implemented a feature, please send a [pull request](https://github.com/pavluke/easy_gap/pulls).