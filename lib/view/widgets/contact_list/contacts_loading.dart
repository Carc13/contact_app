import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/custom_colors.dart';
import './contact_loading_item.dart';

class ContactsLoading extends StatelessWidget {
  const ContactsLoading({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(top: 20, bottom: (MediaQuery.of(context).padding.bottom + 20)),
      children: [
        Shimmer.fromColors(
          baseColor: CustomColors.backgroundColor.withOpacity(0.5),
          highlightColor: CustomColors.highlightColor.withOpacity(0.03),
          enabled: true,
          child: Column(
            children: const [
              ContactLoadingItem(),
              ContactLoadingItem(),
              ContactLoadingItem(),
              ContactLoadingItem(),
              ContactLoadingItem(),
              ContactLoadingItem(),
              ContactLoadingItem(),
              ContactLoadingItem(),
            ],
          ),
        ),
      ],
    );

  }

}




