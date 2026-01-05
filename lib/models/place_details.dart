class PlaceDetails {
  final String xid;
  final String name;
  final String address;
  final String rate;
  final String? image;
  final Preview? preview;
  final String? wikipedia;
  final String kinds;

  PlaceDetails({
    required this.xid,
    required this.name,
    required this.address,
    required this.rate,
    this.image,
    this.preview,
    this.wikipedia,
    required this.kinds,
  });

  factory PlaceDetails.fromJson(Map<String, dynamic> json) {
    return PlaceDetails(
      xid: json['xid'] ?? '',
      name: json['name'] ?? 'Unknown Place',
      address: json['address']?['road'] ?? 
               json['address']?['city'] ?? 
               json['address']?['state'] ?? 
               'Location not available',
      rate: json['rate']?.toString() ?? '0',
      image: json['image'],
      preview: json['preview'] != null ? Preview.fromJson(json['preview']) : null,
      wikipedia: json['wikipedia'],
      kinds: json['kinds'] ?? '',
    );
  }
}

class Preview {
  final String source;
  final int height;
  final int width;

  Preview({
    required this.source,
    required this.height,
    required this.width,
  });

  factory Preview.fromJson(Map<String, dynamic> json) {
    return Preview(
      source: json['source'] ?? '',
      height: json['height'] ?? 0,
      width: json['width'] ?? 0,
    );
  }
}
