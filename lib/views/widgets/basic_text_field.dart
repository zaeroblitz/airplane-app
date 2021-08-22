part of 'widgets.dart';

class BasicTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isPassword;

  BasicTextField(
      {this.label = '', this.hintText = '', this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: primaryTextStyle.copyWith(
              fontSize: 14,
            ),
          ),
          SizedBox(height: 6),
          TextFormField(
            obscureText: isPassword ? true : false,
            cursorColor: kBlackColor,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: regularSubtitleTextStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
                borderSide: BorderSide(
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
