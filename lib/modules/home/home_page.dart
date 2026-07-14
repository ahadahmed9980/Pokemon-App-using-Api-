import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pockman/constants/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, right: 2, top: 20),
            height: size.height * 0.2,
            width: size.width,
            // color: Colors.blue,
            child: Stack(
              children: [
                Positioned(
                  top: 30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pokédex",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Gotta Know 'Ém All!",
                        style: TextStyle(
                          color: AppColors.grey,
                          fontSize: 20,
                          height: 1,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                //pikachu image
                Positioned(
                  right: 1,
                  child: Container(
                    height: 140,
                    width: 180,
                    // color: Colors.black,
                    child: Image.asset(
                      "assets/images/pikacu.png",
                      width: 150,
                      height: 200,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.143,
                  right: 121,
                  child: searchbar(),
                ),

                Positioned(
                  top: size.height * 0.143,
                  right: size.height * 0.0143,
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    // width: 90,
                    decoration: BoxDecoration(
                      color: AppColors.filter,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.tune, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            "Filter",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
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

          //detail part
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "All Pokémon",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                Text(
                  "View All>",
                  style: TextStyle(
                    color: AppColors.filter,
                    fontSize: 20,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
          ),
          ////card
          Container(
            padding: EdgeInsets.all(10),
            // height: size.height * 0.2,
            width: size.width / 2.5,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.lightBlueAccent,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "#001",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Icon(
                      Icons.favorite_outline_rounded,
                      size: 18,
                      color: Colors.blueGrey,
                    ),
                  ],
                ),
                Container(
                  height: size.height * 0.11,
                  width: double.infinity,
                  // color: Colors.black,
                  child: Image.asset(
                    "assets/images/pika.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Pikachu",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(""),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(2),

                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "Electric",
                        style: GoogleFonts.lakkiReddy(fontSize: 10),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(2),

                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "Electric",
                        style: GoogleFonts.lakkiReddy(fontSize: 10),
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

//searchbar
class searchbar extends StatelessWidget {
  const searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.054,
      width: size.width * 0.65,
      margin: const EdgeInsets.only(left: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),

      child: TextField(
        //controller: username,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search Pokemon",
          prefixIcon: Icon(Icons.search),
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.grey,
            fontSize: 20,
          ),
          contentPadding: const EdgeInsets.only(top: 10),
        ),

        cursorColor: Colors.black,
        cursorHeight: 20,
      ),
    );
  }
}
