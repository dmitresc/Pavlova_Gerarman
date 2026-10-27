import 'package:flutter/material.dart';

class PavlovaScreen extends StatelessWidget {
  const PavlovaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Mandatory App Bar showing your last name to prevent point deduction
      appBar: AppBar(
        title: const Text(
          'Gerarman',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.pink.shade50,
      ),
      body: Container(
        color: const Color(0xFFFFF5F5), // Soft light pink background
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Local Dessert Image Asset matching your file name
              Image.asset(
                'assets/strawberrypavlova.jpg',
                height: 300,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 300,
                    color: Colors.grey.shade300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [ // Kept const here where it is valid
                        Icon(Icons.broken_image, size: 50, color: Colors.grey),
                        SizedBox(height: 8),
                        Text(
                          'Image not found. Check pubspec.yaml!',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  );
                },
              ),

              // Layout Details Content Section
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title Text
                    const Text(
                      'Strawberry Pavlova',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C2C2C),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),

                    // Description text paragraph
                    const Text(
                      'Pavlova is a meringue-based dessert named after the Russian ballerina Anna Pavlova. Pavlova features a crisp crust and soft, light inside, topped with fruit and whipped cream.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF555555),
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),

                    // Rating Row (3 Filled Stars, 2 Empty Stars, 90 Reviews)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              index < 3 ? Icons.star : Icons.star_border,
                              color: const Color(0xFFFFD700),
                              size: 20,
                            );
                          }),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          '90 Reviews',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF333333),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    // Fixed Icons Layout Metric Matrix (Removed the breaking const keyword)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        InfoColumn(
                          icon: Icons.timer_outlined,
                          label: 'PREP',
                          value: '25 min',
                        ),
                        InfoColumn(
                          icon: Icons.restaurant_menu_outlined,
                          label: 'COOK',
                          value: '1 hr',
                        ),
                        InfoColumn(
                          icon: Icons.people_outline,
                          label: 'FEEDS',
                          value: '4-6 hrs',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Reusable custom column element layout for the metrics grid section
class InfoColumn extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoColumn({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: const Color(0xFFD4AF37),
          size: 28,
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w900,
            color: Color(0xFF444444),
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF666666),
          ),
        ),
      ],
    );
  }
}
