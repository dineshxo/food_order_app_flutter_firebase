import 'package:flutter/material.dart';
import 'package:food_order/constants/style.dart';

class NavBarMenuButton extends StatelessWidget {
  const NavBarMenuButton({
    super.key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) : _scaffoldKey = scaffoldKey;

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(color: mainYellow, shape: BoxShape.circle),
      child: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(
            Icons.menu_sharp,
            color: Colors.black,
          )),
    );
  }
}
