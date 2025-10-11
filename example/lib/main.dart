import 'package:easy_gap/easy_gap.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Gap Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const DemoHomePage(),
    );
  }
}

class DemoHomePage extends StatefulWidget {
  const DemoHomePage({super.key});

  @override
  State<DemoHomePage> createState() => _DemoHomePageState();
}

class _DemoHomePageState extends State<DemoHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    FactoryDemo(),
    GappedDemo(),
    SliverDemo(),
    ExtensionDemo(),
  ];

  final List<String> _titles = const [
    'Factory Constructors',
    'Gapped Class',
    'Sliver Examples',
    'Extension Methods',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.factory),
            label: 'Factory',
          ),
          NavigationDestination(
            icon: Icon(Icons.list),
            label: 'Gapped',
          ),
          NavigationDestination(
            icon: Icon(Icons.view_list),
            label: 'Slivers',
          ),
          NavigationDestination(
            icon: Icon(Icons.extension),
            label: 'Extensions',
          ),
        ],
      ),
    );
  }
}

// Page 1: Factory Constructor Demo
class FactoryDemo extends StatelessWidget {
  const FactoryDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('SpacedList Factory Constructors'),
          const SizedBox(height: 8),
          const Text('Use SpacedList.gap() and SpacedList.sliverGap() factory constructors.'),
          const SizedBox(height: 24),
          _buildSubtitle('SpacedList.gap()'),
          const SizedBox(height: 8),
          _buildContainer(
            Column(
              children: SpacedList(
                spacing: 16,
                children: [
                  _buildCard('Using Factory', Colors.indigo.shade300),
                  _buildCard('Constructor', Colors.cyan.shade300),
                  _buildCard('Pattern', Colors.lime.shade300),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          _buildSubtitle('With parameters'),
          const SizedBox(height: 8),
          _buildContainer(
            Column(
              children: SpacedList(
                spacing: 12,
                crossAxisExtent: double.infinity,
                color: Colors.lightBlue.shade50,
                children: List.generate(
                  4,
                  (i) => Container(
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.primaries[i * 2 % Colors.primaries.length],
                          Colors.primaries[(i * 2 + 1) % Colors.primaries.length],
                        ],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Gradient ${i + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Page 2: Gapped Class Demo
class GappedDemo extends StatelessWidget {
  const GappedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Gapped Class'),
          const SizedBox(height: 8),
          const Text('Create spaced lists using the Gapped class for cleaner syntax.'),
          const SizedBox(height: 24),
          _buildSubtitle('Basic Gapped usage'),
          const SizedBox(height: 8),
          _buildContainer(
            Column(
              children: Gapped(
                spacing: 12,
                children: [
                  _buildCard('Card 1', Colors.red.shade300),
                  _buildCard('Card 2', Colors.green.shade300),
                  _buildCard('Card 3', Colors.blue.shade300),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          _buildSubtitle('With crossAxisExtent'),
          const SizedBox(height: 8),
          _buildContainer(
            Column(
              children: Gapped(
                spacing: 8,
                crossAxisExtent: double.infinity,
                color: Colors.amber.shade100,
                children: List.generate(
                  5,
                  (i) => Container(
                    height: 40,
                    color: Colors.primaries[i % Colors.primaries.length].shade300,
                    child: Center(child: Text('Item ${i + 1}')),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          _buildSubtitle('Horizontal layout'),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: _buildContainer(
              Row(
                children: Gapped(
                  spacing: 16,
                  children: List.generate(
                    8,
                    (i) => Container(
                      width: 80,
                      height: 100,
                      color: Colors.primaries[i % Colors.primaries.length].shade300,
                      child: Center(
                        child: Text(
                          '${i + 1}',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Page 3: Sliver Examples
class SliverDemo extends StatelessWidget {
  const SliverDemo({super.key});

  @override
  Widget build(BuildContext context) {
    const colors = [Colors.red, Colors.green, Colors.blue];
    const itemCount = 12;

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Sliver Examples'),
                const SizedBox(height: 8),
                const Text('Using .sliverGap() and SliverGapped for CustomScrollView.'),
                const SizedBox(height: 8),
                const Text('• Rows use .gap(50)\n• Slivers use .sliverGap(20)'),
              ],
            ),
          ),
        ),
        ...List.generate(
          itemCount,
          (i) => SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: colors
                    .map(
                      (c) => Container(
                        height: 50,
                        width: 20,
                        color: c.withValues(
                          alpha: 1 - (1 / (itemCount + 1)) * (i + 1),
                        ),
                      ),
                    )
                    .toList()
                    .gap(50),
              ),
            ),
          ),
        ).sliverGap(20, color: Colors.grey.shade200),
      ],
    );
  }
}

// Page 4: Extension Methods Demo
class ExtensionDemo extends StatelessWidget {
  const ExtensionDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Extension Methods on List<Widget>'),
          const SizedBox(height: 8),
          const Text('The .gap() and .sliverGap() extension methods provide the easiest way to add spacing.'),
          const SizedBox(height: 24),
          _buildSubtitle('Column with .gap(16)'),
          const SizedBox(height: 8),
          _buildContainer(
            Column(
              children: [
                _buildItem('Item 1', Colors.red.shade300),
                _buildItem('Item 2', Colors.green.shade300),
                _buildItem('Item 3', Colors.blue.shade300),
                _buildItem('Item 4', Colors.orange.shade300),
              ].gap(16),
            ),
          ),
          const SizedBox(height: 24),
          _buildSubtitle('Row with .gap(12)'),
          const SizedBox(height: 8),
          _buildContainer(
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildBox(Colors.red.shade300),
                _buildBox(Colors.green.shade300),
                _buildBox(Colors.blue.shade300),
                _buildBox(Colors.orange.shade300),
              ].gap(12),
            ),
          ),
          const SizedBox(height: 24),
          _buildSubtitle('With color parameter for debugging'),
          const SizedBox(height: 8),
          _buildContainer(
            Column(
              children: [
                _buildItem('Item 1', Colors.purple.shade300),
                _buildItem('Item 2', Colors.teal.shade300),
                _buildItem('Item 3', Colors.amber.shade300),
              ].gap(24, color: Colors.pink.shade100),
            ),
          ),
        ],
      ),
    );
  }
}

// Helper widgets
Widget _buildSectionTitle(String text) {
  return Text(
    text,
    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  );
}

Widget _buildSubtitle(String text) {
  return Text(
    text,
    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
  );
}

Widget _buildContainer(Widget child) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(8),
      color: Colors.grey.shade50,
    ),
    child: child,
  );
}

Widget _buildItem(String text, Color color) {
  return Container(
    height: 60,
    color: color,
    child: Center(
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
    ),
  );
}

Widget _buildBox(Color color) {
  return Container(
    width: 60,
    height: 60,
    color: color,
  );
}

Widget _buildCard(String title, Color color) {
  return Container(
    height: 80,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Center(
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
