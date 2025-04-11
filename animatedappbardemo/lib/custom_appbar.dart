import 'package:flutter/material.dart';

class CustomAnimatedAppBar extends StatelessWidget {
  const CustomAnimatedAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // The height of the AppBar container
      height: 120,
      
      // Padding for content inside the container
      padding: const EdgeInsets.symmetric(horizontal: 16),
      
      // Decoration for the AppBar
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1976D2), Color(0xFF42A5F5)], // Gradient color
          begin: Alignment.topLeft,  // Start point of the gradient
          end: Alignment.bottomRight, // End point of the gradient
        ),
        
        // Rounded corners for the bottom of the AppBar
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        
        // Shadow effect for the AppBar
        boxShadow: [
          BoxShadow(
            color: Colors.black26, // Shadow color
            offset: Offset(0, 4),  // Position of the shadow
            blurRadius: 8,         // Blur effect for the shadow
          ),
        ],
      ),
      
      // Main content of the AppBar (using Row to align items horizontally)
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute space evenly between the children
        children: [
          // Column for text content (Welcome message and title)
          Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centering the text vertically
            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
            children: const [
              // First text widget (Welcome message)
              Text(
                'Welcome Back,',
                style: TextStyle(color: Colors.white70, fontSize: 16), // Light text color and small font size
              ),
              SizedBox(height: 4), // Space between the texts
              // Second text widget (Title)
              Text(
                'Dr Agarwals Health',
                style: TextStyle(
                  color: Colors.white, // White text color for contrast
                  fontSize: 22, // Larger font size for the title
                  fontWeight: FontWeight.bold, // Bold text style
                ),
              ),
            ],
          ),
          
          // CircleAvatar for displaying an image (can be a user avatar or logo)
          const CircleAvatar(
            radius: 24, // Size of the avatar
            backgroundImage: NetworkImage(
              'https://i.pravatar.cc/150?img=47', // Placeholder image URL
            ),
          ),
        ],
      ),
    );
  }
}
