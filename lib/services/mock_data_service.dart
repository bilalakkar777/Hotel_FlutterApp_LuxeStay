import '../models/place.dart';
import '../models/place_details.dart';

class MockDataService {
  /// Get hotels by location
  static Map<String, dynamic> getHotelsByLocation(String location) {
    final locationLower = location.toLowerCase().trim();
    
    // Map of city keywords to their data
    final cityData = {
      'santorini': _getSantoriniHotels(),
      'greece': _getSantoriniHotels(),
      'paris': _getParisHotels(),
      'france': _getParisHotels(),
      'dubai': _getDubaiHotels(),
      'uae': _getDubaiHotels(),
      'bali': _getBaliHotels(),
      'indonesia': _getBaliHotels(),
      'rome': _getRomeHotels(),
      'italy': _getRomeHotels(),
      'new york': _getNewYorkHotels(),
      'nyc': _getNewYorkHotels(),
      'tangier': _getTangierHotels(),
      'morocco': _getTangierHotels(),
    };
    
    // Find matching city
    for (var entry in cityData.entries) {
      if (locationLower.contains(entry.key)) {
        return entry.value;
      }
    }
    
    // Default to Santorini if no match
    return _getSantoriniHotels();
  }

  /// Get mock accommodation data for Tangier, Morocco (legacy method)
  static List<Place> getMockAccommodations() {
    return _getTangierHotels()['places'] as List<Place>;
  }

  /// Get mock place details (legacy method)
  static Map<String, PlaceDetails> getMockPlaceDetails() {
    return _getTangierHotels()['details'] as Map<String, PlaceDetails>;
  }

