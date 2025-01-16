import 'package:flutter/material.dart';
import 'package:task/models/site_model.dart';
import 'package:task/widgets/site_card.dart';

class SitesList extends StatelessWidget {
  const SitesList({
    super.key,
    required this.sites,
  });

  final List<SiteModel> sites;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: ListView.separated(
        itemCount: sites.length,
        separatorBuilder: (context, index) => SizedBox(height: 8),
        itemBuilder: (context, index) => SiteCard(
          siteModel: sites[index],
        ),
      ),
    );
  }
}
