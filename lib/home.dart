import 'package:flutter/material.dart';

class pagelayout extends StatefulWidget {
  const pagelayout({super.key, required String title});

  @override
  State<pagelayout> createState() => _pagelayoutState();
}

class _pagelayoutState extends State<pagelayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleSpacing: 0,

        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 70, top: 20),
              child: Container(
                height: 70,
                width: 90,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Accenture-Emblem.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 500),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  NavItem(title: "What we do", style: TextStyle(fontSize: 20, color: Colors.white)),
                  NavItem(title: "What we think", style: TextStyle(fontSize: 20, color: Colors.white)),
                  NavItem(title: "Who we are", style: TextStyle(fontSize: 20, color: Colors.white)),
                  NavItem(title: "Careers", style: TextStyle(fontSize: 20, color: Colors.white)),
                ],
              ),
            )

          ],
        ),

        actions: [
           Padding(
             padding: const EdgeInsets.only(top: 20,right: 20),
             child: Icon(Icons.search, color: Colors.white),
           ),
           SizedBox(width: 20),

          Padding(
            padding: const EdgeInsets.only(right: 70, top: 20),
            child: Row(
              children: const [
                Icon(Icons.language, color: Colors.white),
                SizedBox(width: 20),
                Text("United Kingdom",
                    style: TextStyle(fontSize: 20 , color: Colors.white)),
                Icon(Icons.keyboard_arrow_down, color: Colors.white),
              ],
            ),
          ),
          const SizedBox(width: 30),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 30, left: 90),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "TOGETHER WE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 100,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),

                        Padding(
                          padding: EdgeInsets.only(left: 500),
                          child: Row(
                            children: [
                              Text(
                                "REIN",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 100,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                ">",
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 150,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "ENTED",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 100,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, top: 80, right: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 40,
                            height: 4,
                            color: Colors.purple,
                          ),
                          const SizedBox(height: 15),

                          const Text(
                            "Scaling AI",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 25),

                          const Text(
                            "We help clients prioritize business strategy, "
                                "technology readiness and organizational readiness "
                                "to get to value faster.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 25),

                          Row(
                            children: [
                              const Text(
                                "See what we do",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(width: 8),

                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  color: Colors.purple,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 90),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CardItem(
                    label: "RESEARCH REPORT",
                    title: "Destination net zero 2025",
                    image: "assets/card1.jpg",
                  ),
                  CardItem(
                    label: "RESEARCH REPORT",
                    title: "Sovereign AI: From managing risk to accelerating growth",
                    image: "assets/card2.jpg",
                  ),
                  CardItem(
                    label: "RESEARCH REPORT",
                    title:
                    "Holiday Shopping 2025: Tis the season for smarter spending and renewed confidence",
                    image: "assets/card3.jpg",
                  ),
                  CardItem(
                    label: "CASE STUDY",
                    title:
                    "Poste Italiane pivots from postal service to national platform",
                    image: "assets/card4.jpg",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String label;
  final String title;
  final String image;

  const CardItem({
    super.key,
    required this.label,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String title;
  final TextStyle? style;

  const NavItem({
    super.key,
    required this.title,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          Text(
            title,
            style: style ?? const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const Icon(Icons.keyboard_arrow_down, color: Colors.white),
        ],
      ),
    );
  }
}

