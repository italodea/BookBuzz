import 'package:bookbuzz/pages/ClubFeed/components/club_feed_card.dart';
import 'package:bookbuzz/styles/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../general_components/my_horizontal_divider.dart';

class ClubListView extends StatelessWidget {
  const ClubListView({Key? key, required this.clubList, this.isMember = false})
      : super(key: key);
  final List clubList;
  final bool isMember;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      primary: true,
      shrinkWrap: true,
      itemCount: clubList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ClubFeedCard(
              bookClub: clubList[index],
              isMember: isMember,
            ),
            index != clubList.length - 1
                ? MyHorizontalDivider(
                    width: MediaQuery.of(context).size.width * 0.87,
                    color: AppColors.greyColor,
                  )
                : Container(),
          ],
        );
      },
    );
  }
}
