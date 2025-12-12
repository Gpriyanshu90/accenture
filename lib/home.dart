import 'package:accenture/reponsive.dart';
import 'package:flutter/material.dart';

const TextStyle menuText = TextStyle(
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.w400,
);

class PageLayout extends StatefulWidget {
  const PageLayout({super.key, required this.title});
  final String title;

  @override
  State<PageLayout> createState() => _PageLayoutState();
}

class _PageLayoutState extends State<PageLayout> {
  final ScrollController newsScrollController = ScrollController();
  final ScrollController mainScrollController = ScrollController();

  bool showMegaMenu = false;
  String activeMenu = "";

  Widget hoverText(String title) {
    bool isHover = false;

    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) => setState(() => isHover = true),
          onExit: (_) => setState(() => isHover = false),

          child: AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 150),
            style: TextStyle(
              color: isHover ? Colors.purple : Colors.white,
              fontSize: 20,
              fontWeight: isHover ? FontWeight.w600 : FontWeight.w400,
            ),
            child: Text(title),
          ),
        );
      },
    );
  }

  // int selectedIndex = 0;
  //
  // List<String> newsList = [
  //   "Accenture Launches “Physical AI \nOrchestrator” to Help Manufacturers Build \nSoftware-Defined Facilities",
  //   "Accenture Helps Organizations Advance \nAgentic AI with Gemini Enterprise",
  //   "Accenture to Announce First-Quarter Fiscal 2026 Results",
  //   "OpenAI and Accenture Accelerate Enterprise \nReinvention with Advanced AI",
  //   "Accenture Reports Fourth-Quarter and Full-\nYear Fiscal \n2025 Results",
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: buildAppbar(context),

      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if (showMegaMenu) {
            setState(() {
              showMegaMenu = false;
              activeMenu = "";
            });
          }
        },

        child: Stack(
          children: [
            // Main Page Content
            RawScrollbar(
              controller: mainScrollController,
              thumbVisibility: true, // Always visible
              trackVisibility: true, // Show background track
              radius: Radius.circular(10),
              thickness: 8, // Thin like website
              thumbColor: Colors.white70, // White thumb
              trackColor: Colors.white10, // Light grey track
              child: SingleChildScrollView(
                controller: mainScrollController,
                child: Column(
                  children: [
                    bannerSection(context),
                    SizedBox(height: 60),

                    cardsSection(context),
                    SizedBox(height: 80),

                    QuoteSection(),
                    SlideSection(),
                    taxtmsg(),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),

            // DROPDOWN OVERLAY (does not push content)
            if (showMegaMenu)
              Positioned(
                top: 0, // Just below appbar
                left: 0,
                right: 0,
                child: _buildActiveMenu(),
              ),
          ],
        ),
      ),
    );
  }

  //  yeh dropdown screen fix code together kiy

  Widget _buildActiveMenu() {
    switch (activeMenu) {
      case "what":
        return buildMegaMenu();
      case "who":
        return buildWhoWeAreMenu();
      case "careers":
        return buildCareersMenu();
      default:
        return SizedBox.shrink();
    }
  }

  // ---------APPBAR
  PreferredSizeWidget buildAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      titleSpacing: 0,
      toolbarHeight: 90,
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 10),
            child: SizedBox(
              height: 60,
              width: 90,
              child: Image.asset(
                'assets/Accenture-Emblem.png',
                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(width: 40),

          if (!Responsive.isMobile(context))
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NavItem(
                    title: "What we do ▼",
                    hoverText: "What we do ▼",
                    onTap: () {
                      setState(() {
                        activeMenu = "what";
                        showMegaMenu = !showMegaMenu;
                      });
                    },
                  ),

                  NavItem(
                    title: "What we think",
                    hoverText: "What we think",
                    onTap: () {}, // empty tap — only hover works
                  ),

                  NavItem(
                    title: "Who we are ▼",
                    hoverText: "Who we are ▼",
                    onTap: () {
                      setState(() {
                        activeMenu = "who";
                        showMegaMenu = !showMegaMenu;
                      });
                    },
                  ),

                  NavItem(
                    title: "Careers ▼",
                    hoverText: "Careers ▼",
                    onTap: () {
                      setState(() {
                        activeMenu = "careers";
                        showMegaMenu = !showMegaMenu;
                      });
                    },
                  ),
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

        if (Responsive.isDesktop(context))
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 50),
            child: Row(
              children: const [
                Icon(Icons.language, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  "United Kingdom",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                Icon(Icons.keyboard_arrow_down, color: Colors.white),
              ],
            ),
          ),
      ],
    );
  }

  // ---- TEXT MESSAGE
  Widget taxtmsg() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 150),

      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Accenture news",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 100),

                  // Text(
                  //   "october 28, 2025",
                  //   style: TextStyle(color: Colors.white, fontSize: 18),
                  // ),
                  SizedBox(height: 10),

                  // HORIZONTAL ROW  5 text
                  SingleChildScrollView(
                    controller: newsScrollController,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        newsTextItem(
                          "Accenture Launches “Physical AI \nOrchestrator” to Help Manufacturers Build \nSoftware-Defined Facilities",
                        ),

                        newsTextItem(
                          "Accenture Helps Organizations Advance \nAgentic AI with Gemini Enterprise",
                        ),

                        newsTextItem(
                          "Accenture to Announce First-Quarter \nFiscal 2026 Results",
                        ),

                        newsTextItem(
                          "openAI and Accenture Accelerate Enterprise \nReinvention with Advanced AI",
                          fontSize: 50,
                        ),

                        newsTextItem(
                          "Accenture Reports Fourth-Quarter and Full-\nYear Fiscal 2025 Results",
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 40),

                  // L&R SCROLL BUTTONS
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Colors.grey),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            newsScrollController.animateTo(
                              newsScrollController.offset - 700,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeOut,
                            );
                          },
                        ),
                      ),

                      SizedBox(width: 30),

                      Container(
                        decoration: BoxDecoration(color: Colors.grey),
                        child: IconButton(
                          icon: Icon(Icons.arrow_forward, color: Colors.white),
                          onPressed: () {
                            newsScrollController.animateTo(
                              newsScrollController.offset + 900,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeOut,
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 280),

                  Text(
                    "Let there be change",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 150),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // LEFT FOOTER
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          hoverText("Preference Center"),
                          SizedBox(height: 20),

                          hoverText("Careers"),
                          SizedBox(height: 20),

                          hoverText("About Us"),
                          SizedBox(height: 20),

                          hoverText("Contact Us"),
                          SizedBox(height: 20),

                          hoverText("Locations"),
                          SizedBox(height: 20),

                          hoverText("Sitemap"),
                        ],
                      ),

                      SizedBox(width: 120),

                      // RIGHT FOOTER
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          hoverText("Privacy Statement"),
                          SizedBox(height: 20),

                          hoverText("Terms & Conditions"),
                          SizedBox(height: 20),

                          hoverText("Cookie Policy/Settings"),
                          SizedBox(height: 20),

                          hoverText("Accessibility Statement"),
                          SizedBox(height: 20),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 80),

                  Text(
                    "© 2025 Accenture. All Rights Reserved.",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //dropdown text item in what we do
  Widget buildMegaMenu() {
    return Container(
      width: double.infinity,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -----What we do
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text(
                      "What we do",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_drop_up, color: Colors.purple, size: 30),
                  ],
                ),
                SizedBox(height: 30),

                Text(
                  "Capabilities",
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                ),
                SizedBox(height: 20),

                Wrap(
                  spacing: 40,
                  runSpacing: 15,
                  children: [
                    hoverText("Cloud"),
                    hoverText("Customer Service"),
                    hoverText("Cybersecurity"),
                    hoverText("Data and Artificial Intelligence"),
                    hoverText("Digital Engineering and Manufacturing"),
                    hoverText("Ecosystem Partners"),
                    hoverText("Emerging Technology"),
                    hoverText("Finance and Risk Management"),
                    hoverText("Infrastructure and Capital Projects"),
                    hoverText("Learning"),
                    hoverText("Managed Services"),
                    hoverText("Marketing and Experience"),
                    hoverText("Metaverse"),
                    hoverText("Sales and Commerce"),
                    hoverText("Strategy"),
                    hoverText("Supply Chain"),
                    hoverText("Sustainability"),
                    hoverText("Talent and Organization"),
                    hoverText("Technology Transformation"),
                  ],
                ),
              ],
            ),
          ),

          // What we do
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 70),

                Text(
                  "Industries",
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                ),
                SizedBox(height: 20),

                Wrap(
                  spacing: 40,
                  runSpacing: 15,
                  children: [
                    hoverText("Aerospace and Defense"),
                    hoverText("Automotive"),
                    hoverText("Banking"),
                    hoverText("Capital Markets"),
                    hoverText("Chemicals"),
                    hoverText("Communications and Media"),
                    hoverText("Consumer Goods and Services"),
                    hoverText("Energy"),
                    hoverText("Health"),
                    hoverText("High Tech"),
                    hoverText("Industrial"),
                    hoverText("Insurance"),
                    hoverText("Life Sciences"),
                    hoverText("Natural Resources"),
                    hoverText("Public Service"),
                    hoverText("Private Equity"),
                    hoverText("Retail"),
                    hoverText("Software and Platforms"),
                    hoverText("Travel"),
                    hoverText("Utilities"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Who we are
  Widget buildWhoWeAreMenu() {
    return Container(
      width: double.infinity,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 50),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // APP BAR WHO TOP TITLE -----------------------------------------
          Row(
            children: const [
              Text(
                "About Accenture",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Icon(Icons.arrow_right_alt, color: Colors.purple, size: 30),
            ],
          ),

          SizedBox(height: 40),

          // 3 COLUMNS
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // COLUMN 1
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Our organization",
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                    SizedBox(height: 20),

                    hoverText("Awards and Recognition"),
                    hoverText("Corporate Sustainability"),
                    hoverText("Industry Analyst Recognition"),
                    hoverText("Leaders"),
                    hoverText("Locations"),
                    hoverText("360° Value Report"),
                  ],
                ),
              ),

              SizedBox(width: 100),

              // COLUMN 2
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Media & Investors",
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                    SizedBox(height: 20),

                    hoverText("Media Relations"),
                    hoverText("Investor Relations"),
                    hoverText("Board of Directors"),
                  ],
                ),
              ),

              SizedBox(width: 100),

              // COLUMN 3
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "How we serve",
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                    SizedBox(height: 20),

                    hoverText("Strategy and Consulting"),
                    hoverText("Technology"),
                    hoverText("Operations"),
                    hoverText("Industry X"),
                    hoverText("Song"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // career
  Widget buildCareersMenu() {
    return Container(
      width: double.infinity,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 50),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TOP TITLE -----------------------------------------
          Row(
            children: const [
              Text(
                "Careers homepage",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Icon(Icons.arrow_right_alt, color: Colors.purple, size: 30),
            ],
          ),

          SizedBox(height: 40),

          // CONTENT: 3 COLUMNS
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // COLUMN 1 : Find a job
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Find a job",
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                    SizedBox(height: 20),

                    hoverText("Search for jobs"),
                    hoverText("Career areas"),
                  ],
                ),
              ),

              SizedBox(width: 100),

              // COLUMN 2 :
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Life at Accenture",
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                    SizedBox(height: 20),

                    hoverText("Working here"),
                    hoverText("Benefits"),
                    hoverText("Work environment"),
                    hoverText("Careers blog"),
                  ],
                ),
              ),

              SizedBox(width: 100),

              // COLUMN 3 :
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "How we hire",
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                    SizedBox(height: 20),

                    hoverText("Using AI"),
                    hoverText("Hiring journey"),
                    hoverText("Pro tips"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper widget for news text   size level increase & decrease
  Widget newsTextItem(String text, {double fontSize = 40}) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: 200),
      ],
    );
  }
}

