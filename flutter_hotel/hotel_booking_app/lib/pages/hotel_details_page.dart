import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HotelDetailsScreen extends StatefulWidget {
  final String imgUrl;
  final String hotelName;
  final String location;
  final int rating;

  HotelDetailsScreen({
    required this.imgUrl,
    required this.hotelName,
    required this.location,
    required this.rating,
  });

  @override
  _HotelDetailsScreenState createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  int _rooms = 1;
  int _guests = 1;
  DateTime? _checkInDate;
  DateTime? _checkOutDate;
  double _totalPrice = 0.0;

  void _calculateTotalPrice() {
    // Replace this with your actual pricing logic
    if (_checkInDate != null && _checkOutDate != null) {
      int nights = _checkOutDate!.difference(_checkInDate!).inDays;
      _totalPrice = nights * 100.0 * _rooms;
    } else {
      _totalPrice = 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.hotelName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              widget.imgUrl,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.hotelName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 4),
                      Text(widget.location),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      for (int i = 0; i < widget.rating; i++)
                        Icon(Icons.star, color: Colors.amber),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Price per night: \$100',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eget malesuada mauris. Sed venenatis tellus ac mi congue, vel mollis augue rhoncus.',
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Check-in: 3:00 PM',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Check-out: 12:00 PM',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rooms',
                        style: TextStyle(fontSize: 16),
                      ),
                      DropdownButton<int>(
                        value: _rooms,
                        onChanged: (int? newValue) {
                          if (newValue != null) {
                            setState(() {
                              _rooms = newValue;
                              _calculateTotalPrice();
                            });
                          }
                        },
                        items: List.generate(5, (index) => index + 1)
                            .map<DropdownMenuItem<int>>(
                              (int value) => DropdownMenuItem<int>(
                                value: value,
                                child: Text(value.toString()),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Guests',
                        style: TextStyle(fontSize: 16),
                      ),
                      DropdownButton<int>(
                        value: _guests,
                        onChanged: (int? newValue) {
                          if (newValue != null) {
                            setState(() {
                              _guests = newValue;
                              _calculateTotalPrice();
                            });
                          }
                        },
                        items: List.generate(5, (index) => index + 1)
                            .map<DropdownMenuItem<int>>(
                              (int value) => DropdownMenuItem<int>(
                                value: value,
                                child: Text(value.toString()),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Check-in Date',
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () async {
                          final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2025),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              _checkInDate = pickedDate;
                              _calculateTotalPrice();
                            });
                          }
                        },
                        child: Text(
                          _checkInDate == null
                              ? 'Select Date'
                              : DateFormat('yyyy-MM-dd').format(_checkInDate!),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Check-out Date',
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () async {
                          final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: _checkInDate ?? DateTime.now(),
                            firstDate: _checkInDate ?? DateTime.now(),
                            lastDate: DateTime(2025),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              _checkOutDate = pickedDate;
                              _calculateTotalPrice();
                            });
                          }
                        },
                        child: Text(
                          _checkOutDate == null
                              ? 'Select Date'
                              : DateFormat('yyyy-MM-dd').format(_checkOutDate!),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Total Price: \$${_totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Handle booking logic here
                      print('Booking hotel: ${widget.hotelName}');
                      print('Rooms: $_rooms');
                      print('Guests: $_guests');
                      print('Check-in Date: $_checkInDate');
                      print('Check-out Date: $_checkOutDate');
                      print('Total Price: \$${_totalPrice.toStringAsFixed(2)}');
                    },
                    child: Text('Book Now'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
