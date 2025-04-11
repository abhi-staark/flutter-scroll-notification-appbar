import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'custom_appbar.dart';
import 'custom_card_view.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // The root widget of the app. Using MaterialApp for UI setup.
    return const MaterialApp(
      home: ScrollAppBarDemo(), // Launch the ScrollAppBarDemo screen
      debugShowCheckedModeBanner: false, // Disable the debug banner in the app
    );
  }
}

class ScrollAppBarDemo extends StatefulWidget {
  const ScrollAppBarDemo({super.key});

  @override
  State<ScrollAppBarDemo> createState() => _ScrollAppBarDemoState();
}

class _ScrollAppBarDemoState extends State<ScrollAppBarDemo>
    with TickerProviderStateMixin {
  
  // Boolean to control whether the AppBar is visible or not
  bool isAppBarVisible = true;

  // This function handles scroll notifications to detect the scroll direction
  void handleScrollNotification(ScrollNotification notification) {
    if (notification is UserScrollNotification) {
      setState(() {
        // Check the scroll direction and update the visibility of the AppBar
        if (notification.direction == ScrollDirection.reverse) {
          isAppBarVisible = false; // Hide AppBar when scrolling down
        } else if (notification.direction == ScrollDirection.forward) {
          isAppBarVisible = true;  // Show AppBar when scrolling up
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        // Listens for scroll notifications from any widget
        onNotification: (notification) {
          handleScrollNotification(notification); // Call the method to handle scroll behavior
          return true; // Return true to indicate the notification has been handled
        },
        child: Column(
          children: [
            // AnimatedSize widget to animate the size of the AppBar when visibility changes
            AnimatedSize(
              duration: const Duration(milliseconds: 300), // Duration of the animation
              curve: Curves.easeInOut, // Curve for the animation
              child: isAppBarVisible
                  ? const CustomAnimatedAppBar() // Custom AppBar widget when visible
                  : const SizedBox.shrink(), // Empty space when AppBar is not visible
            ),
            // Expanded widget for the rest of the content (a list of cards here)
            const Expanded(child: CustomCardListView()),
          ],
        ),
      ),
    );
  }
}
