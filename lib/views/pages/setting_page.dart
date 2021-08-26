part of 'pages.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: kPinkColor,
            ),
          );
        } else if (state is AuthInitial) {
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.signInPage, (route) => false);
        }
      },
      builder: (context, state) {
        return Center(
          child: Container(
            width: 225,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 30,
                offset: Offset(0, 10),
                color: kPrimaryColor.withOpacity(0.65),
              ),
            ]),
            child: PrimaryButton(
              width: 225,
              text: 'Sign Out',
              onPressed: () {
                context.read<AuthCubit>().signOut();
              },
            ),
          ),
        );
      },
    );
  }
}
