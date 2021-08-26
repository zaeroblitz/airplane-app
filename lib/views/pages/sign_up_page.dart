part of 'pages.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController(text: '');
  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _hobbyController =
      TextEditingController(text: '');
  final TextEditingController _passwordController =
      TextEditingController(text: '');

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
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (_, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoutes.bonusPage, (route) => false);
            } else if (state is AuthFailed) {
              print(state.error);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kPinkColor,
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return SpinKitWave(
                size: 50,
                color: kPrimaryColor,
                duration: Duration(seconds: 3),
              );
            }

            return Center(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: PrimaryButton(
                  text: 'Get Started',
                  onPressed: () {
                    final isValid = _formKey.currentState!.validate();

                    if (isValid) {
                      _formKey.currentState!.save();

                      context.read<AuthCubit>().signUp(
                            email: _emailController.text,
                            password: _passwordController.text,
                            name: _nameController.text,
                            hobby: _hobbyController.text,
                          );
                    }
                  },
                ),
              ),
            );
          },
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
                validation: requiredValidator,
                label: 'Full Name',
                hintText: 'Your Full Name',
                controller: _nameController,
              ),

              // Email Address
              BasicTextField(
                validation: emailValidator,
                label: 'Email Address',
                hintText: 'Your Email Address',
                controller: _emailController,
              ),

              // Password
              BasicTextField(
                validation: passwordValidator,
                label: 'Password',
                hintText: 'Your Password',
                isPassword: true,
                controller: _passwordController,
              ),

              // Hobby
              BasicTextField(
                validation: requiredValidator,
                label: 'Hobby',
                hintText: 'Your Hobby',
                controller: _hobbyController,
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
