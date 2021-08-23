part of 'widgets.dart';

class PrimaryButton extends StatelessWidget {
  final double width;
  final String text;
  final Function() onPressed;

  PrimaryButton({
    this.width = double.infinity,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 55,
      child: TextButton(
        onPressed: onPressed,
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
