# Easy Gap

[![Pub](https://img.shields.io/pub/v/easy_gap.svg)](https://pub.dartlang.org/packages/easy_gap)

[En](README.md) | **Ru**

Добавляйте отступы между виджетами во Flutter легко и гибко - через extension
методы или конструкторы.

## Установка

```yaml
dependencies:
  easy_gap: ^1.1.0
```

```dart
import 'package:easy_gap/easy_gap.dart';
```

## Использование

### Конструктор SpacedList

Альтернативный синтаксис через конструкторы:

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

### Extension методы

Добавьте `.gap()` или `.sliverGap()` к любому списку виджетов:

```dart
ListView(
  children: [
    Text('Элемент 1'),
    Text('Элемент 2'),
    Text('Элемент 3'),
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

### Extension методы

```dart
List<Widget> gap(
  double spacing,              // Обязательный: Размер отступа в пикселях
  {
    double? crossAxisExtent,   // Опциональный: Размер отступа по поперечной оси (например, на всю ширину в Column)
    Color? color,              // Опциональный: Цвет заливки для отладки отступов
  }
)
```

```dart
List<Widget> sliverGap(
  double spacing,              // Обязательный: Размер отступа в пикселях
  {
    Color? color,              // Опциональный: Цвет заливки для отладки отступов
  }
)
```

### Конструкторы SpacedList

```dart
SpacedList({
  required double spacing,        // Обязательный: Размер отступа в пикселях
  required List<Widget> children, // Обязательный: Список виджетов
  double? crossAxisExtent,        // Опциональный: Размер отступа по поперечной оси
  Color? color,                   // Опциональный: Цвет заливки для отладки отступов
})
```

```dart
SpacedList.slivers({
  required double spacing,        // Обязательный: Размер отступа в пикселях
  required List<Widget> slivers,  // Обязательный: Список slivers
  Color? color,                   // Опциональный: Цвет заливки для отладки отступов
})
```

## Пример

Посмотрите
[example приложение](https://github.com/pavluke/easy_gap/tree/main/example) с
полной демонстрацией всех возможностей.

## Changelog

Смотрите [Changelog](https://github.com/pavluke/easy_gap/blob/main/CHANGELOG.md)
для информации о последних обновлениях.

## Участие в разработке

Приветствуются любые вклады!

- Нашли баг? [Создайте issue](https://github.com/pavluke/easy_gap/issues)
- Есть идея для новой функции?
  [Создайте issue](https://github.com/pavluke/easy_gap/issues)
- Хотите внести вклад?
  [Отправьте pull request](https://github.com/pavluke/easy_gap/pulls)

## Лицензия

MIT License - подробности в
[LICENSE](https://github.com/pavluke/easy_gap/blob/main/LICENSE).
