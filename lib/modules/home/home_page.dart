import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pockman/constants/color.dart';
import 'package:pockman/modules/home/home_page_controller.dart';
import 'package:pockman/widgets/card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Initialize the HomePageController
  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, right: 2, top: 20),
            height: size.height * 0.2,
            width: size.width,
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
                        style: GoogleFonts.lalezar(
                          color: Colors.black,
                          fontSize: 35,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Gotta Know 'Ém All!",
                        style: GoogleFonts.lalezar(
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
                // pikachu image
                Positioned(
                  right: 1,
                  child: SizedBox(
                    height: 140,
                    width: 180,
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
                  child: const PokemonSearchBar(),
                ),
                Positioned(
                  top: size.height * 0.143,
                  right: size.height * 0.0143,
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    decoration: BoxDecoration(
                      color: AppColors.filter,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.tune, color: Colors.white),
                          const SizedBox(width: 8),
                          Text(
                            "Filter",
                            style: GoogleFonts.lalezar(
                              color: Colors.white,
                              fontSize: 18,
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

          // Detail Part Header
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "All Pokémon",
                  style: GoogleFonts.lalezar(
                    color: Colors.black,
                    fontSize: 20,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                Text(
                  "View All >",
                  style: GoogleFonts.lalezar(
                    color: AppColors.filter,
                    fontSize: 20,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
          ),
          
          // Pokémon Grid List with Reactive State Management
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.filter,
                  ),
                );
              }

              if (controller.errorMessage.value.isNotEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Error loading data",
                        style: GoogleFonts.lalezar(
                          fontSize: 18,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () => controller.fetchPokemon(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.filter,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text("Retry"),
                      ),
                    ],
                  ),
                );
              }

              if (controller.filteredPokemonList.isEmpty) {
                return Center(
                  child: Text(
                    "No Pokémon Found",
                    style: GoogleFonts.lalezar(
                      fontSize: 20,
                      color: AppColors.grey,
                    ),
                  ),
                );
              }

              return GridView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: controller.filteredPokemonList.length,
                itemBuilder: (context, index) {
                  final pokemon = controller.filteredPokemonList[index];
                  // Staggered fade and slide up animation using flutter_animate
                  return PokemonCard(pokemon: pokemon)
                      .animate()
                      .fadeIn(duration: 400.ms, delay: (index * 40).ms)
                      .slideY(begin: 0.2, end: 0.0, curve: Curves.easeOutQuad);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

// Custom Searchbar widget communicating search inputs to the controller
class PokemonSearchBar extends StatelessWidget {
  const PokemonSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Get.find<HomePageController>();

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
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        onChanged: (value) => controller.filterPokemon(value),
        style: const TextStyle(color: Colors.black87), // Fix: Change from white text to black
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search Pokemon",
          prefixIcon: const Icon(Icons.search, color: AppColors.grey),
          hintStyle: GoogleFonts.lalezar(
            fontWeight: FontWeight.w500,
            color: AppColors.grey,
            fontSize: 20,
          ),
          contentPadding: const EdgeInsets.only(top: 8),
        ),
        cursorColor: Colors.black,
        cursorHeight: 20,
      ),
    );
  }
}
