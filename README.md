# Easy Gap

[![Pub](https://img.shields.io/pub/v/easy_gap.svg)](https://pub.dartlang.org/packages/easy_gap)

**En** | [Ru](README_RU.md)

Add gaps between widgets in Flutter easily and flexibly - via extension methods
or constructors.

## Installation

```yaml
dependencies:
  easy_gap: ^1.1.0
```

```dart
import 'package:easy_gap/easy_gap.dart';
```

## Usage

### SpacedList Constructor

Alternative syntax using constructors:

```dart
ListView(
  children: SpacedList(
    spacing: 16,
    children: [...],
  ),
)

CustomScrollView(
  slivers: SpacedList.slivers(
    spacing: 20,
    slivers: [...],
  ),
)
```

### Extension Methods

Add `.gap()` or `.sliverGap()` to any widget list:

```dart
ListView(
  children: [
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
  ].gap(16),
)

CustomScrollView(
  slivers: [
    SliverList(...),
    SliverGrid(...),
  ].sliverGap(20),
)
```

## API

### Extension Methods

```dart
List<Widget> gap(
  double spacing,              // Required: Gap size in pixels
  {
    double? crossAxisExtent,   // Optional: Gap size along cross axis (e.g., full width in Column)
    Color? color,              // Optional: Fill color for debugging gaps
  }
)
```

```dart
List<Widget> sliverGap(
  double spacing,              // Required: Gap size in pixels
  {
    Color? color,              // Optional: Fill color for debugging gaps
  }
)
```

### SpacedList Constructors

```dart
SpacedList({
  required double spacing,        // Required: Gap size in pixels
  required List<Widget> children, // Required: List of widgets
  double? crossAxisExtent,        // Optional: Gap size along cross axis
  Color? color,                   // Optional: Fill color for debugging gaps
})
```

```dart
SpacedList.slivers({
  required double spacing,        // Required: Gap size in pixels
  required List<Widget> slivers,  // Required: List of slivers
  Color? color,                   // Optional: Fill color for debugging gaps
})
```

## Example

Check out the
[example app](https://github.com/pavluke/easy_gap/tree/main/example) for a
complete demo showcasing all features.

## Changelog

See the [Changelog](https://github.com/pavluke/easy_gap/blob/main/CHANGELOG.md)
for recent updates.

## Contributing

Contributions are welcome!

- Found a bug? [Open an issue](https://github.com/pavluke/easy_gap/issues)
- Have a feature request?
  [Open an issue](https://github.com/pavluke/easy_gap/issues)
- Want to contribute?
  [Submit a pull request](https://github.com/pavluke/easy_gap/pulls)

## License

MIT License - see
[LICENSE](https://github.com/pavluke/easy_gap/blob/main/LICENSE) for details.
