part of 'widgets.dart';

class SeatSelectItem extends StatefulWidget {
  final bool isAvailable;

  const SeatSelectItem({Key? key, this.isAvailable = true}) : super(key: key);

  @override
  _SeatSelectItemState createState() => _SeatSelectItemState();
}

class _SeatSelectItemState extends State<SeatSelectItem> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: widget.isAvailable
          ? Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: _isSelected ? kPrimaryColor : kUnavailableColor,
                border: Border.all(
                  width: 2,
                  color: _isSelected ? kPrimaryColor : kPrimaryColor,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: _isSelected
                  ? Center(
                      child: Text(
                        'YOU',
                        style: whiteTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                    )
                  : SizedBox(),
            )
          : Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: kUnavailableColor,
                border: Border.all(
                  width: 2,
                  color: kUnavailableColor,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
    );
  }
}
