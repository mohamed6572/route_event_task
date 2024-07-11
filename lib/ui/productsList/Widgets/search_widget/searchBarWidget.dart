import 'package:flutter/material.dart';

import '../../../constans/constans.dart';

class SearchBarWidget extends StatelessWidget {
  SearchBarWidget({required this.controller, required this.hintText});

  TextEditingController controller;
  String hintText;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: controller,
      backgroundColor: MaterialStateProperty.all(Colors.white),
      leading: Image.asset('assets/images/ic_search.png'),
      elevation: MaterialStateProperty.all(0.0),
      hintText: hintText,
      side: MaterialStateProperty.all(BorderSide(color: AppConstans.mainColor)),
      hintStyle: MaterialStateProperty.all(AppConstans.hintStyle),
    );
  }
}
