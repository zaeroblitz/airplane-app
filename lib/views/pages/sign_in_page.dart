part of 'pages.dart';

class SignInPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController =
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
      Widget _signInButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoutes.mainPage, (route) => false);
            } else if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
                backgroundColor: kPinkColor,
              ));
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return SpinKitWanderingCubes(
                size: 50,
                color: kPrimaryColor,
                duration: Duration(seconds: 3),
              );
            }

            return Container(
              margin: EdgeInsets.only(top: 10),
              child: PrimaryButton(
                text: 'Sign In',
                onPressed: () {
                  final isValid = _formKey.currentState!.validate();

                  if (isValid) {
                    _formKey.currentState!.save();
                    context.read<PageCubit>().setPage(0);
                    context.read<AuthCubit>().signIn(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                  }
                },
              ),
            );
          },
        );
      }

      return Container(
        padding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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

              _signInButton(),
            ],
          ),
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
