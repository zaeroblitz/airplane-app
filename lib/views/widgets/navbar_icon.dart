part of 'widgets.dart';

class NavbarIcon extends StatelessWidget {
  final String iconUrl;
  final bool isActive;

  NavbarIcon({
    this.iconUrl = '',
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: 2),
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(iconUrl),
            ),
          ),
        ),
        Container(
          width: 30,
          height: 2,
          decoration: BoxDecoration(
            color: isActive ? kPrimaryColor : kTransparentColor,
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
        ),
      ],
    );
  }
}
