part of 'widgets.dart';

class InterestItem extends StatelessWidget {
  final String interest;
  InterestItem(this.interest);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/icon_check_circle.png',
          width: 16,
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          interest,
          style: primaryTextStyle,
        ),
      ],
    );
  }
}