// --------ARROW BUTTON BOX
// Widget _arrowBox(IconData icon) {
//   return Container(
//     height: 48,
//     width: 48,
//     decoration: BoxDecoration(
//       color: Colors.grey.shade900,
//       borderRadius: BorderRadius.circular(4),
//     ),
//     child: Icon(icon, color: Colors.white, size: 28),
//   );
// }

//distance maintain
// class FooterLink extends StatelessWidget {
//   final String text;
//   const FooterLink(this.text, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Text(
//         text,
//         style: const TextStyle(
//           color: Colors.white,
//           fontSize: 20,
//         ),
//       ),
//     );
//   }
// }

// ------ BANNER
//Mobile /tablet /desktop

Widget bannerSection(BuildContext context) {
  // ---------------- MOBILE ----------------
  // if (Responsive.isMobile(context)) {
  //   return Padding(
  //     padding: const EdgeInsets.all(20),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text(
  //           "TOGETHER WE",
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontSize: 40,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //
  //         const SizedBox(height: 10),
  //
  //         Row(
  //           children: const [
  //             Text(
  //               "REIN",
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 55,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             SizedBox(width: 5),
  //             Text(
  //               ">",
  //               style: TextStyle(
  //                 color: Colors.purple,
  //                 fontSize: 80,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             SizedBox(width: 5),
  //             Text(
  //               "ENTED",
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 55,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ],
  //         ),
  //
  //         const SizedBox(height: 25),
  //         rightSideText(),
  //       ],
  //     ),
  //   );
  // }
  //
  // // ---------------- TABLET ----------------
  // if (Responsive.isTablet(context)) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text(
  //           "TOGETHER WE",
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontSize: 70,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //
  //         const SizedBox(height: 20),
  //
  //         Row(
  //           children: const [
  //             Text(
  //               "REIN",
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 80,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             SizedBox(width: 5),
  //             Text(
  //               ">",
  //               style: TextStyle(
  //                 color: Colors.purple,
  //                 fontSize: 120,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             SizedBox(width: 5),
  //             Text(
  //               "ENTED",
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 80,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ],
  //         ),
  //
  //         const SizedBox(height: 40),
  //         rightSideText(),
  //       ],
  //     ),
  //   );
  // }

  // ---------------- DESKTOP ----------------
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 50),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // LEFT SIDE LARGE TEXT
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "TOGETHER WE",
                style: TextStyle(
                  fontSize: 100,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // REIN>ENTED
              Align(
                alignment: Alignment.centerLeft,
                child: Transform.translate(
                  offset: Offset(
                    400,
                    0,
                  ), // Shift slightly right to match design
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.scaleDown,
                    child: Row(
                      children: const [
                        Text(
                          "REIN",
                          style: TextStyle(
                            fontSize: 100,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ">",
                          style: TextStyle(
                            fontSize: 120,
                            color: Color(0xFF6F00B3),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "ENTED",
                          style: TextStyle(
                            fontSize: 90,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(width: 20),

        // RIGHT SIDE – NO TOP PADDING
        Expanded(
          child: Align(alignment: Alignment.topLeft, child: rightSideText()),
        ),
      ],
    ),
  );
}

// top screen scale text in widget

Widget rightSideText() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(top: 60, right: 90),
        child: Container(width: 40, height: 4, color: Color(0xFF6F00B3)),
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
      const SizedBox(height: 20),
      const Text(
        "We help clients prioritize business strategy, technology readiness and organizational readiness "
        "to get to value faster.",
        style: TextStyle(color: Colors.white, fontSize: 22, height: 1.4),
      ),

      const SizedBox(height: 25),

      Row(
        children: [
          const Text(
            "See what we do",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(width: 10),

          Container(
            decoration: BoxDecoration(
              color: Color(0xFF6F00B3),
              shape: BoxShape.rectangle,
            ),
            child: IconButton(
              icon: Icon(Icons.chevron_right, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
    ],
  );
}

// -------- CARDS
//image 8

Widget cardsSection(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(top: 10),
    child: Wrap(
      spacing: 90,
      runSpacing: 30,
      alignment: WrapAlignment.spaceEvenly,
      children: [
        CardItem(
          label: "RESEARCH REPORT",
          title:
              "Holiday Shopping 2025: Tis the season for smarter spending and renewed confidence",
          description:
              "Holiday shoppers, facing decision stress and high prices, "
                  "are seeking value combined with experience, convenience and connection. "
                  "Many are turning to Gen AI for inspiration, product comparisons and smarter shortlists.",
          image: "assets/card1.jpg",
        ),

        CardItem(
          label: "RESEARCH REPORT",
          title: "Destination net zero 2025",
          description:
              "How leading companies are scaling decarbonization that delivers business value—and why that’s the key to lasting impact.",
          image: "assets/card2.jpg",
        ),
        CardItem(
          label: "RESEARCH REPORT",
          title: "Learning, reinvented: Accelerating human-AI collaboration",
          description:
              "Humans and AI must learn and adapt together through continuous co-learning. "
                  "Yet only 11% of organizations are currently equipped to do so effectively, "
                  "creating an urgent gap and a significant opportunity.",
          image: "assets/card3.jpg",
        ),
        CardItem(
          label: "CASE STUDY",
          title: "AI and your operating model: Radically new ways of working ",
          description:
              "AI is reshaping markets as  moves to companies with Value Leader DNA—six behaviors that help them monetize smarter, "
                  "innovate faster and build durable, future-ready growth.",
          image: "assets/card4.jpg",
        ),
        //$27T
        CardItem(
          label: "RESEARCH REPORT",
          title: "Sovereign AI: From managing risk to accelerating growth ",
          description:
              "Sovereign AI isn’t just a control play—it’s a game-changer for global competitiveness and cultural value. "
                  "Discover how organizations are moving fast to secure their advantage and shape AI’s future, "
                  "following four bold moves.",
          image: "assets/card5.jpg",
        ),
        CardItem(
          label: "CASE STUDY",
          title:
              "4 critical actions to take now to strengthen your cyber defenses ",
          description:
              "Cyber risks are growing faster than ever, outpacing security efforts. "
                  "How do you get ahead of these threats? In this year’s State of Cybersecurity Resilience, "
                  "learn the steps to build resilience as you embrace AI transformation.",
          image: "assets/card6.jpg",
        ),
        CardItem(
          label: "RESEARCH REPORT",
          title:
              "Poste Italiane pivots from postal service to national platform ",
          description:
              "Traditional workflows, functions jobs and skills will evolve with gen AI. "
                  "Learn how you can accelerate reinvention with an operating model that holistically integrates tech, "
                  "talent and processes to drive sustainable growth.",
          image: "assets/card7.jpg",
        ),
        CardItem(
          label: "CASE STUDY",
          title:
              "Bristol Myers Squibb accelerates drug development with generative AI",
          description:
              "Modernization isn’t just about adding tools—it’s about ensuring great experiences for residents and those who serve them."
                  " Agencies that align technology with human needs turn digital investments into enduring public value.",
          image: "assets/card8.jpg",
        ),
      ],
    ),
  );
}

// ------ NAV ITEM

class NavItem extends StatefulWidget {
  final String title;
  final String hoverText;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.title,
    required this.hoverText,
    required this.onTap,
  });

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),

      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: Duration(milliseconds: 200),
          style: TextStyle(
            color: isHovering ? Colors.white : Colors.white70,
            fontSize: 18,
            fontWeight: isHovering ? FontWeight.bold : FontWeight.w500,
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),

            child: Text(isHovering ? widget.hoverText : widget.title),
          ),
        ),
      ),
    );
  }
}

