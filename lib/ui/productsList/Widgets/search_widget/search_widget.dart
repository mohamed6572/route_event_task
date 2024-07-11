import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:route_event_task/ui/productsList/Widgets/search_widget/searchBarWidget.dart';

import '../../../constans/constans.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({required this.controller, required this.hintText});

  TextEditingController controller;
  String hintText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      Expanded(child: SearchBarWidget(controller: controller, hintText: hintText)),
        SizedBox(width: 8,),
        Image.asset('assets/images/ic_cart.png')
      ],
    );
  }
}
