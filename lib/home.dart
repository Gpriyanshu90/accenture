import 'package:accenture/reponsive.dart';
import 'package:flutter/material.dart';

class PageLayout extends StatefulWidget {
  const PageLayout({super.key, required this.title});
  final String title;

  @override
  State<PageLayout> createState() => _PageLayoutState();
}

class _PageLayoutState extends State<PageLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: buildAppbar(context),

      body: SingleChildScrollView(
        child: Column(
          children: [
            bannerSection(context),
            const SizedBox(height: 60),
            cardsSection(context),
            const SizedBox(height: 80),
            const QuoteSection(),
            const SlideSection(),
            taxtmsg(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  // ---------------- TEXT MESSAGE SECTION -----------------
  Widget taxtmsg() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 60),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Accenture news",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 40),

                const Text("April 28, 2025",
                    style: TextStyle(color: Colors.white70, fontSize: 14)),
                const SizedBox(height: 10),

                const Text(
                  "Accenture Introduces the First Platform\n"
                      "to Allow Seamless, First-of-its-kind Multi-\n"
                      "System AI Agent Collaboration",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      height: 1.3,
                      fontWeight: FontWeight.w700),
                ),

                const SizedBox(height: 40),

                Row(
                  children: [
                    _arrowBox(Icons.arrow_back),
                    const SizedBox(width: 20),
                    _arrowBox(Icons.arrow_forward),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // ---------------- ARROW BUTTON BOX -----------------
  Widget _arrowBox(IconData icon) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Icon(icon, color: Colors.white, size: 28),
    );
  }
}





//
// -------------------------- APPBAR ----------------------------
//
PreferredSizeWidget buildAppbar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.black,
    titleSpacing: 0,
    toolbarHeight: 90,
    title: Row(
      children: [
        // LOGO
        Padding(
          padding: const EdgeInsets.only(left: 40, top: 10),
          child: SizedBox(
            height: 60,
            width: 90,
            child: Image.asset('assets/Accenture-Emblem.png', fit: BoxFit.contain),
          ),
        ),

        const SizedBox(width: 40),

        // CENTER NAV ITEMS
        if (!Responsive.isMobile(context))
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                NavItem(title: "What we do"),
                NavItem(title: "What we think"),
                NavItem(title: "Who we are"),
                NavItem(title: "Careers"),
              ],
            ),
          ),

        // RIGHT SIDE SPACE (if mobile → no space)
        if (!Responsive.isMobile(context)) const SizedBox(width: 20),
      ],
    ),

    // RIGHT SIDE ACTIONS
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
              Text("United Kingdom",
                  style: TextStyle(color: Colors.white, fontSize: 17)),
              Icon(Icons.keyboard_arrow_down, color: Colors.white),
            ],
          ),
        ),
    ],
  );

}

//
// -------------------------- BANNER ----------------------------
//
Widget bannerSection(BuildContext context) {

  // ---------------- MOBILE ----------------
  if (Responsive.isMobile(context)) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "TOGETHER WE",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Row(
            children: const [
              Text("REIN",
                  style: TextStyle(color: Colors.white, fontSize: 55, fontWeight: FontWeight.bold)),
              SizedBox(width: 5),
              Text(">", style: TextStyle(color: Colors.purple, fontSize: 80, fontWeight: FontWeight.bold)),
              SizedBox(width: 5),
              Text("ENTED",
                  style: TextStyle(color: Colors.white, fontSize: 55, fontWeight: FontWeight.bold)),
            ],
          ),

          const SizedBox(height: 25),
          rightSideText(),
        ],
      ),
    );
  }

  // ---------------- TABLET ----------------
  if (Responsive.isTablet(context)) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "TOGETHER WE",
            style: TextStyle(
              color: Colors.white,
              fontSize: 70,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Row(
            children: const [
              Text("REIN",
                  style: TextStyle(color: Colors.white, fontSize: 80, fontWeight: FontWeight.bold)),
              SizedBox(width: 5),
              Text(">", style: TextStyle(color: Colors.purple, fontSize: 120, fontWeight: FontWeight.bold)),
              SizedBox(width: 5),
              Text("ENTED",
                  style: TextStyle(color: Colors.white, fontSize: 80, fontWeight: FontWeight.bold)),
            ],
          ),

          const SizedBox(height: 40),
          rightSideText(),
        ],
      ),
    );
  }

  // ---------------- DESKTOP ----------------
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
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
                  fontSize: 90,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Auto-scale REIN>ENTED
              Align(
                alignment: Alignment.centerLeft,
                child: Transform.translate(
                  offset:  Offset(350, 0),   // Shift slightly right to match design
                  child: FittedBox(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.scaleDown,
                    child: Row(
                      children: const [
                        Text(
                          "REIN",
                          style: TextStyle(
                            fontSize: 90,
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
              )


            ],
          ),
        ),

        const SizedBox(width: 60),

        // RIGHT SIDE – NO TOP PADDING
        Expanded(
          child: Align(
            alignment: Alignment.topLeft,   // ⭐ PERFECT ALIGNMENT
            child: rightSideText(),
          ),
        ),
      ],
    ),
  );



}


