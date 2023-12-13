import 'package:bookbuzz/pages/ClubFeed/components/club_feed_card.dart';
import 'package:bookbuzz/pages/Profile/components/club_listTile.dart';
import 'package:bookbuzz/styles/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../general_components/my_horizontal_divider.dart';

class ClubListTileView extends StatelessWidget {
  const ClubListTileView(
      {Key? key, required this.clubList, this.isMember = false})
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
            ClubListTile(
              bookClub: clubList[index],
              isMember: isMember,
            ),
          ],
        );
      },
    );
  }
}
