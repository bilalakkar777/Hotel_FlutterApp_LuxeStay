import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'services/mock_data_service.dart';
import 'models/place.dart';
import 'models/place_details.dart';
import 'screens/hotel_details_screen.dart';
import 'screens/auth_screens.dart';
import 'screens/profile_screen.dart';
import 'screens/search_results_page.dart';

void main() {
  runApp(const LuxeStayApp());
}

class LuxeStayApp extends StatelessWidget {
  const LuxeStayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LuxeStay',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8F7F4), // Warm off-white
        primaryColor: const Color(0xFF0A1A3A), // Deep Navy
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFFD4AF37), // Metallic Gold
        ),
        textTheme: GoogleFonts.dmSansTextTheme(), // Modern Sans for body
      ),
      initialRoute: '/home',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Place> _places = [];
  Map<String, PlaceDetails> _placeDetails = {};
  bool _isLoading = true;
  
  // Search card state variables
  String _location = "Santorini, Greece";
  String _checkInDate = "Oct 12";
  String _checkOutDate = "16";
  int _adults = 2;

  @override
  void initState() {
    super.initState();
    _loadAccommodations();
  }

  Future<void> _loadAccommodations() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    
    setState(() {
      _places = MockDataService.getMockAccommodations();
      _placeDetails = MockDataService.getMockPlaceDetails();
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          // Home Tab
          _buildHomeContent(),
          // Search Tab
          const SearchResultsPage(),
          // Saved Tab (placeholder)
          _buildPlaceholderScreen('Saved', Icons.favorite_border),
          // Profile Tab
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF0A1A3A),
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Saved'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeContent() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'LuxeStay',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF0A1A3A),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xFFD4AF37), width: 1.5),
                        ),
                        child: const CircleAvatar(
                          radius: 18,
                          backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.notifications_outlined, color: Color(0xFF0A1A3A)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Search Container
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Location Field
                    GestureDetector(
                      onTap: () => _showLocationDialog(),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on_outlined, color: Color(0xFFD4AF37)),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Where to?', style: TextStyle(color: Colors.grey, fontSize: 12)),
                              Text(_location, style: GoogleFonts.dmSans(fontWeight: FontWeight.bold, fontSize: 16)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Divider(height: 1),
                    ),
                    Row(
                      children: [
                        // Dates Field
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _showDatePicker(),
                            child: Row(
                              children: [
                                const Icon(Icons.calendar_today_outlined, color: Color(0xFFD4AF37), size: 20),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Dates', style: TextStyle(color: Colors.grey, fontSize: 12)),
                                    Text('$_checkInDate - $_checkOutDate', style: GoogleFonts.dmSans(fontWeight: FontWeight.bold, fontSize: 14)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(width: 1, height: 30, color: Colors.grey[300]),
                        const SizedBox(width: 16),
                        // Guests Field
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _showGuestsDialog(),
                            child: Row(
                              children: [
                                const Icon(Icons.person_outline, color: Color(0xFFD4AF37), size: 20),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Guests', style: TextStyle(color: Colors.grey, fontSize: 12)),
                                    Text('$_adults ${_adults > 1 ? "Adults" : "Adult"}', style: GoogleFonts.dmSans(fontWeight: FontWeight.bold, fontSize: 14)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedIndex = 1; // Switch to search tab
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD4AF37),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        ),
                        child: const Text('Search', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 35),
            // Handpicked Hotels
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Handpicked for You',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0A1A3A),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 320,
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator(color: Color(0xFFD4AF37)))
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 24),
                      itemCount: _places.length,
                      itemBuilder: (context, index) {
                        final place = _places[index];
                        final details = _placeDetails[place.xid];
                        return _buildHotelCard(
                          place.name,
                          details?.address ?? '${place.dist.toStringAsFixed(1)} km away',
                          details?.rate != null && details!.rate != '0' ? 'Rating: ${details.rate}' : 'New',
                          details?.image ?? 'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80',
                        );
                      },
                    ),
            ),
            const SizedBox(height: 35),
            // Popular Destinations
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Popular Destinations',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0A1A3A),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 24),
                children: [
                  _buildDestinationItem("Bali", "https://images.unsplash.com/photo-1537996194471-e657df975ab4?auto=format&fit=crop&w=400&q=80"),
                  _buildDestinationItem("Paris", "https://images.unsplash.com/photo-1502602898657-3e91760cbb34?auto=format&fit=crop&w=400&q=80"),
                  _buildDestinationItem("Dubai", "https://images.unsplash.com/photo-1512453979798-5ea936a7fe48?auto=format&fit=crop&w=400&q=80"),
                  _buildDestinationItem("Rome", "https://images.unsplash.com/photo-1552832230-c0197dd311b5?auto=format&fit=crop&w=400&q=80"),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholderScreen(String title, IconData icon) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 80, color: const Color(0xFFD4AF37).withOpacity(0.3)),
          const SizedBox(height: 20),
          Text(
            '$title Coming Soon',
            style: GoogleFonts.playfairDisplay(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF0A1A3A),
            ),
          ),
        ],
      ),
    );
  }

  // Dialog for location selection
  void _showLocationDialog() {
    final TextEditingController controller = TextEditingController(text: _location);
    final List<String> allLocations = [
      'Santorini, Greece',
      'Paris, France',
      'Dubai, UAE',
      'Bali, Indonesia',
      'Rome, Italy',
      'New York, USA',
      'Tangier, Morocco',
    ];
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Where to?', style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.bold)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: controller,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Enter destination',
                  prefixIcon: Icon(Icons.location_on_outlined, color: Color(0xFFD4AF37)),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Popular destinations:', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: allLocations.map((location) => ActionChip(
                  label: Text(location, style: const TextStyle(fontSize: 12)),
                  avatar: const Icon(Icons.location_city, size: 16, color: Color(0xFFD4AF37)),
                  onPressed: () async {
                    Navigator.pop(context);
                    await _searchHotelsByLocation(location);
                  },
                  backgroundColor: Colors.grey[100],
                )).toList(),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () async {
              final newLocation = controller.text.trim();
              if (newLocation.isNotEmpty) {
                Navigator.pop(context);
                await _searchHotelsByLocation(newLocation);
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD4AF37)),
            child: const Text('Search', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  // Search hotels by location
  Future<void> _searchHotelsByLocation(String location) async {
    setState(() {
      _isLoading = true;
      _location = location;
    });

    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));

    // Get hotels for the location
    final hotelData = MockDataService.getHotelsByLocation(location);
    
    setState(() {
      _places = hotelData['places'] as List<Place>;
      _placeDetails = hotelData['details'] as Map<String, PlaceDetails>;
      _isLoading = false;
    });
  }

  // Dialog for date selection
  void _showDatePicker() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFFD4AF37),
              onPrimary: Colors.white,
              onSurface: Color(0xFF0A1A3A),
            ),
          ),
          child: child!,
        );
      },
    );
    
    if (picked != null) {
      setState(() {
        _checkInDate = '${_getMonthAbbr(picked.start.month)} ${picked.start.day}';
        _checkOutDate = '${picked.end.day}';
      });
    }
  }

  String _getMonthAbbr(int month) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return months[month - 1];
  }

  // Dialog for guests selection
  void _showGuestsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Number of Guests', style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.bold)),
        content: StatefulBuilder(
          builder: (context, setDialogState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Adults', style: GoogleFonts.dmSans(fontSize: 16)),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (_adults > 1) {
                              setDialogState(() => _adults--);
                            }
                          },
                          icon: const Icon(Icons.remove_circle_outline, color: Color(0xFFD4AF37)),
                        ),
                        Text('$_adults', style: GoogleFonts.dmSans(fontSize: 18, fontWeight: FontWeight.bold)),
                        IconButton(
                          onPressed: () {
                            if (_adults < 10) {
                              setDialogState(() => _adults++);
                            }
                          },
                          icon: const Icon(Icons.add_circle_outline, color: Color(0xFFD4AF37)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {}); // Update main UI
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD4AF37)),
            child: const Text('Done', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFFD4AF37), size: 20),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 2),
            Text(value, style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF0A1A3A))),
          ],
        )
      ],
    );
  }

  Widget _buildHotelCard(String title, String location, String price, String imageUrl) {
    return GestureDetector(
      onTap: () {
        // Extract rating from price string (format: "Rating: 4.5" or "New")
        String rating = "4.5"; // default
        if (price.contains("Rating:")) {
          rating = price.replaceAll("Rating:", "").trim();
        }
        
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HotelDetailsScreen(
              hotelName: title,
              hotelAddress: location,
              hotelImage: imageUrl,
              hotelRating: rating,
            ),
          ),
        );
      },
      child: Container(
        width: 280,
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                child: Image.network(
                  imageUrl,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 16,
                left: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0A1A3A).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "PREMIUM",
                    style: TextStyle(color: Color(0xFFD4AF37), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1),
                  ),
                ),
              ),
              const Positioned(
                top: 16,
                right: 16,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 14,
                  child: Icon(Icons.favorite_border, size: 16, color: Colors.black),
                ),
              )
            ],
          ),
          // Info Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF0A1A3A),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(location, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text(price, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0A1A3A))),
                    const Text(" / night", style: TextStyle(color: Colors.grey, fontSize: 12)),
                    const Spacer(),
                    const Icon(Icons.star, size: 14, color: Color(0xFFD4AF37)),
                    const SizedBox(width: 4),
                    const Text("4.9", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }

  Widget _buildDestinationItem(String title, String imageUrl) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Color(0xFF0A1A3A))),
        ],
      ),
    );
  }
}
