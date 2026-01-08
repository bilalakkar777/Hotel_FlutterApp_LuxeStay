import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HotelDetailsScreen extends StatefulWidget {
  final String hotelName;
  final String hotelAddress;
  final String hotelImage;
  final String hotelRating;
  
  const HotelDetailsScreen({
    super.key,
    required this.hotelName,
    required this.hotelAddress,
    required this.hotelImage,
    required this.hotelRating,
  });

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  // Color Constants (matching the theme)
  final Color _navyBlue = const Color(0xFF0A1A3A);
  final Color _goldAccent = const Color(0xFFD4AF37);
  final Color _lightGreyTxt = Colors.grey.shade600;

  bool _isDescriptionExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F4), // Warm off-white background
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- 1. Immersive Header Image Stack ---
            Stack(
              children: [
                Image.network(
                  widget.hotelImage,
                  height: 350,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 350,
                      color: Colors.grey[300],
                      child: const Icon(Icons.hotel, size: 100, color: Colors.grey),
                    );
                  },
                ),
                // Gradient overlay for header icons visibility
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                // Header Icons (Back & Favorite)
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildHeaderIcon(
                          Icons.arrow_back_ios_new,
                          onTap: () => Navigator.pop(context),
                        ),
                        _buildHeaderIcon(
                          Icons.favorite_border,
                          onTap: () {}, // Toggle favorite action
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // --- 2. Main Content Container (Overlapping) ---
            Transform.translate(
              offset: const Offset(0, -40), // Move up to overlap image
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title and Rating
                      Text(
                        widget.hotelName,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: _navyBlue,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Row(
                            children: List.generate(5, (index) => Icon(Icons.star, color: _goldAccent, size: 18)),
                          ),
                          const SizedBox(width: 8),
                          Text(widget.hotelRating, style: TextStyle(fontWeight: FontWeight.bold, color: _navyBlue)),
                          const SizedBox(width: 4),
                          Text('(${(double.parse(widget.hotelRating) * 100).toInt()} reviews)', style: TextStyle(color: _lightGreyTxt)),
                        ],
                      ),

                      const SizedBox(height: 16),
                      
                      // Location Row
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined, color: _goldAccent, size: 20),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(widget.hotelAddress, style: TextStyle(color: _lightGreyTxt, fontSize: 15)),
                          ),
                        ],
                      ),

                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 24.0),
                        child: Divider(height: 1, color: Color(0xFFEEEEEE)),
                      ),

                      // --- Amenities Section ---
                      Text('Amenities', style: _sectionTitleStyle()),
                      const SizedBox(height: 16),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildAmenityChip(Icons.pool, "Pool"),
                            _buildAmenityChip(Icons.spa_outlined, "Spa"),
                            _buildAmenityChip(Icons.fitness_center, "Gym"),
                            _buildAmenityChip(Icons.restaurant, "Dining"),
                            _buildAmenityChip(Icons.wifi, "Free Wifi"),
                          ],
                        ),
                      ),

                      const SizedBox(height: 32),

                      // --- Description Section ---
                      Text('About the Hotel', style: _sectionTitleStyle()),
                      const SizedBox(height: 12),
                      Text(
                        "Experience unparalleled luxury at ${widget.hotelName}. This exceptional property offers world-class amenities, exquisite dining, and impeccable service. Each room is meticulously designed to provide the utmost comfort and style for discerning travelers. Enjoy breathtaking views, a world-class spa, and an unforgettable stay in one of the finest hotels.",
                        maxLines: _isDescriptionExpanded ? null : 3,
                        overflow: _isDescriptionExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                        style: GoogleFonts.dmSans(
                          fontSize: 15,
                          color: _lightGreyTxt,
                          height: 1.5,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isDescriptionExpanded = !_isDescriptionExpanded;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            _isDescriptionExpanded ? "Read Less" : "Read More",
                            style: TextStyle(color: _goldAccent, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),

                      // --- Location Map Placeholder ---
                      Text('Location', style: _sectionTitleStyle()),
                      const SizedBox(height: 16),
                      Container(
                        height: 180,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            // Placeholder for a map view
                            image: NetworkImage('https://i.imgur.com/K3X5qQZ.png'), 
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: ElevatedButton.icon(
                             onPressed: (){},
                             style: ElevatedButton.styleFrom(
                               backgroundColor: Colors.white,
                               foregroundColor: _navyBlue,
                               shape: const StadiumBorder(),
                             ),
                             icon: const Icon(Icons.map_outlined),
                             label: const Text("View on Map")
                          ),
                        ),
                      ),
                      // Extra spacing so content doesn't get stuck behind bottom bar
                      const SizedBox(height: 80), 
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      
      // --- Sticky Footer (CTA) ---
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
             BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(0, -5),
              ),
          ]
        ),
        child: SafeArea(
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$${(double.parse(widget.hotelRating) * 180).toInt()}',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: _navyBlue,
                    ),
                  ),
                  Text(
                    'per night',
                    style: TextStyle(color: _lightGreyTxt, fontSize: 12),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                height: 56,
                width: 180,
                child: ElevatedButton(
                  onPressed: () {
                    // Action to go to room selection screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _goldAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Select Room',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Helper for common section title styles
  TextStyle _sectionTitleStyle() {
    return GoogleFonts.playfairDisplay(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: _navyBlue,
    );
  }

  // Helper for rounded header icons
  Widget _buildHeaderIcon(IconData icon, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2), // Semi-transparent
          shape: BoxShape.circle,
           border: Border.all(color: Colors.white.withOpacity(0.5), width: 1),
        ),
        child: Icon(icon, color: Colors.white, size: 22),
      ),
    );
  }

  // Helper for amenity chips
  Widget _buildAmenityChip(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _navyBlue.withOpacity(0.05),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: _navyBlue, size: 26),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: _navyBlue,
              fontWeight: FontWeight.w500,
              fontSize: 13
            ),
          ),
        ],
      ),
    );
  }
}
