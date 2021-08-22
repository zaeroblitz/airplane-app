part of 'pages.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _title() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Text(
          'Join us and get \nyour next journey',
          style: regularTitleTextStyle,
        ),
      );
    }

    Widget _inputSection() {
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BasicTextField(
              label: 'Full Name',
              hintText: 'Your Full Name',
            ),
            BasicTextField(
              label: 'Email Adress',
              hintText: 'Your Email Address',
            ),
            BasicTextField(
              label: 'Password',
              hintText: 'Your Password',
              isPassword: true,
            ),
            BasicTextField(
              label: 'Hobby',
              hintText: 'Your Hobby',
            ),
            Center(
                child: Container(
              margin: EdgeInsets.only(top: 10),
              child: PrimaryButton(MediaQuery.of(context).size.width - 88,
                  'Get Started', AppRoutes.getStartedPage),
            )),
          ],
        ),
      );
    }

    Widget _signIn() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          bottom: 60,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an accounnt? ',
              textAlign: TextAlign.center,
              style: regularSubtitleTextStyle,
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.signInPage,
                (route) => false,
              ),
              child: Text(
                'Sign In',
                textAlign: TextAlign.center,
                style: purpleTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: ListView(
          children: [
            _title(),
            _inputSection(),
            _signIn(),
          ],
        ),
      ),
    );
  }
}
