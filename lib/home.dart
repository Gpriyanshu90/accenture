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
                children: const [
                  NavItem(
                      title: "What we do",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  NavItem(
                      title: "What we think",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  NavItem(
                      title: "Who we are",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  NavItem(
                      title: "Careers",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.only(top: 20, right: 20),
            child: Icon(Icons.search, color: Colors.white),
          ),
          const SizedBox(width: 20),
          Padding(
            padding: const EdgeInsets.only(right: 70, top: 20),
            child: Row(
              children: const [
                Icon(Icons.language, color: Colors.white),
                SizedBox(width: 20),
                Text(
                  "United Kingdom",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Icon(Icons.keyboard_arrow_down, color: Colors.white),
              ],
            ),
          ),
          const SizedBox(width: 30),
        ],
      ),

      // ---------------- BODY ---------------- //
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HERO SECTION
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
                            "We help clients prioritize business strategy, technology "
                                "readiness and organizational readiness to get to value faster.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
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

            // CARDS SECTION
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      CardItem(
                          label: "RESEARCH REPORT",
                          title: "Destination net zero 2025",
                          image: "assets/card1.jpg"),
                      CardItem(
                          label: "RESEARCH REPORT",
                          title: "Sovereign AI: From managing risk to accelerating growth",
                          image: "assets/card2.jpg"),
                      CardItem(
                          label: "RESEARCH REPORT",
                          title: "Holiday shopping 2025: Tis the season for smarter spending and renewed confidence",
                          image: "assets/card3.jpg"),
                      CardItem(
                          label: "CASE STUDY",
                          title: "Poste Italiane pivots from postal service to national platform",
                          image: "assets/card4.jpg"),
                    ],
                  ),

                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      CardItem(
                          label: "RESEARCH REPORT",
                          title: "Learning, reinvented: Accelerating human-AI collaboration",
                          image: "assets/card5.jpg"),
                      CardItem(
                          label: "CASE STUDY",
                          title: "Bristol Myers Squibb accelerates drug development with generative AI",
                          image: "assets/card6.jpg"),
                      CardItem(
                          label: "RESEARCH REPORT",
                          title: "4 critical actions to take now to strengthen your cyber defenses",
                          image: "assets/card7.jpg"),
                      CardItem(
                          label: "CASE STUDY",
                          title: " AI and your operating model: Radically new ways of working",
                          image: "assets/card8.jpg"),
                    ],
                  ),
                ],
              ),
            ),

            // QUOTE + 360° VALUE
            const QuoteSection(),

            // BEAUTY SLIDE SECTION
            const SlideSection(),
          ],
        ),
      ),
    );
  }
}

// ---------------- CARD WIDGET ---------------- //
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

// ---------------- NAV ITEM ---------------- //
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
      child: Text(
        title,
        style: style ?? const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}

// ---------------- QUOTE SECTION WIDGET ---------------- //
class QuoteSection extends StatelessWidget {
  const QuoteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 50),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "assets/card9-jpg.webp",
                    fit: BoxFit.cover,
                    height: 500,
                  ),
                ),
              ),
               SizedBox(width: 60),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "“AI is only a technology. The value comes from reinvention "
                          "of how we work, our workforces and the tools we use… "
                          "We are making sure that we are leading the way with our own reinvention.”",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        height: 1.4,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 25),
                    Text(
                      "Julie Sweet, quoted in Fortune, August/September 2025",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Text(
                          "Read more",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.purple,
                          size: 25,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 60),
        Column(
          children: const [
            Text(
              "360° VALUE",
              style: TextStyle(
                color: Colors.white,
                fontSize: 150,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Every day, we embrace change and create value for all our stakeholders\naround the world.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                height: 1.4,
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "See the report",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.purple,
                  size: 25,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 120),
      ],
    );
  }
}

// ---------------- BEAUTY SLIDE SECTION ---------------- //
class SlideSection extends StatelessWidget {
  const SlideSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LEFT IMAGE
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "assets/card10.jpg", // apni image ka naam
                      height: 500,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(width: 80),
                // RIGHT TEXT
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Noli uses AI to find your perfect beauty match",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.only(right: 200),
                        child: Text(
                          "The beauty tech startup is making shopping simpler and smarter "
                              "with a powerful data-driven platform that provides personalized "
                              "beauty recommendations, helping consumers make confident, "
                              "right-for-them product choices.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            height: 1.5,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Text(
                            "Read more",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.purple,
                            size: 25,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 80),
          // BOTTOM CONTROLS
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // PAUSE


                // ARROWS + COUNT
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        shape: BoxShape.rectangle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        iconSize: 25,
                        onPressed: () {
                          print("Button clicked");
                        },
                      ),
                    ),

                    const SizedBox(width: 20),
                    const Text(
                      "1/6",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(width: 20),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        shape: BoxShape.rectangle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward, color: Colors.white),
                        iconSize: 25,
                        onPressed: () {
                          print("Button clicked");
                        },
                      ),
                    ),




                  ],
                ),
              ],
            ),
          ),

          Text('Global recognition and awards', style: TextStyle(fontSize: 100,color: Colors.white,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
