import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

void main(List<String> args) {
  runApp(MaterialApp(
      home: Scaffold(
          body: SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(ThemeConfig.kPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          Center(
              child: TextButtonWidget(
            'Hello World',
            onPressed: () {},
          )),
          const Spacer(),
          const ListTileWidget(
            title: 'Hello World',
            //subtitle: "Hello World\n\nadsfdsf",
          ),
          const Spacer(),
          ElevatedButtonWidget(
            'Hello World',
            onPressed: () {},
          ),
          const Spacer(),
        ],
      ),
    ),
  ))));
}
