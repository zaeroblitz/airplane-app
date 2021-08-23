part of 'widgets.dart';

class DetailPhotoItem extends StatelessWidget {
  final String imageUrl;
  DetailPhotoItem(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
    );
  }
}