Widget rightSideText() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding:  EdgeInsets.only(top: 40, right: 90),
        child: Container(width: 40, height: 4, color: Color(0xFF6F00B3),),
      ),
      const SizedBox(height: 15),
      const Text("Scaling AI",
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
      const SizedBox(height: 20),
      const Text(
        "We help clients prioritize business strategy, technology readiness and organizational readiness "
            "to get to value faster.",
        style: TextStyle(color: Colors.white, fontSize: 19, height: 1.4),),

      const SizedBox(height: 25),

      Row(
        children: [
          const Text("See what we do",
              style: TextStyle(color: Colors.white, fontSize: 18)),

          const SizedBox(width: 10),

          Container(
            padding:  EdgeInsets.all(8),
            decoration:  BoxDecoration(
                color: Color(0xFF6F00B3), shape: BoxShape.rectangle),
            child:  Icon(Icons.arrow_forward,
                size: 18, color: Colors.white),
          ),
        ],
      ),
    ],
  );
}

//
// ------------------------- CARDS -----------------------------
//
Widget cardsSection(BuildContext context) {
  return Padding(
    padding:  EdgeInsets.all(80),
    child: Wrap(
      spacing: 90,
      runSpacing: 30,
      alignment: WrapAlignment.spaceBetween,
      children:  [
        CardItem(label: "RESEARCH REPORT", title: "Holiday Shopping 2025: Tis the season for smarter spending and renewed confidence", image: "assets/card1.jpg"),
        CardItem(label: "RESEARCH REPORT", title: "Destination net zero 2025", image: "assets/card2.jpg"),
        CardItem(label: "RESEARCH REPORT", title: "Learning, reinvented: Accelerating human-AI collaboration", image: "assets/card3.jpg"),
        CardItem(label: "CASE STUDY", title: "AI and your operating model: Radically new ways of working ", image: "assets/card4.jpg"),

        CardItem(label: "RESEARCH REPORT", title: "Sovereign AI: From managing risk to accelerating growth ", image: "assets/card5.jpg"),
        CardItem(label: "CASE STUDY", title: "4 critical actions to take now to strengthen your cyber defenses ", image: "assets/card6.jpg"),
        CardItem(label: "RESEARCH REPORT", title: "Poste Italiane pivots from postal service to national platform ", image: "assets/card7.jpg"),
        CardItem(label: "CASE STUDY", title: "Bristol Myers Squibb accelerates drug development with generative AI", image: "assets/card8.jpg"),
      ],
    ),
  );
}

//
// -------------------------- NAV ITEM ----------------------------
//
class NavItem extends StatelessWidget {
  final String title;
  const NavItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Text(title,
          style: const TextStyle(color: Colors.white, fontSize: 18)),
    );
  }
}

//
// --------------------- CARD ITEM WIDGET ------------------------
//
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
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.25),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

