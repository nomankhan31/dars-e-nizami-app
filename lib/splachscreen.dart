
import 'package:flutter/material.dart';
import 'package:darsenizami/login.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Login screen par 3 seconds baad navigate karein
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox.expand(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Center image with golden border
              Container(
                width: 288,
                height: 288,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFFFD700),
                    width: 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amber.withValues(alpha: 0.15),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.network(
                    'https://scontent.fkhi22-1.fna.fbcdn.net/v/t39.30808-6/327450240_910903456731499_6978233048533059499_n.jpg?stp=dst-jpg_tt6&cstp=mx622x627&ctp=s622x627&_nc_cat=104&_nc_map=urlgen_bucketless&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=eYjTC988W5IQ7kNvwHh5yst&_nc_oc=AdriuOnRoH0SSQ4lrZ25xZal-RcIlOgK2nYlw2-e9hRs7Nx_EokcCakmdF3SiQIJllU&_nc_zt=23&_nc_ht=scontent.fkhi22-1.fna&_nc_gid=CoLZ1Rf9smlCrRFAoW1Kug&_nc_ss=7a289&oh=00_AQPIS-xJHpvIHfNMAyvwyJQFHHaSTzmEfLprDl0ikTcMZA&oe=6AD41EA0',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const ColoredBox(
                        color: Colors.black,
                        child: Icon(
                          Icons.mosque,
                          color: Color(0xFFFFD700),
                          size: 100,
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Urdu title
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'جامعہ عربیہ عباسیہ',
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFD700),
                    shadows: [
                      Shadow(
                        color: Colors.amber,
                        blurRadius: 8,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                '(جامع مسجد شہزادہ)',
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 35),

              const SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Color(0xFFFFD700),
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'Loading...',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
