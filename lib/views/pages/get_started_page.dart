part of 'pages.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image_get_started.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Fly Like a Bird',
                  style: bigTitleTextStyle.copyWith(color: kWhiteColor),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Explore new world with us and let \nyourself get an amazing experiences',
                  style: regularSubtitleTextStyle,
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 50,
                    bottom: 80,
                  ),
                  child: PrimaryButton(
                    text: 'Get Started',
                    width: 225,
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.signInPage);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
