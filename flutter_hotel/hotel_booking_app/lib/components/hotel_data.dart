class HotelData {
  final String imgUrl;
  final String hotelName;
  final String location;
  final int rating;
  final double pricePerNight;
  final String description;
  final String checkInTime;
  final String checkOutTime;

  HotelData({
    required this.imgUrl,
    required this.hotelName,
    required this.location,
    required this.rating,
    required this.pricePerNight,
    required this.description,
    required this.checkInTime,
    required this.checkOutTime,
  });
}

final List<HotelData> hotelDataList = [
  HotelData(
    imgUrl:
        'https://q-xx.bstatic.com/xdata/images/hotel/max500/216968639.jpg?k=a65c7ca7141416ffec244cbc1175bf3bae188d1b4919d5fb294fab5ec8ee2fd2&o=',
    hotelName: 'Grand Luxury Hotel',
    location: 'London',
    rating: 3,
    pricePerNight: 150.0,
    description:
        "Hotel Grand Luxury in London epitomizes sophistication and elegance, providing a truly luxurious experience in one of the world's most vibrant cities. Unwind in style in our lavish rooms and suites, just steps from the city's iconic landmarks.",
    checkInTime: '3:00 PM',
    checkOutTime: '12:00 PM',
  ),
  HotelData(
    imgUrl:
        'https://lp-cms-production.imgix.net/features/2018/06/byrsa-hill-carthage-tunis-tunisia-2d96efe7b9bf.jpg',
    hotelName: 'Mountain Retreat',
    location: 'Zurich',
    rating: 5,
    pricePerNight: 200.0,
    description:
        "Escape to the serene surroundings of Mountain Retreat in Zurich, where breathtaking Alpine views meet luxurious comfort. Relax in our cozy chalet-style rooms and enjoy easy access to the city's vibrant center.",
    checkInTime: '2:00 PM',
    checkOutTime: '11:00 AM',
  ),
  HotelData(
    imgUrl:
        'https://cdn.contexttravel.com/image/upload/c_fill,q_60,w_2600/v1549318570/production/city/hero_image_2_1549318566.jpg',
    hotelName: 'Hotel City Palace',
    location: 'Rome',
    rating: 5,
    pricePerNight: 200.0,
    description:
        "Step into the grandeur of Hotel City Palace in Rome, where ancient history meets modern luxury. Unwind in our elegant rooms and suites, surrounded by the Eternal City's iconic landmarks and vibrant atmosphere.",
    checkInTime: '2:00 PM',
    checkOutTime: '11:00 AM',
  ),
  HotelData(
    imgUrl:
        'https://images.squarespace-cdn.com/content/v1/57d5245815d5db80eadeef3b/1558864684068-1CX3SZ0SFYZA1DFJSCYD/ke17ZwdGBToddI8pDm48kIpXjvpiLxnd0TWe793Q1fcUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYxCRW4BPu10St3TBAUQYVKcZwk0euuUA52dtKj-h3u7rSTnusqQy-ueHttlzqk_avnQ5Fuy2HU38XIezBtUAeHK/Marataba+Safari+lodge',
    hotelName: 'Hotel Sidi bou Said',
    location: 'Santorini',
    rating: 5,
    pricePerNight: 200.0,
    description:
        "Perched on the picturesque cliffs of Santorini, Hotel Sidi bou Said offers a tranquil retreat with breathtaking caldera views. Relax in our stylish rooms and suites, and experience the charm of this iconic Greek island getaway.",
    checkInTime: '2:00 PM',
    checkOutTime: '11:00 AM',
  ),
];
