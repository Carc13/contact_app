import 'package:flutter/material.dart';

class ContactLoadingItem extends StatelessWidget {
  const ContactLoadingItem({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 100,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
    );

  }

}
