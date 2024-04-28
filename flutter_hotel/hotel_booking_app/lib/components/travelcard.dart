import 'package:flutter/material.dart';
import 'package:women_safety_app/pages/hotel_details_page.dart';

class FavoriteItem {
  final String imgUrl;
  final String hotelName;
  final String location;
  final int rating;

  FavoriteItem({
    required this.imgUrl,
    required this.hotelName,
    required this.location,
    required this.rating,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteItem &&
          runtimeType == other.runtimeType &&
          imgUrl == other.imgUrl &&
          hotelName == other.hotelName &&
          location == other.location &&
          rating == other.rating;

  @override
  int get hashCode =>
      imgUrl.hashCode ^
      hotelName.hashCode ^
      location.hashCode ^
      rating.hashCode;
}

Widget travelCard(
  BuildContext context,
  String imgUrl,
  String hotelName,
  String location,
  int rating, {
  bool isFavorite = false,
  required Function(String, String, String, int) onFavoriteToggle,
}) {
  return Card(
    margin: EdgeInsets.only(right: 22.0),
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    elevation: 0.0,
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HotelDetailsScreen(
              imgUrl: imgUrl,
              hotelName: hotelName,
              location: location,
              rating: rating,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imgUrl),
            fit: BoxFit.cover,
            scale: 2.0,
          ),
        ),
        width: 200.0,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      //this loop will allow us to add as many star as the rating
                      for (var i = 0; i < rating; i++)
                        Icon(
                          Icons.star,
                          color: Color(0xFFFE8C68),
                        ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hotelName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 3.0,
                        ),
                        Text(
                          location,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.white,
                ),
                onPressed: () {
                  onFavoriteToggle(imgUrl, hotelName, location, rating);
                },
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: ElevatedButton(
                onPressed: () {
                  // Add your booking logic here
                },
                child: Text('Details'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