  // Santorini, Greece Hotels
  static Map<String, dynamic> _getSantoriniHotels() {
    final places = [
      Place(xid: 'santorini1', name: 'Katikies Hotel', kinds: 'hotels', point: Point(lon: 25.4315, lat: 36.4618), dist: 0.3),
      Place(xid: 'santorini2', name: 'Canaves Oia Suites', kinds: 'hotels', point: Point(lon: 25.4320, lat: 36.4620), dist: 0.5),
      Place(xid: 'santorini3', name: 'Grace Hotel Santorini', kinds: 'resorts', point: Point(lon: 25.4310, lat: 36.4615), dist: 0.7),
      Place(xid: 'santorini4', name: 'Andronis Luxury Suites', kinds: 'hotels', point: Point(lon: 25.4325, lat: 36.4625), dist: 0.9),
      Place(xid: 'santorini5', name: 'Perivolas Hotel', kinds: 'hotels', point: Point(lon: 25.4305, lat: 36.4610), dist: 1.1),
    ];
    
    final details = {
      'santorini1': PlaceDetails(xid: 'santorini1', name: 'Katikies Hotel', address: 'Oia, Santorini', rate: '4.9', image: 'https://images.unsplash.com/photo-1602002418082-a4443e081dd1?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'hotels'),
      'santorini2': PlaceDetails(xid: 'santorini2', name: 'Canaves Oia Suites', address: 'Oia, Santorini', rate: '4.8', image: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'hotels'),
      'santorini3': PlaceDetails(xid: 'santorini3', name: 'Grace Hotel Santorini', address: 'Imerovigli, Santorini', rate: '4.7', image: 'https://images.unsplash.com/photo-1571896349842-6e53ce41e8f2?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'resorts'),
      'santorini4': PlaceDetails(xid: 'santorini4', name: 'Andronis Luxury Suites', address: 'Oia, Santorini', rate: '4.9', image: 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'hotels'),
      'santorini5': PlaceDetails(xid: 'santorini5', name: 'Perivolas Hotel', address: 'Oia, Santorini', rate: '4.8', image: 'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'hotels'),
    };
    
    return {'places': places, 'details': details};
  }

  // Paris, France Hotels
  static Map<String, dynamic> _getParisHotels() {
    final places = [
      Place(xid: 'paris1', name: 'The Ritz Paris', kinds: 'hotels', point: Point(lon: 2.3292, lat: 48.8683), dist: 0.2),
      Place(xid: 'paris2', name: 'Le Bristol Paris', kinds: 'hotels', point: Point(lon: 2.3160, lat: 48.8708), dist: 0.4),
      Place(xid: 'paris3', name: 'Four Seasons George V', kinds: 'hotels', point: Point(lon: 2.3007, lat: 48.8687), dist: 0.6),
      Place(xid: 'paris4', name: 'Shangri-La Hotel', kinds: 'hotels', point: Point(lon: 2.2936, lat: 48.8634), dist: 0.8),
      Place(xid: 'paris5', name: 'Hôtel Plaza Athénée', kinds: 'hotels', point: Point(lon: 2.3045, lat: 48.8661), dist: 1.0),
    ];
    
    final details = {
      'paris1': PlaceDetails(xid: 'paris1', name: 'The Ritz Paris', address: 'Place Vendôme, Paris', rate: '4.9', image: 'https://images.unsplash.com/photo-1549294413-26f195200c16?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'hotels'),
      'paris2': PlaceDetails(xid: 'paris2', name: 'Le Bristol Paris', address: 'Rue du Faubourg Saint-Honoré, Paris', rate: '4.8', image: 'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'hotels'),
      'paris3': PlaceDetails(xid: 'paris3', name: 'Four Seasons George V', address: 'Avenue George V, Paris', rate: '4.9', image: 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'hotels'),
      'paris4': PlaceDetails(xid: 'paris4', name: 'Shangri-La Hotel', address: 'Avenue d\'Iéna, Paris', rate: '4.7', image: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'hotels'),
      'paris5': PlaceDetails(xid: 'paris5', name: 'Hôtel Plaza Athénée', address: 'Avenue Montaigne, Paris', rate: '4.8', image: 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'hotels'),
    };
    
    return {'places': places, 'details': details};
  }

  // Dubai, UAE Hotels
  static Map<String, dynamic> _getDubaiHotels() {
    final places = [
      Place(xid: 'dubai1', name: 'Burj Al Arab', kinds: 'hotels', point: Point(lon: 55.1854, lat: 25.1413), dist: 0.1),
      Place(xid: 'dubai2', name: 'Atlantis The Palm', kinds: 'resorts', point: Point(lon: 55.1167, lat: 25.1304), dist: 0.3),
      Place(xid: 'dubai3', name: 'Armani Hotel Dubai', kinds: 'hotels', point: Point(lon: 55.2744, lat: 25.1972), dist: 0.5),
      Place(xid: 'dubai4', name: 'Jumeirah Beach Hotel', kinds: 'hotels', point: Point(lon: 55.1890, lat: 25.1420), dist: 0.7),
      Place(xid: 'dubai5', name: 'The Palace Downtown', kinds: 'hotels', point: Point(lon: 55.2766, lat: 25.1941), dist: 0.9),
    ];
    
    final details = {
      'dubai1': PlaceDetails(xid: 'dubai1', name: 'Burj Al Arab', address: 'Jumeirah Beach, Dubai', rate: '5.0', image: 'https://images.unsplash.com/photo-1512453979798-5ea936a7fe48?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'hotels'),
      'dubai2': PlaceDetails(xid: 'dubai2', name: 'Atlantis The Palm', address: 'Palm Jumeirah, Dubai', rate: '4.8', image: 'https://images.unsplash.com/photo-1571896349842-6e53ce41e8f2?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'resorts'),
      'dubai3': PlaceDetails(xid: 'dubai3', name: 'Armani Hotel Dubai', address: 'Burj Khalifa, Dubai', rate: '4.9', image: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'hotels'),
      'dubai4': PlaceDetails(xid: 'dubai4', name: 'Jumeirah Beach Hotel', address: 'Jumeirah Beach Road, Dubai', rate: '4.7', image: 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'hotels'),
      'dubai5': PlaceDetails(xid: 'dubai5', name: 'The Palace Downtown', address: 'Downtown Dubai', rate: '4.8', image: 'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'hotels'),
    };
    
    return {'places': places, 'details': details};
  }

  // Bali, Indonesia Hotels
  static Map<String, dynamic> _getBaliHotels() {
    final places = [
      Place(xid: 'bali1', name: 'Four Seasons Bali', kinds: 'resorts', point: Point(lon: 115.0861, lat: -8.5069), dist: 0.2),
      Place(xid: 'bali2', name: 'The St. Regis Bali', kinds: 'resorts', point: Point(lon: 115.1728, lat: -8.7983), dist: 0.4),
      Place(xid: 'bali3', name: 'COMO Uma Ubud', kinds: 'hotels', point: Point(lon: 115.2624, lat: -8.5151), dist: 0.6),
      Place(xid: 'bali4', name: 'Alila Villas Uluwatu', kinds: 'resorts', point: Point(lon: 115.0844, lat: -8.8290), dist: 0.8),
      Place(xid: 'bali5', name: 'Mandapa Ritz-Carlton', kinds: 'resorts', point: Point(lon: 115.2644, lat: -8.5171), dist: 1.0),
    ];
    
    final details = {
      'bali1': PlaceDetails(xid: 'bali1', name: 'Four Seasons Bali', address: 'Jimbaran Bay, Bali', rate: '4.9', image: 'https://images.unsplash.com/photo-1537996194471-e657df975ab4?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'resorts'),
      'bali2': PlaceDetails(xid: 'bali2', name: 'The St. Regis Bali', address: 'Nusa Dua, Bali', rate: '4.8', image: 'https://images.unsplash.com/photo-1571896349842-6e53ce41e8f2?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'resorts'),
      'bali3': PlaceDetails(xid: 'bali3', name: 'COMO Uma Ubud', address: 'Ubud, Bali', rate: '4.7', image: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'hotels'),
      'bali4': PlaceDetails(xid: 'bali4', name: 'Alila Villas Uluwatu', address: 'Uluwatu, Bali', rate: '4.9', image: 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'resorts'),
      'bali5': PlaceDetails(xid: 'bali5', name: 'Mandapa Ritz-Carlton', address: 'Ubud, Bali', rate: '4.8', image: 'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'resorts'),
    };
    
    return {'places': places, 'details': details};
  }

  // Rome, Italy Hotels
  static Map<String, dynamic> _getRomeHotels() {
    final places = [
      Place(xid: 'rome1', name: 'Hotel Hassler Roma', kinds: 'hotels', point: Point(lon: 12.4829, lat: 41.9064), dist: 0.2),
      Place(xid: 'rome2', name: 'Hotel de Russie', kinds: 'hotels', point: Point(lon: 12.4776, lat: 41.9078), dist: 0.4),
      Place(xid: 'rome3', name: 'The St. Regis Rome', kinds: 'hotels', point: Point(lon: 12.4906, lat: 41.9028), dist: 0.6),
      Place(xid: 'rome4', name: 'Hotel Eden', kinds: 'hotels', point: Point(lon: 12.4883, lat: 41.9073), dist: 0.8),
      Place(xid: 'rome5', name: 'J.K. Place Roma', kinds: 'hotels', point: Point(lon: 12.4768, lat: 41.9055), dist: 1.0),
    ];
    
    final details = {
      'rome1': PlaceDetails(xid: 'rome1', name: 'Hotel Hassler Roma', address: 'Piazza Trinità dei Monti, Rome', rate: '4.9', image: 'https://images.unsplash.com/photo-1552832230-c0197dd311b5?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'hotels'),
      'rome2': PlaceDetails(xid: 'rome2', name: 'Hotel de Russie', address: 'Via del Babuino, Rome', rate: '4.8', image: 'https://images.unsplash.com/photo-1571896349842-6e53ce41e8f2?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'hotels'),
      'rome3': PlaceDetails(xid: 'rome3', name: 'The St. Regis Rome', address: 'Via Vittorio Emanuele Orlando, Rome', rate: '4.9', image: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'hotels'),
      'rome4': PlaceDetails(xid: 'rome4', name: 'Hotel Eden', address: 'Via Ludovisi, Rome', rate: '4.7', image: 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'hotels'),
      'rome5': PlaceDetails(xid: 'rome5', name: 'J.K. Place Roma', address: 'Via di Monte d\'Oro, Rome', rate: '4.8', image: 'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'hotels'),
    };
    
    return {'places': places, 'details': details};
  }

  // New York, USA Hotels
  static Map<String, dynamic> _getNewYorkHotels() {
    final places = [
      Place(xid: 'ny1', name: 'The Plaza Hotel', kinds: 'hotels', point: Point(lon: -73.9744, lat: 40.7643), dist: 0.2),
      Place(xid: 'ny2', name: 'The St. Regis New York', kinds: 'hotels', point: Point(lon: -73.9750, lat: 40.7616), dist: 0.4),
      Place(xid: 'ny3', name: 'The Peninsula New York', kinds: 'hotels', point: Point(lon: -73.9758, lat: 40.7614), dist: 0.6),
      Place(xid: 'ny4', name: 'Mandarin Oriental', kinds: 'hotels', point: Point(lon: -73.9832, lat: 40.7688), dist: 0.8),
      Place(xid: 'ny5', name: 'The Carlyle', kinds: 'hotels', point: Point(lon: -73.9634, lat: 40.7744), dist: 1.0),
    ];
    
    final details = {
      'ny1': PlaceDetails(xid: 'ny1', name: 'The Plaza Hotel', address: 'Fifth Avenue, New York', rate: '4.8', image: 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'hotels'),
      'ny2': PlaceDetails(xid: 'ny2', name: 'The St. Regis New York', address: 'East 55th Street, New York', rate: '4.9', image: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'hotels'),
      'ny3': PlaceDetails(xid: 'ny3', name: 'The Peninsula New York', address: 'Fifth Avenue, New York', rate: '4.8', image: 'https://images.unsplash.com/photo-1571896349842-6e53ce41e8f2?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'hotels'),
      'ny4': PlaceDetails(xid: 'ny4', name: 'Mandarin Oriental', address: 'Columbus Circle, New York', rate: '4.7', image: 'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'hotels'),
      'ny5': PlaceDetails(xid: 'ny5', name: 'The Carlyle', address: 'Madison Avenue, New York', rate: '4.9', image: 'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'hotels'),
    };
    
    return {'places': places, 'details': details};
  }

  // Tangier, Morocco Hotels (original data)
  static Map<String, dynamic> _getTangierHotels() {
    final places = [
      Place(xid: 'mock1', name: 'Hilton Tangier Al Houara', kinds: 'hotels', point: Point(lon: -5.8339, lat: 35.7595), dist: 0.5),
      Place(xid: 'mock2', name: 'Royal Tulip City Center', kinds: 'hotels', point: Point(lon: -5.8350, lat: 35.7600), dist: 0.8),
      Place(xid: 'mock3', name: 'Kenzi Solazur Hotel', kinds: 'resorts', point: Point(lon: -5.8300, lat: 35.7650), dist: 1.2),
      Place(xid: 'mock4', name: 'Mövenpick Hotel & Casino', kinds: 'hotels', point: Point(lon: -5.8400, lat: 35.7580), dist: 1.5),
      Place(xid: 'mock5', name: 'Grand Hotel Villa de France', kinds: 'hotels', point: Point(lon: -5.8320, lat: 35.7610), dist: 0.9),
      Place(xid: 'mock6', name: 'El Minzah Hotel', kinds: 'hotels', point: Point(lon: -5.8310, lat: 35.7620), dist: 1.1),
    ];
    
    final details = {
      'mock1': PlaceDetails(xid: 'mock1', name: 'Hilton Tangier Al Houara', address: 'Place Al Houara, Tangier', rate: '4.5', image: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'hotels'),
      'mock2': PlaceDetails(xid: 'mock2', name: 'Royal Tulip City Center', address: 'Avenue Mohammed VI, Tangier', rate: '4.3', image: 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'hotels'),
      'mock3': PlaceDetails(xid: 'mock3', name: 'Kenzi Solazur Hotel', address: 'Route de Malabata, Tangier', rate: '4.2', image: 'https://images.unsplash.com/photo-1571896349842-6e53ce41e8f2?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'resorts'),
      'mock4': PlaceDetails(xid: 'mock4', name: 'Mövenpick Hotel & Casino', address: 'Avenue des FAR, Tangier', rate: '4.4', image: 'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'hotels'),
      'mock5': PlaceDetails(xid: 'mock5', name: 'Grand Hotel Villa de France', address: 'Rue de Hollande, Tangier', rate: '4.6', image: 'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'hotels'),
      'mock6': PlaceDetails(xid: 'mock6', name: 'El Minzah Hotel', address: 'Rue de la Liberté, Tangier', rate: '4.7', image: 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?auto=format&fit=crop&w=800&q=80', preview: null, wikipedia: null, kinds: 'hotels'),
    };
    
    return {'places': places, 'details': details};
  }
}
