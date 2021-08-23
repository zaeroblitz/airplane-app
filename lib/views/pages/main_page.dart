part of 'pages.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildContext() {
      return HomePage();
    }

    Widget _bottomNav() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            bottom: 30,
          ),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavbarIcon(
                iconUrl: 'assets/icon_home.png',
                isActive: true,
              ),
              NavbarIcon(
                iconUrl: 'assets/icon_booking.png',
                isActive: false,
              ),
              NavbarIcon(
                iconUrl: 'assets/icon_wallet.png',
                isActive: false,
              ),
              NavbarIcon(
                iconUrl: 'assets/icon_setting.png',
                isActive: false,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          _buildContext(),
          _bottomNav(),
        ],
      ),
    );
  }
}
