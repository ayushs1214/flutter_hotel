import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final List<Hotel> hotels = [
    Hotel(
      imageUrl: 'lib/images/hotel1.jpg',
      name: 'Grand Luxury Hotel',
      description:
          'Experience the ultimate in luxury and comfort at our 5-star hotel, nestled in the heart of the city. Indulge in our world-class amenities, including a full-service spa, fine dining restaurants, and a rooftop pool with breathtaking views.',
      price: 350,
    ),
    Hotel(
      imageUrl: 'lib/images/hotel2.jpg',
      name: 'Beachfront Resort',
      description:
          'Escape to paradise at our beachfront resort, where white sandy beaches and crystal-clear waters await you. Unwind in our luxurious villas, enjoy water sports, or simply bask in the warm sunshine.',
      price: 250,
    ),
    Hotel(
      imageUrl: 'lib/images/hotel3.jpg',
      name: 'Mountain Retreat',
      description:
          'Escape the hustle and bustle of city life and immerse yourself in the serene beauty of our mountain retreat. Nestled in the heart of the majestic mountains, our eco-friendly lodges offer breathtaking views and a chance to reconnect with nature.',
      price: 180,
    ),
    // Add more hotels as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel Booking App'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of cards per row
          crossAxisSpacing: 16.0, // Horizontal spacing between cards
          mainAxisSpacing: 16.0, // Vertical spacing between cards
        ),
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          return HotelCard(
            imageUrl: hotels[index].imageUrl,
            name: hotels[index].name,
            description: hotels[index].description,
            price: hotels[index].price,
          );
        },
      ),
    );
  }
}

class Hotel {
  final String imageUrl;
  final String name;
  final String description;
  final double price;

  Hotel({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
  });
}

class HotelCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final double price;

  HotelCard({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRect(
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                imageUrl,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '₹${price.toStringAsFixed(2)}/night',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle book now button press
                      },
                      child: Text('Book Now'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
