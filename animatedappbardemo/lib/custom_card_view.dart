import 'package:flutter/material.dart';

class CustomCardListView extends StatelessWidget {
  const CustomCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // Add padding to the list view
      padding: const EdgeInsets.all(16),
      
      // Specify the number of items to display in the list
      itemCount: 10,

      // Item builder is used to create each individual list item
      itemBuilder: (context, index) {
        return Card(
          // Margin between each card in the list
          margin: const EdgeInsets.only(bottom: 16),
          
          // Elevation to give the card a shadow effect
          elevation: 4,
          
          // Rounded corners for the card
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          
          // Card content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align the contents to the start (left)
            children: [
              // ClipRRect is used to apply rounded corners to the image
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12), // Top corners of the image are rounded
                ),
                child: Image.network(
                  // Network image URL (can replace with your own)
                  'https://cdn.pixabay.com/photo/2019/12/31/16/06/yoga-4732209_1280.jpg',
                  height: 180, // Set the height of the image
                  width: double.infinity, // Make the image take up full width
                  fit: BoxFit.cover, // Ensure the image covers the container without distortion
                ),
              ),
              // Padding around the text content inside the card
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start (left)
                  children: [
                    // Card title, with larger font size and bold weight
                    Text(
                      'Card Title ${index + 1}', // Dynamic title with index
                      style: const TextStyle(
                        fontSize: 18, // Font size for the title
                        fontWeight: FontWeight.bold, // Bold text for emphasis
                      ),
                    ),
                    const SizedBox(height: 8), // Space between title and description
                    // Description text
                    const Text(
                      'This is a brief description of the item. You can customize it to include news, blog content, product info, etc.',
                      style: TextStyle(fontSize: 14), // Font size for description text
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
