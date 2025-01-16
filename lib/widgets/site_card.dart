import 'package:flutter/material.dart';
import 'package:task/models/site_model.dart';

class SiteCard extends StatelessWidget {
  const SiteCard({
    super.key,
    required this.siteModel,
  });

  final SiteModel siteModel;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: siteModel.isOpen ? 1.0 : 0.6,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12),
        ),
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    siteModel.siteName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  siteModel.isOpen ? 'Open' : 'Closed',
                  style: TextStyle(
                    color: siteModel.isOpen ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Work Order Number: ${siteModel.workOrderNumber}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [
                Text('Latitude: ${siteModel.latitude}'),
                Text('Longitude: ${siteModel.longitude}'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
