
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  static const green = Color(0xFF174A36);
  static const darkGreen = Color(0xFF103326);
  static const gold = Color(0xFFD4AF37);
  static const background = Color(0xFFF5F7F4);

  final List<Map<String, dynamic>> features = [
    {
      'title': 'Students',
      'subtitle': 'Manage students',
      'icon': Icons.school_rounded,
      'color': Color(0xFF247B55),
    },
    {
      'title': 'Teachers',
      'subtitle': 'Manage teachers',
      'icon': Icons.person_rounded,
      'color': Color(0xFF3977C5),
    },
    {
      'title': 'Classes',
      'subtitle': 'Class timetable',
      'icon': Icons.menu_book_rounded,
      'color': Color(0xFF9A6AC5),
    },
    {
      'title': 'Attendance',
      'subtitle': 'Daily attendance',
      'icon': Icons.fact_check_rounded,
      'color': Color(0xFFE59B36),
    },
    {
      'title': 'Examinations',
      'subtitle': 'Exam schedule',
      'icon': Icons.assignment_rounded,
      'color': Color(0xFFDE6B65),
    },
    {
      'title': 'Results',
      'subtitle': 'Student results',
      'icon': Icons.bar_chart_rounded,
      'color': Color(0xFF299B9B),
    },
  ];

  void openFeature(String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title screen will open here.'),
        behavior: SnackBarBehavior.floating,
      ),
    );

    // Yahan baad mein har feature ki apni screen open karein.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      body: SafeArea(
        child: IndexedStack(
          index: selectedIndex,
          children: [
            buildDashboard(),
            buildSimplePage('Students', Icons.school_rounded),
            buildSimplePage('Classes', Icons.menu_book_rounded),
            buildSimplePage('Profile', Icons.person_rounded),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 15,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: green,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school_rounded),
              label: 'Students',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded),
              label: 'Classes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDashboard() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top bar
          Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: green,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.mosque_rounded,
                  color: gold,
                  size: 31,
                ),
              ),

              const SizedBox(width: 12),

              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'جامعہ عربیہ عباسیہ',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: green,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Jamia Arabia Abbasia',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),

              IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No new notifications'),
                    ),
                  );
                },
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: green,
                ),
                icon: const Icon(Icons.notifications_none_rounded),
              ),
            ],
          ),

          const SizedBox(height: 28),

          // Welcome section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [green, darkGreen],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: green.withValues(alpha: 0.18),
                  blurRadius: 15,
                  offset: const Offset(0, 7),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -8,
                  top: -10,
                  child: Icon(
                    Icons.mosque_rounded,
                    size: 105,
                    color: Colors.white.withValues(alpha: 0.08),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ASSALAM-O-ALAIKUM 👋',
                      style: TextStyle(
                        color: gold,
                        fontSize: 11,
                        letterSpacing: 1.1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'Welcome to\nYour Dashboard',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        height: 1.3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'Manage your madrasa activities in one place.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),

                    const SizedBox(height: 18),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: gold,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.auto_stories_rounded,
                            size: 17,
                            color: darkGreen,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Ilm-o-Taleem',
                            style: TextStyle(
                              color: darkGreen,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // Statistics heading
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Overview',
                style: TextStyle(
                  color: Color(0xFF202B24),
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Academic Stats',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          // Statistics cards
          Row(
            children: [
              Expanded(
                child: statCard(
                  'Total Students',
                  '250',
                  Icons.groups_rounded,
                  const Color(0xFF247B55),
                  const Color(0xFFE4F3E9),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: statCard(
                  'Teachers',
                  '18',
                  Icons.co_present_rounded,
                  const Color(0xFF3977C5),
                  const Color(0xFFE7EFFB),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: statCard(
                  'Classes',
                  '12',
                  Icons.menu_book_rounded,
                  const Color(0xFF9A6AC5),
                  const Color(0xFFF1E8FA),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: statCard(
                  'Attendance',
                  '92%',
                  Icons.fact_check_rounded,
                  const Color(0xFFE59B36),
                  const Color(0xFFFFF0D9),
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),

          // Quick access
          const Text(
            'Quick Access',
            style: TextStyle(
              color: Color(0xFF202B24),
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            'Choose a section to manage',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 16),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: features.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              mainAxisExtent: 145,
            ),
            itemBuilder: (context, index) {
              final item = features[index];

              return InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => openFeature(item['title'] as String),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFFEAEEE9),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: (item['color'] as Color)
                              .withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Icon(
                          item['icon'] as IconData,
                          color: item['color'] as Color,
                          size: 25,
                        ),
                      ),

                      const Spacer(),

                      Text(
                        item['title'] as String,
                        style: const TextStyle(
                          color: Color(0xFF202B24),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        item['subtitle'] as String,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 24),

          // Bottom information banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(17),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF7DF),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: const Color(0xFFF0E2B7),
              ),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.lightbulb_outline_rounded,
                  color: Color(0xFF94701C),
                  size: 28,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Daily Reminder',
                        style: TextStyle(
                          color: Color(0xFF715517),
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Knowledge is a path to growth. Keep learning every day.',
                        style: TextStyle(
                          color: Color(0xFF806D45),
                          fontSize: 11,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget statCard(
    String title,
    String value,
    IconData icon,
    Color color,
    Color lightColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: const Color(0xFFEAEEE9),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 39,
            height: 39,
            decoration: BoxDecoration(
              color: lightColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: color,
              size: 22,
            ),
          ),

          const SizedBox(height: 15),

          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF202B24),
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSimplePage(String title, IconData icon) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 65, color: green),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: green,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Your section will appear here.',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
