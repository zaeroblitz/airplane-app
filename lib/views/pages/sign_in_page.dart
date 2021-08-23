part of 'pages.dart';

class SignInPage extends StatelessWidget {
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

      Widget _signInButton() {
        return Container(
          margin: EdgeInsets.only(top: 10),
          child: PrimaryButton(
            MediaQuery.of(context).size.width - 88,
            'Sign In',
            AppRoutes.bounsPage,
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
            _emailInput(),
            _passwordInput(),
            _signInButton(),
          ],
        ),
      );
    }

    Widget _signUp() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          bottom: 60,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account? ",
              textAlign: TextAlign.center,
              style: regularSubtitleTextStyle,
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, AppRoutes.signUpPage),
              child: Text(
                'Sign Up Now',
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
            _signUp(),
          ],
        ),
      ),
    );
  }
}
