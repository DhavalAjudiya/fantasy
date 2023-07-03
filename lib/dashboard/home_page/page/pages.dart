import 'package:fantasyarenas/dashboard/home_page/controller/home_controller.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../home_screen.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({Key? key}) : super(key: key);

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int pageIndex = 0;

  final pages = [
    HomeScreen(),
    const Page2(),
    const Page3(),
    const Page4(),
  ];
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Padding(
          padding: EdgeInsets.all(6.0),
          child: CircleAvatar(
            minRadius: 4,
            backgroundColor: Colors.grey,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Fantasy ',
              style: GoogleFonts.aBeeZee(
                color: Colors.deepOrange,
                fontWeight: FontWeight.w700,
                fontSize: SizeUtils.fSize_20(),
              ),
            ),
            Text(
              'Arenas',
              style: GoogleFonts.aclonica(
                color: Colors.deepOrange,
                fontWeight: FontWeight.w700,
                fontSize: SizeUtils.fSize_20(),
              ),
            ),
          ],
        ),
        actions: const [
          Icon(
            Icons.search_outlined,
            color: Colors.grey,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
       body:  pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),

    );
  }

  Widget buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? Icon(
              Icons.home,
              color: Colors.deepOrange,
              size: SizeUtils.fSize_25(),
            )
                : Icon(
              Icons.home_outlined,
              color: Colors.white,
              size: SizeUtils.fSize_25(),
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? Icon(
              Icons.calendar_month,
              color: Colors.deepOrange,
              size: SizeUtils.fSize_24(),
            )
                : Icon(
              Icons.calendar_month_outlined,
              color: Colors.white,
              size: SizeUtils.fSize_24(),
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ?  Icon(
              Icons.video_collection,
              color: Colors.deepOrange,
              size: SizeUtils.fSize_24(),
            )
                :  Icon(
              Icons.video_collection_outlined,
              color: Colors.white,
              size: SizeUtils.fSize_24(),
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: pageIndex == 3
                ? Icon(
              Icons.person,
              color: Colors.deepOrange,
              size: SizeUtils.fSize_25(),
            )
                : Icon(
              Icons.person_outline,
              color: Colors.white,
              size: SizeUtils.fSize_25(),
            ),
          ),
        ],
      ),
    );
  }

}


class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 1",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 2",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 3",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 4",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}