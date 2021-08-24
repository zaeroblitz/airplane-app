part of 'pages.dart';

class SuccessCheckoutPage extends StatelessWidget {
  const SuccessCheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 150,
                  margin: EdgeInsets.only(bottom: 80),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/illust_checkout_success.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text('Well Booked 😍', style: bigTitleTextStyle),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Are you ready to explore the new \nworld of experiences?',
                  style: regularSubtitleTextStyle,
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 50,
                  ),
                  child: PrimaryButton(
                    width: 225,
                    text: 'My Bookings',
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.mainPage,
                        (route) => false,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
