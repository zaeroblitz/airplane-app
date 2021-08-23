part of 'widgets.dart';

class PopularDestinationItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 324,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.circular(defaultRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Destination Cover & Rating
          Container(
            width: 180,
            height: 220,
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            child: Stack(
              children: [
                Container(
                  width: 180,
                  height: 220,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image_destination_1.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(defaultRadius),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 60,
                    height: 30,
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(defaultRadius),
                        bottomLeft: Radius.circular(defaultRadius),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/icon_star.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          '4.8',
                          style: primaryTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),

          // Destination Location
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lake Ciliwung',
                style: primaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Tangerang',
                style: smallSubtitleTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
