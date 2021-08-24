part of 'pages.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _header() {
      return Container(
        margin: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Howdy,\nKezia Anne',
                    style: regularTitleTextStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/image_user_picture.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              'Where to fly today?',
              style: regularSubtitleTextStyle,
            ),
          ],
        ),
      );
    }

    Widget _popularDestination() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: defaultMargin),
            child: Text(
              'Popular Destination',
              style: regularTitleTextStyle.copyWith(fontSize: 18),
            ),
          ),
          SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: EdgeInsets.only(left: defaultMargin),
              child: Row(
                children: [
                  PopularDestinationItem(
                    rating: 4.8,
                    imageUrl: 'assets/image_destination_1.png',
                    name: 'Lake Ciliwung',
                    city: 'Tangerang',
                  ),
                  PopularDestinationItem(
                    rating: 4.7,
                    imageUrl: 'assets/image_destination_2.png',
                    name: 'White House',
                    city: 'Spain',
                  ),
                  PopularDestinationItem(
                    rating: 4.8,
                    imageUrl: 'assets/image_destination_3.png',
                    name: 'Hill Heyo',
                    city: 'Monaco',
                  ),
                  PopularDestinationItem(
                    rating: 5,
                    imageUrl: 'assets/image_destination_4.png',
                    name: 'Menarra',
                    city: 'Japan',
                  ),
                  PopularDestinationItem(
                    rating: 4.8,
                    imageUrl: 'assets/image_destination_5.png',
                    name: 'Payung Teduh',
                    city: 'Singapore',
                  ),
                ],
              ),
            ),
          )
        ],
      );
    }

    Widget _newDestination() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
          bottom: 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New in This Year',
              style: regularTitleTextStyle.copyWith(fontSize: 18),
            ),
            SizedBox(height: 16),
            Column(
              children: [
                NewDestinationItem(
                  rating: 4.5,
                  imageUrl: 'assets/image_destination_6.png',
                  name: 'Danau Beratan',
                  location: 'Singaraja',
                ),
                NewDestinationItem(
                  rating: 4.7,
                  imageUrl: 'assets/image_destination_7.png',
                  name: 'Sydney Opera',
                  location: 'Australia',
                ),
                NewDestinationItem(
                  rating: 4.8,
                  imageUrl: 'assets/image_destination_8.png',
                  name: 'Roma',
                  location: 'Italy',
                ),
                NewDestinationItem(
                  rating: 4.5,
                  imageUrl: 'assets/image_destination_9.png',
                  name: 'Payung Teduh',
                  location: 'Singapore',
                ),
                NewDestinationItem(
                  rating: 4.7,
                  imageUrl: 'assets/image_destination_10.png',
                  name: 'Hill Heyo',
                  location: 'Monaco',
                ),
              ],
            ),
          ],
        ),
      );
    }

    return ListView(
      children: [
        _header(),
        _popularDestination(),
        _newDestination(),
      ],
    );
  }
}
