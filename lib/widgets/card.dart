import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pockman/data/models/pokemon_detail_model.dart';

class PokemonCard extends StatelessWidget {
  final PokemonDetailModel pokemon;
  const PokemonCard({super.key, required this.pokemon});

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'grass':
        return const Color(0xFF48D0B0);
      case 'fire':
        return const Color(0xFFFB6C6C);
      case 'water':
        return const Color(0xFF76BDFE);
      case 'bug':
        return const Color(0xFFAEC6CF);
      case 'normal':
        return const Color(0xFFC4C4C4);
      case 'poison':
        return const Color(0xFFB19CD9);
      case 'electric':
        return const Color(0xFFFFD86F);
      case 'ground':
        return const Color(0xFFE2C56A);
      case 'fairy':
        return const Color(0xFFFFB7B2);
      case 'fighting':
        return const Color(0xFFFF6B6B);
      case 'psychic':
        return const Color(0xFFFF9CEE);
      case 'rock':
        return const Color(0xFFC5B358);
      case 'ghost':
        return const Color(0xFF967BB6);
      case 'ice':
        return const Color(0xFFAEC6CF);
      case 'dragon':
        return const Color(0xFF9F86C0);
      case 'dark':
        return const Color(0xFF5E548E);
      case 'steel':
        return const Color(0xFFB8C0D0);
      default:
        return const Color(0xFFBAC5D0);
    }
  }

  String _formatId(int id) {
    return '#${id.toString().padLeft(3, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final primaryType = pokemon.types.isNotEmpty ? pokemon.types.first : 'normal';
    final cardColor = _getTypeColor(primaryType);
    final capitalizedName = pokemon.name.isNotEmpty
        ? pokemon.name[0].toUpperCase() + pokemon.name.substring(1)
        : '';

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: cardColor,
        boxShadow: [
          BoxShadow(
            color: cardColor.withValues(alpha: 0.4),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Top Row: ID & Favorite icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatId(pokemon.id),
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(
                Icons.favorite_outline_rounded,
                size: 18,
                color: Colors.white70,
              ),
            ],
          ),
          
          const SizedBox(height: 4),

          // Sprite Image inside a circular container
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(6),
              child: pokemon.imageUrl.isNotEmpty
                  ? Image.network(
                      pokemon.imageUrl,
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.broken_image,
                          color: Colors.white54,
                          size: 30,
                        );
                      },
                    )
                  : const Icon(
                      Icons.image_not_supported,
                      color: Colors.white54,
                      size: 30,
                    ),
            ),
          ),
          
          const SizedBox(height: 8),

          // Pokemon Name
          Text(
            capitalizedName,
            style: GoogleFonts.lalezar(
              color: Colors.white,
              fontSize: 16,
              letterSpacing: 0.5,
              height: 1.1,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          
          const SizedBox(height: 6),

          // Types Row
          Wrap(
            spacing: 4,
            runSpacing: 4,
            alignment: WrapAlignment.center,
            children: pokemon.types.map((type) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.22),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  type.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 8.5,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.3,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}