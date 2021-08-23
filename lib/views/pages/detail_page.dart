part of 'pages.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _destinationCover() {
      return Container(
        width: double.infinity,
        height: 460,
        child: Stack(
          children: [
            // Destination Cover
            Container(
              width: double.infinity,
              height: 460,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image_destination_1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 460,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0.75),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),

            // Destination Location & Rating
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                height: 460,
                padding: EdgeInsets.only(
                  top: 30,
                  left: defaultMargin,
                  right: defaultMargin,
                  bottom: 80,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/icon_emblem.png',
                      width: 108,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lake Ciliwung',
                                style: regularTitleTextStyle.copyWith(
                                  color: kWhiteColor,
                                ),
                              ),
                              Text(
                                'Tangerang',
                                style: regularSubtitleTextStyle.copyWith(
                                  color: kWhiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/icon_star.png',
                              width: 24,
                            ),
                            SizedBox(width: 4),
                            Text(
                              '4.8',
                              style: whiteTextStyle.copyWith(
                                fontWeight: medium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget _destinationContent() {
      Widget _destinationInformation() {
        return Container(
          margin: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 30,
            horizontal: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // About
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
                      style: primaryTextStyle,
                    ),
                  ],
                ),
              ),

              // Photos
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Photos',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          DetailPhotoItem('assets/image_photo_1.png'),
                          DetailPhotoItem('assets/image_photo_2.png'),
                          DetailPhotoItem('assets/image_photo_3.png'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Interest
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Interest',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterestItem('Kids Park'),
                            SizedBox(height: 10),
                            InterestItem('Honor Bridge'),
                          ],
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterestItem('City Museum'),
                            SizedBox(height: 10),
                            InterestItem('Central Mall'),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }

      Widget _destinationPrice() {
        return Container(
          margin: EdgeInsets.symmetric(
            vertical: 30,
            horizontal: defaultMargin,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'IDR 2.500.000',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    'per orang',
                    style: smallSubtitleTextStyle,
                  ),
                ],
              ),
              PrimaryButton(
                width: 170,
                text: 'Book Now',
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.mainPage, (route) => false);
                },
              )
            ],
          ),
        );
      }

      return Column(
        children: [
          Container(
            height: 410,
          ),
          _destinationInformation(),
          _destinationPrice(),
        ],
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            _destinationCover(),
            _destinationContent(),
          ],
        ),
      ),
    );
  }
}
