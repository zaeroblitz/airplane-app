part of 'widgets.dart';

class NewDestinationItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 90,
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      child: Row(
        children: [
          // Destination Cover
          Container(
            width: 70,
            height: 70,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image_destination_6.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
          ),

          // Destination Location
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Danau Beratan',
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(height: 5),
                Text(
                  'Bali',
                  style: regularSubtitleTextStyle,
                )
              ],
            ),
          ),

          // Destination Rating
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icon_star.png')),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                '4.5',
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
