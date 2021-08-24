part of 'widgets.dart';

class SeatStatusItem extends StatelessWidget {
  final String seatStatus;
  final Color fillColor;
  final Color borderColor;

  const SeatStatusItem({
    Key? key,
    this.seatStatus = 'Unavailable',
    this.fillColor = kUnavailableColor,
    this.borderColor = kUnavailableColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
              color: fillColor,
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          Text(
            seatStatus,
            style: primaryTextStyle,
          )
        ],
      ),
    );
  }
}