// ------ CARD ITEM WIDGET   image k liye text wgra

class CardItem extends StatefulWidget {
  final String label;
  final String title;
  final String image;
  final String? description; // <-- ADD THIS

  const CardItem({
    super.key,
    required this.label,
    required this.title,
    required this.image,
    this.description, // <-- ADD THIS
  });

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  bool isHovered = false;
  bool isExploreExpanded = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),

      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
        height: 500,
        width: 320,
        transform: Matrix4.identity()..translate(0, isHovered ? -10 : 0),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isHovered ? 0.4 : 0.2),
              blurRadius: isHovered ? 20 : 10,
              offset: Offset(0, isHovered ? 12 : 6),
            ),
          ],
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Stack(
            children: [
              // -----------------------
              //  IMAGE (FADES OUT)
              // -----------------------
              AnimatedOpacity(
                duration: Duration(milliseconds: 300),
                opacity: isHovered ? 0.0 : 1.0,
                child: Image.asset(
                  widget.image,
                  height: 500,
                  width: 320,
                  fit: BoxFit.cover,
                ),
              ),

              // DARK OVERLAY (BRIGHTER ON HOVER)
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                color: Colors.black.withOpacity(isHovered ? 0.75 : 0.25),
              ),

              // ------------------------------------
              // TOP LABEL & TITLE (Image Mode)
              // ------------------------------------
              AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                top: isHovered ? -50 : 30,
                left: 20,
                right: 20,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: isHovered ? 0 : 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.label,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 50),
                      Text(
                        widget.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ------------------------------------
              // FULL TEXT CARD (HOVER MODE)
              // ------------------------------------
              AnimatedOpacity(
                duration: Duration(milliseconds: 350),
                opacity: isHovered ? 1.0 : 0.0,

                child: Container(
                  padding: EdgeInsets.all(24),
                  color: Colors.black.withOpacity(0.85),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.label,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 18),

                      Text(
                        widget.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          height: 1.3,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 16),

                      // ⭐ ADD DESCRIPTION HERE
                      Text(
                        widget.description ?? "",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),

                      SizedBox(height: 20),

                      Spacer(),

                      InkWell(
                        onTap: () {
                          setState(() {
                            isExploreExpanded =
                                !isExploreExpanded; // toggle animation
                          });
                        },

                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 250),

                          child: Row(
                            children: [
                              Text(
                                "Explore",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              AnimatedContainer(
                                duration: Duration(milliseconds: 250),
                                width: isExploreExpanded
                                    ? 14
                                    : 6, // expand spacing
                              ),

                              AnimatedOpacity(
                                duration: Duration(milliseconds: 250),
                                opacity: isExploreExpanded
                                    ? 1
                                    : 0.5, // fade effect

                                child: AnimatedPadding(
                                  duration: Duration(milliseconds: 250),
                                  padding: EdgeInsets.only(
                                    left: isExploreExpanded ? 6 : 0,
                                  ),
                                  child: Icon(
                                    Icons.chevron_right,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Image hover include code design
// ----- QUOTE SECTION  360 image

class QuoteSection extends StatelessWidget {
  const QuoteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 50),
          child: Responsive.isMobile(context)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        "assets/card9-jpg.webp",
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),
                    quoteText(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          "assets/card9-jpg.webp",
                          height: 500,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 80),
                    Expanded(child: quoteText()),
                  ],
                ),
        ),

        const SizedBox(height: 40),

        // BIG 360 VALUE
        Text(
          "360° VALUE",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: Responsive.isMobile(context)
                ? 50
                : Responsive.isTablet(context)
                ? 90
                : 150,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Every day, we embrace change and create value for all stakeholders \n around the world.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "See the report",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),

            SizedBox(width: 10),

            Container(
              decoration: BoxDecoration(
                color: Color(0xFF6F00B3),
                shape: BoxShape.rectangle,
              ),
              child: IconButton(
                icon: Icon(Icons.chevron_right, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ],
        ),
        SizedBox(height: 100),
      ],
    );
  }

  Widget quoteText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 100, right: 60),
          child: Text(
            "“AI is only a technology. The value comes from reinvention of how we work, "
            "our workforces and the tools we use… We are leading the way with reinvention.”",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Julie Sweet, quoted in Fortune, August/September 2025",
          style: TextStyle(color: Colors.white70, fontSize: 18),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            const Text(
              "Read more",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),

            const SizedBox(width: 10),

            // ICON with purple background
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF6F00B3), // Purple
                shape: BoxShape.rectangle,
              ),
              child: IconButton(
                icon: Icon(Icons.chevron_right, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// -------- SLIDE SECTION

class SlideSection extends StatefulWidget {
  const SlideSection({super.key});

  @override
  State<SlideSection> createState() => _SlideSectionState();
}

class _SlideSectionState extends State<SlideSection> {
  int currentIndex = 0;

  // ---------------- SLIDE DATA ----------------
  final List<Map<String, String>> slides = [
    {
      "image": "assets/card10.jpg",
      "title": "Microsoft scales cloud at the speed of AI",
      "desc":
          "The cloud services leader is reinventing its supply chain to meet surging AI demand—doubling data center capacity while boosting speed, resilience and sustainability.",
    },
    {
      "image": "assets/card11.jpg",
      "title": "AI transforming global supply chains",
      "desc":
          "Companies are leveraging digital twins and automation to create smarter, more efficient supply chain systems.",
    },
    {
      "image": "assets/card12.jpg",
      "title": "Reinventing customer experience with AI",
      "desc":
          "AI-driven platforms help brands deliver hyper-personalized experiences for millions of users.",
    },
    {
      "image": "assets/card13.jpg",
      "title": "Future of cloud and edge computing",
      "desc":
          "Edge technologies are enabling faster decision-making and unlocking new business potential.",
    },
    {
      "image": "assets/card14.jpg",
      "title": "Cybersecurity for the next decade",
      "desc":
          "AI-powered protection systems detect threats in real time and enhance security posture globally.",
    },
    {
      "image": "assets/card15.jpg",
      "title": "Sustainability powered by technology",
      "desc":
          "Digital platforms are enabling organizations to reduce emissions and operate more sustainably.",
    },
  ];

  // FUNCTION — go to next slide
  void nextSlide() {
    setState(() {
      currentIndex = (currentIndex + 1) % slides.length;
    });
  }

  // FUNCTION — go to previous slide
  void prevSlide() {
    setState(() {
      currentIndex = (currentIndex - 1 + slides.length) % slides.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final slide = slides[currentIndex];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          //
          // TOP SLIDE WITH IMAGE + TEXT
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Responsive.isMobile(context)
                ? Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          slide["image"]!,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 20),
                      slideText(slide),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            slide["image"]!,
                            height: 500,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 50),
                      Expanded(child: slideText(slide)),
                    ],
                  ),
          ),

           SizedBox(height: 80),

          //
          // WORKING SLIDE CONTROLS
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: const Color(0xFF6F00B3),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: prevSlide,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                "${currentIndex + 1}/${slides.length}",
                style: const TextStyle(color: Colors.white70, fontSize: 20),
              ),
              const SizedBox(width: 20),
              Container(
                color: const Color(0xFF6F00B3),
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward, color: Colors.white),
                  onPressed: nextSlide,
                ),
              ),
            ],
          ),

          const SizedBox(height: 280),

          // BOTTOM CONTENT (unchanged)
          Text(
            "Global recognition and \n awards",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: Responsive.isMobile(context)
                  ? 55
                  : Responsive.isTablet(context)
                  ? 90
                  : 120,
              fontWeight: FontWeight.w900,
            ),
          ),

          const SizedBox(height: 250),

          //
          // ---- LAST SECTION SAME AS YOUR CODE ----
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 50),
            child: Responsive.isMobile(context)
                ? Column(
                    children: [
                      // ClipRRect(
                      //   borderRadius: BorderRadius.circular(10),
                      //   child: Image.asset(
                      //     "assets/card16.jpg",
                      //     height: 300,
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                      const SizedBox(height: 30),
                      careersText(),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "assets/card16.jpg",
                                height: 450,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 30),
                            const Text(
                              "Join us at the\nheart of change.",
                              style: TextStyle(
                                color: Color(0xFF9D4EDD),
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 60),
                      Expanded(child: careersText()),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  // -----TEXT FOR SLIDE
  Widget slideText(Map<String, String> slide) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          slide["title"]!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          slide["desc"]!,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 18,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            const Text(
              "Read more",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(width: 10),
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(color: Color(0xFF6F00B3)),
              child: IconButton(
                iconSize: 22,
                icon: const Icon(Icons.chevron_right, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  // -----------careersText                                    SAME CAREERS
  Widget careersText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("CAREERS", style: TextStyle(color: Colors.white54, fontSize: 18)),
        SizedBox(height: 20),
        Text(
          "Grow your career at\nthe heart of change",
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            height: 1.2,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 25),
        Text(
          "It's your time to shine. Bring your ingenuity, curiosity and big ideas.",
          style: TextStyle(color: Colors.white70, fontSize: 30, height: 1.2),
        ),
      ],
    );
  }
}
