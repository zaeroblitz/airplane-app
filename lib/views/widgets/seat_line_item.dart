part of 'widgets.dart';

class SeatLineItem extends StatelessWidget {
  final int line;
  final List<Widget> widgets;

  const SeatLineItem({Key? key, this.line = 0, required this.widgets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: (line == 1) ? EdgeInsets.only(top: 4) : EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widgets,
      ),
    );
  }
}
