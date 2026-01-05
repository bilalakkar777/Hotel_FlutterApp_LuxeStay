import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// --- Constants (Keeping consistent with previous files) ---
const Color kNavyBlue = Color(0xFF0A1A3A);
const Color kGold = Color(0xFFD4AF37);
const Color kWarmWhite = Color(0xFFF8F7F4);
const Color kGreyText = Color(0xFF757575);

class SearchResultsPage extends StatefulWidget {
  const SearchResultsPage({super.key});

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  // Filter state for demo purposes
  int _selectedFilterIndex = 0;
  final List<String> _filters = ["All", "5 Stars", "Price: Low to High", "Pool", "Spa"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWarmWhite,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              children: [
                // 1. Search Header
                _buildSearchHeader(context),

                // 2. Filter Bar
                _buildFilterBar(),

                // 3. Hotel List
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 100), // Bottom padding for FAB
                    children: [
                      // Result 1
                      _buildResultCard(
                        title: "The Ritz-Carlton, Kyoto",
                        location: "Nakagyo Ward, Kyoto",
                        price: "\$850",
                        rating: "4.9",
                        reviews: "320",
                        imageUrl: "https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
                        isPopular: true,
                      ),
                      // Result 2
                      _buildResultCard(
                        title: "Four Seasons Hotel",
                        location: "Higashiyama, Kyoto",
                        price: "\$1,150",
                        rating: "5.0",
                        reviews: "128",
                        imageUrl: "https://images.unsplash.com/photo-1571896349842-6e53ce41e8f2?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
                      ),
                      // Result 3
                      _buildResultCard(
                        title: "Aman Kyoto",
                        location: "Kita Ward, Kyoto",
                        price: "\$1,400",
                        rating: "4.8",
                        reviews: "95",
                        imageUrl: "https://images.unsplash.com/photo-1618773928121-c32242e63f39?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
                      ),
                       // Result 4
                      _buildResultCard(
                        title: "Hotel The Mitsui",
                        location: "Nakagyo Ward, Kyoto",
                        price: "\$720",
                        rating: "4.7",
                        reviews: "210",
                        imageUrl: "https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // 4. Floating Map Button
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Center(
                child: FloatingActionButton.extended(
                  onPressed: () {},
                  backgroundColor: kNavyBlue,
                  icon: const Icon(Icons.map_outlined, color: Colors.white),
                  label: const Text(
                    "Map View",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  elevation: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          // Back Button
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
                ],
              ),
              child: const Icon(Icons.arrow_back_ios_new, size: 20, color: kNavyBlue),
            ),
          ),
          const SizedBox(width: 15),
          // Search Summary Bar
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: kGold, size: 20),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Kyoto, Japan",
                        style: TextStyle(fontWeight: FontWeight.bold, color: kNavyBlue, fontSize: 14),
                      ),
                      Text(
                        "Oct 12 - 16 • 2 Guests",
                        style: TextStyle(color: Colors.grey[500], fontSize: 11),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterBar() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _filters.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedFilterIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedFilterIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? kNavyBlue : Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: isSelected ? kNavyBlue : Colors.grey.shade300,
                ),
                boxShadow: isSelected
                    ? [BoxShadow(color: kNavyBlue.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))]
                    : [],
              ),
              child: Text(
                _filters[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : kGreyText,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 13,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildResultCard({
    required String title,
    required String location,
    required String price,
    required String rating,
    required String reviews,
    required String imageUrl,
    bool isPopular = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
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
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Favorite Icon
              const Positioned(
                top: 16,
                right: 16,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 16,
                  child: Icon(Icons.favorite_border, size: 18, color: kNavyBlue),
                ),
              ),
              // "Popular" Badge
              if (isPopular)
                Positioned(
                  top: 16,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: kNavyBlue.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "POPULAR",
                      style: TextStyle(color: kGold, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 0.5),
                    ),
                  ),
                ),
            ],
          ),

          // Details Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kNavyBlue,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Rating
                    Row(
                      children: [
                        const Icon(Icons.star, size: 16, color: kGold),
                        const SizedBox(width: 4),
                        Text(rating, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                
                // Location
                Row(
                  children: [
                    Icon(Icons.location_on_outlined, size: 14, color: Colors.grey[500]),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                  ],
                ),
                
                const SizedBox(height: 16),
                const Divider(height: 1, color: Color(0xFFEEEEEE)),
                const SizedBox(height: 12),

                // Price and CTA
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: price,
                            style: const TextStyle(
                              color: kNavyBlue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: " / night",
                            style: TextStyle(color: Colors.grey[500], fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "View Details",
                      style: TextStyle(
                        color: kNavyBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
