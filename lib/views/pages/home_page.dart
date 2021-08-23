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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Howdy,\nKezia Anne',
                  style: regularTitleTextStyle,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image_user_picture.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(25),
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
              style: regularTitleTextStyle,
            ),
          ),
          SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: EdgeInsets.only(left: defaultMargin),
              child: Row(
                children: [
                  PopularDestinationItem(),
                  PopularDestinationItem(),
                  PopularDestinationItem(),
                  PopularDestinationItem(),
                  PopularDestinationItem(),
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
              style: regularTitleTextStyle,
            ),
            SizedBox(height: 16),
            Column(
              children: [
                NewDestinationItem(),
                NewDestinationItem(),
                NewDestinationItem(),
                NewDestinationItem(),
                NewDestinationItem(),
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
