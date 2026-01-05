import '../models/place.dart';
import '../models/place_details.dart';

class MockDataService {
  /// Get mock accommodation data for Tangier, Morocco
  static List<Place> getMockAccommodations() {
    return [
      Place(
        xid: 'mock1',
        name: 'Hilton Tangier Al Houara',
        kinds: 'hotels',
        point: Point(lon: -5.8339, lat: 35.7595),
        dist: 0.5,
      ),
      Place(
        xid: 'mock2',
        name: 'Royal Tulip City Center',
        kinds: 'hotels',
        point: Point(lon: -5.8350, lat: 35.7600),
        dist: 0.8,
      ),
      Place(
        xid: 'mock3',
        name: 'Kenzi Solazur Hotel',
        kinds: 'resorts',
        point: Point(lon: -5.8300, lat: 35.7650),
        dist: 1.2,
      ),
      Place(
        xid: 'mock4',
        name: 'Mövenpick Hotel & Casino',
        kinds: 'hotels',
        point: Point(lon: -5.8400, lat: 35.7580),
        dist: 1.5,
      ),
      Place(
        xid: 'mock5',
        name: 'Grand Hotel Villa de France',
        kinds: 'hotels',
        point: Point(lon: -5.8320, lat: 35.7610),
        dist: 0.9,
      ),
      Place(
        xid: 'mock6',
        name: 'El Minzah Hotel',
        kinds: 'hotels',
        point: Point(lon: -5.8310, lat: 35.7620),
        dist: 1.1,
      ),
    ];
  }

  /// Get mock place details
  static Map<String, PlaceDetails> getMockPlaceDetails() {
    return {
      'mock1': PlaceDetails(
        xid: 'mock1',
        name: 'Hilton Tangier Al Houara',
        address: 'Place Al Houara, Tangier',
        rate: '4.5',
        image: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80',
        preview: null,
        wikipedia: null,
        kinds: 'hotels',
      ),
      'mock2': PlaceDetails(
        xid: 'mock2',
        name: 'Royal Tulip City Center',
        address: 'Avenue Mohammed VI, Tangier',
        rate: '4.3',
        image: 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?auto=format&fit=crop&w=800&q=80',
        preview: null,
        wikipedia: null,
        kinds: 'hotels',
      ),
      'mock3': PlaceDetails(
        xid: 'mock3',
        name: 'Kenzi Solazur Hotel',
        address: 'Route de Malabata, Tangier',
        rate: '4.2',
        image: 'https://images.unsplash.com/photo-1571896349842-6e53ce41e8f2?auto=format&fit=crop&w=800&q=80',
        preview: null,
        wikipedia: null,
        kinds: 'resorts',
      ),
      'mock4': PlaceDetails(
        xid: 'mock4',
        name: 'Mövenpick Hotel & Casino',
        address: 'Avenue des FAR, Tangier',
        rate: '4.4',
        image: 'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?auto=format&fit=crop&w=800&q=80',
        preview: null,
        wikipedia: null,
        kinds: 'hotels',
      ),
      'mock5': PlaceDetails(
        xid: 'mock5',
        name: 'Grand Hotel Villa de France',
        address: 'Rue de Hollande, Tangier',
        rate: '4.6',
        image: 'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?auto=format&fit=crop&w=800&q=80',
        preview: null,
        wikipedia: null,
        kinds: 'hotels',
      ),
      'mock6': PlaceDetails(
        xid: 'mock6',
        name: 'El Minzah Hotel',
        address: 'Rue de la Liberté, Tangier',
        rate: '4.7',
        image: 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?auto=format&fit=crop&w=800&q=80',
        preview: null,
        wikipedia: null,
        kinds: 'hotels',
      ),
    };
  }
}