//
// ------------------------ QUOTE SECTION -------------------------
//
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
                child: Image.asset("assets/card9-jpg.webp", height: 250, fit: BoxFit.cover),
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
                  child: Image.asset("assets/card9-jpg.webp",
                      height: 500, fit: BoxFit.cover),
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
             Text("See the report",
                style: TextStyle(color: Colors.white, fontSize: 20)),

             SizedBox(width: 10),

            Container(
              padding:  EdgeInsets.all(8),
              decoration:  BoxDecoration(
                  color: Color(0xFF6F00B3), shape: BoxShape.rectangle),
              child:  Icon(Icons.arrow_forward,
                  size: 18, color: Colors.white),
            ),
          ],
        ),
        SizedBox(height: 100,)
      ],
    );
  }


  Widget quoteText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
           padding:  EdgeInsets.only(top: 100,right: 60),
           child: Text(
            "“AI is only a technology. The value comes from reinvention of how we work, "
                "our workforces and the tools we use… We are leading the way with reinvention.”",
            style: TextStyle(
                color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                   ),
         ),
        const SizedBox(height: 20),
        const Text("Julie Sweet, quoted in Fortune, August/September 2025",
            style: TextStyle(color: Colors.white70, fontSize: 18)),
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
                color: Color(0xFF6F00B3),   // Purple
                shape: BoxShape.rectangle,
              ),
              child:  IconButton(
                icon: Icon(Icons.chevron_right, color: Colors.white),
                onPressed:
                    () {},
              ),
            ),
          ],
        )


      ],
    );
  }
}

//
// ------------------------ SLIDE SECTION -------------------------
//
class SlideSection extends StatelessWidget {
  const SlideSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          //
          // HEADER SLIDE WITH IMAGE + TEXT
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Responsive.isMobile(context)
                ? Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset("assets/card10.jpg",
                      height: 300, fit: BoxFit.cover),
                ),
                const SizedBox(height: 20),
                slideText(),
              ],
            )
                : Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("assets/card10.jpg",
                        height: 500, fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(width: 50),
                Expanded(child: slideText()),
              ],
            ),
          ),

          const SizedBox(height: 100),

          //
          // SLIDE CONTROLS
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Color(0xFF6F00B3),
                child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {}),
              ),
              const SizedBox(width: 20),
              const Text("1/6",
                  style: TextStyle(color: Colors.white70, fontSize: 20)),
              const SizedBox(width: 20),
              Container(
                color: Color(0xFF6F00B3),
                child: IconButton(
                    icon: const Icon(Icons.arrow_forward, color: Colors.white),
                    onPressed: () {}),
              )
            ],
          ),

           SizedBox(height: 220),

          //
          // GLOBAL RECOGNITION
          //
          Text(
            "Global recognition and awards",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: Responsive.isMobile(context)
                  ? 55
                  : Responsive.isTablet(context)
                  ? 90
                  : 140,
              fontWeight: FontWeight.w900,
            ),
          ),

          const SizedBox(height: 150),

          //
          // LAST CAREERS SECTION
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 50),
            child: Responsive.isMobile(context)
                ? Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset("assets/card16.jpg",
                      height: 300, fit: BoxFit.cover),
                ),
                const SizedBox(height: 30),
                careersText(),
              ],
            )
                : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset("assets/card16.jpg",
                            height: 450, fit: BoxFit.cover),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "Join us at the\nheart of change.",
                        style: TextStyle(
                            color: Color(0xFF9D4EDD),
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      )
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

  Widget slideText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Noli uses AI to find your perfect beauty match",
          style: TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        const Text(
          "The beauty tech startup uses powerful AI to provide personalized beauty recommendations "
              "helping customers make confident decisions.",
          style: TextStyle(color: Colors.white70, fontSize: 18, height: 1.6),
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
              decoration:  BoxDecoration(
                color: Color(0xFF6F00B3),
              ),
              child:  IconButton(
                padding: EdgeInsets.zero,
                iconSize: 22,
                icon: Icon(Icons.arrow_forward, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ],
        )

      ],
    );
  }

  Widget careersText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("CAREERS",
            style: TextStyle(color: Colors.white54, fontSize: 18)),
        const SizedBox(height: 20),
         Text(
          "Grow your career at\nthe heart of change",
          style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              height: 1.2,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 25),
         Text(
          "It's your time to shine. Bring your ingenuity, curiosity and big ideas.",
          style: TextStyle(color: Colors.white70, fontSize: 30, height: 1.2),
        ),
        const SizedBox(height: 30),
        Row(
          children: [
             Text(
              "Join us",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),

            const SizedBox(width: 10),

            Container(
              height: 40,
              width: 40,
              decoration:   BoxDecoration(
                color: Color(0xFF6F00B3),
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                iconSize: 22,
                icon: Icon(Icons.chevron_right, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ],
        )
      ],
    );
  }
}
