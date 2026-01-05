class Place {
  final String xid;
  final String name;
  final String kinds;
  final Point point;
  final double dist;

  Place({
    required this.xid,
    required this.name,
    required this.kinds,
    required this.point,
    required this.dist,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      xid: json['xid'] ?? '',
      name: json['name'] ?? 'Unknown Place',
      kinds: json['kinds'] ?? '',
      point: Point.fromJson(json['point'] ?? {}),
      dist: (json['dist'] ?? 0).toDouble(),
    );
  }
}

class Point {
  final double lon;
  final double lat;

  Point({
    required this.lon,
    required this.lat,
  });

  factory Point.fromJson(Map<String, dynamic> json) {
    return Point(
      lon: (json['lon'] ?? 0).toDouble(),
      lat: (json['lat'] ?? 0).toDouble(),
    );
  }
}
