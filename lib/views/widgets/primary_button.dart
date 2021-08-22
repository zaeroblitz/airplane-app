part of 'widgets.dart';

class PrimaryButton extends StatelessWidget {
  final double width;
  final String text;
  final String route;

  PrimaryButton(this.width, this.text, this.route);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 55,
      child: TextButton(
        onPressed: () => Navigator.pushNamed(context, route),
        style: TextButton.styleFrom(
            backgroundColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
            )),
        child: Text(
          text,
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }
}
