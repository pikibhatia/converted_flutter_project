// Import necessary Flutter packages
import 'package:flutter/material.dart';

// Define a custom theme data class
class SampleTheme {
  static const Color primaryColor = Color(0xFF2196F3);
  static const Color secondaryColor = Color(0xFF9E9E9E);
  static const Color backgroundColor = Color(0xFFFFFFFF);

  static const TextStyle titleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: primaryColor,
  );

  static const TextStyle descriptionStyle = TextStyle(
    fontSize: 16,
    color: secondaryColor,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 16,
    color: Colors.white,
  );
}

// Define the SampleComponent as a StatefulWidget
class SampleComponent extends StatefulWidget {
  @override
  _SampleComponentState createState() => _SampleComponentState();
}

// Define the state class for SampleComponent
class _SampleComponentState extends State<SampleComponent> {
  String _title = 'Sample Flutter Component';
  String _description = 'This is a demonstration component for Angular to Flutter conversion';
  String _buttonText = 'Click Me';
  List<String> _items = ['Item 1', 'Item 2', 'Item 3'];

  // Handle button click event
  void _handleClick() {
    setState(() {
      _buttonText = 'Clicked!';
      _items.add('Item ${_items.length + 1}');
    });
  }

  @override
  void initState() {
    super.initState();
    print('Sample component initialized');
  }

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Define a custom theme data
    final themeData = ThemeData(
      primaryColor: SampleTheme.primaryColor,
      scaffoldBackgroundColor: SampleTheme.backgroundColor,
      textTheme: TextTheme(
        headline1: SampleTheme.titleStyle,
        bodyText1: SampleTheme.descriptionStyle,
      ),
    );

    // Use LayoutBuilder for constraint-based layouts
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: screenWidth,
            height: screenHeight,
            child: Column(
              children: [
                // Use Flexible widget for responsive design
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          _title,
                          style: SampleTheme.titleStyle,
                        ),
                        Text(
                          _description,
                          style: SampleTheme.descriptionStyle,
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _handleClick,
                          child: Text(
                            _buttonText,
                            style: SampleTheme.buttonTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Use Expanded widget for responsive design
                Expanded(
                  child: ListView.builder(
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_items[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Define a main function to run the app
void main() {
  runApp(
    MaterialApp(
      title: 'Sample Flutter App',
      theme: ThemeData(
        primaryColor: SampleTheme.primaryColor,
        scaffoldBackgroundColor: SampleTheme.backgroundColor,
      ),
      home: SampleComponent(),
    ),
  );
}
