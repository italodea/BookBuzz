// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bookbuzz/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ClubHeaderTabBar extends StatelessWidget {
  const ClubHeaderTabBar({super.key, required this.isMember});

  final bool isMember;
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: false,
      delegate: _SliverAppBarDelegate(
        TabBar(
          indicatorColor: AppColors.secondaryColor,
          labelColor: AppColors.secondaryColor,
          unselectedLabelColor: AppColors.blackColor,
          dividerColor: AppColors.primaryColor,
          isScrollable: false,
          tabs: isMember
              ? [
                  Tab(text: 'Lendo agora'),
                  Tab(text: 'Votação'),
                  Tab(text: 'Discussões'),
                  Tab(text: 'Membros'),
                  // Tab(text: 'Histórico'),
                ]
              : [
                  Tab(text: 'Lendo agora'),
                  Tab(text: 'Membros'),
                ],
        ),
      ),
      pinned: true,
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColors.whiteColor, // Define a cor de fundo da AppBar
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
