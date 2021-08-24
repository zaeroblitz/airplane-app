part of 'widgets.dart';

class SeatIndicatorItem extends StatelessWidget {
  final String indicator;

  const SeatIndicatorItem({
    Key? key,
    this.indicator = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      child: Center(
        child: Text(
          indicator,
          style: regularSubtitleTextStyle,
        ),
      ),
    );
  }
}
