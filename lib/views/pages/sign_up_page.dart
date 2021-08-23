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
      Widget _fullNameInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Full Name',
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 6),
              TextFormField(
                cursorColor: kBlackColor,
                decoration: InputDecoration(
                  hintText: 'Your Full Name',
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

      Widget _emailInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email Address',
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 6),
              TextFormField(
                cursorColor: kBlackColor,
                decoration: InputDecoration(
                  hintText: 'Your Email Address',
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

      Widget _passwordInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Password',
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 6),
              TextFormField(
                obscureText: true,
                cursorColor: kBlackColor,
                decoration: InputDecoration(
                  hintText: 'Your Password',
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

      Widget _hobbyInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hobby',
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 6),
              TextFormField(
                cursorColor: kBlackColor,
                decoration: InputDecoration(
                  hintText: 'Your Hobby',
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

      Widget _getStartedButton() {
        return Center(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            child: PrimaryButton(
                double.infinity, 'Get Started', AppRoutes.bounsPage),
          ),
        );
      }

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
            _fullNameInput(),
            _emailInput(),
            _passwordInput(),
            _hobbyInput(),
            _getStartedButton()
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
