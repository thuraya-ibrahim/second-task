class SiteModel {
  final bool isOpen;
  final double latitude;
  final double longitude;
  final int workOrderNumber;
  final String siteName;

  const SiteModel({
    required this.isOpen,
    required this.latitude,
    required this.longitude,
    required this.workOrderNumber,
    required this.siteName,
  });

  factory SiteModel.fromJson(Map<String, dynamic> json) => SiteModel(
        isOpen: json['IsOpen'],
        latitude: json['Latitude'],
        longitude: json['Longitude'],
        workOrderNumber: json['WorkOrderNumber'],
        siteName: json['SiteName'],
      );
}
