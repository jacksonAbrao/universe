// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:universe/constants.dart';
import 'package:universe/data.dart';
import 'package:universe/detail_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [gradientStartColor, gradientEndColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.3, 0.7],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: <Widget>[
                    const Text(
                      'Explore',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 44,
                        color: Color(0xffffffff),
                        fontWeight: bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    DropdownButton<dynamic>(
                      items: const [
                        DropdownMenuItem(
                          child: Text(
                            'Solar System',
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 24,
                              color: Color(0x7cdbf1ff),
                              fontWeight: normal,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                      onChanged: (value) {},
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Image.asset('assets/drop_down_icon.png'),
                      ),
                      underline: SizedBox(),
                    ),
                  ],
                ),
              ),
              Container(
                height: 380,
                // padding: const EdgeInsets.only(left: 32),
                child: Swiper(
                  itemCount: planets.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 32,
                  layout: SwiperLayout.STACK,
                  pagination: const SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      activeSize: 16,
                      space: 6,
                    ),
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (() {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, a, b) => DetailPage(
                              planetInfo: planets[index],
                            ),
                          ),
                        );
                      }),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 70),
                              Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 80),
                                        Text(
                                          planets[index].name.toString(),
                                          style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: 36,
                                            color: primaryTextColor,
                                            fontWeight: bold,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          'Solar System',
                                          style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: 17,
                                            color: primaryTextColor,
                                            fontWeight: normal,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Know more',
                                              style: TextStyle(
                                                fontFamily: 'Avenir',
                                                fontSize: 18,
                                                color: secondaryTextColor,
                                                fontWeight: normal,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: secondaryTextColor,
                                            ),
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Hero(
                              tag: planets[index].position,
                              child: Image.asset(
                                (planets[index].iconImage).toString(),
                                width: 250,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(16),
          ),
          color: navigationColor,
        ),
        padding: const EdgeInsets.all(6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/menu_icon.png'),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/search_icon.png'),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/profile_icon.png'),
            ),
          ],
        ),
      ),
    );
  }
}
