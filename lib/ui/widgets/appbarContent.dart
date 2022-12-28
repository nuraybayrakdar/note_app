import 'package:flutter/material.dart';

class AppbarContent extends StatelessWidget {
  const AppbarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155,
      width: 500,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: _header(),
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Icon(
          Icons.light_mode_outlined,
          color: Colors.white,
          size: 30,
        ),
        Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        )
      ],
    );
  }

  Widget _userInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Icon(
          Icons.arrow_back_rounded,
          color: Colors.white,
          size: 30,
        ),
        Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        )
      ],
    );
  }
}
