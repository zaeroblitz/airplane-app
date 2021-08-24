part of 'pages.dart';

class SignUpPage extends StatelessWidget {
  // Validator
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static final _requiredValidator =
      RequiredValidator(errorText: 'This field is required');

  final _passwordValidator = MultiValidator(
    [
      _requiredValidator,
      MinLengthValidator(8,
          errorText: 'Password must be at least 8 digits long'),
    ],
  );

  final _emailValidator = MultiValidator([
    _requiredValidator,
    EmailValidator(errorText: 'Enter a valid email address'),
  ]);
  // End of Validator

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
      Widget _getStartedButton() {
        return Center(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            child: PrimaryButton(
              text: 'Get Started',
              onPressed: () {
                final isValid = _formKey.currentState!.validate();

                if (isValid) {
                  _formKey.currentState!.save();
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.bonusPage, (route) => false);
                }
              },
            ),
          ),
        );
      }

      return Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Full Name
              BasicTextField(
                validation: _requiredValidator,
                label: 'Full Name',
                hintText: 'Your Full Name',
              ),

              // Email Address
              BasicTextField(
                validation: _emailValidator,
                label: 'Email Address',
                hintText: 'Your Email Address',
              ),

              // Password
              BasicTextField(
                validation: _passwordValidator,
                label: 'Password',
                hintText: 'Your Password',
                isPassword: true,
              ),

              // Hobby
              BasicTextField(
                validation: _requiredValidator,
                label: 'Hobby',
                hintText: 'Your Hobby',
              ),

              _getStartedButton()
            ],
          ),
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
