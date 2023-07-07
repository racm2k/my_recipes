import 'package:flutter/material.dart';
import 'package:my_recipes/src/core/fonts/global_fonts.dart';
import 'package:my_recipes/src/core/models/recipe_model.dart';

import '../theme/theme_colors.dart';

class RecipeCard extends StatefulWidget {
  final RecipeModel recipe;
  final bool isLiked;
  final VoidCallback onLikeTap;

  const RecipeCard({super.key, required this.recipe,required this.isLiked,required this.onLikeTap});

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      elevation: 0,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.antiAlias,
        children: [
          Image.network(
            widget.recipe.image ?? '',
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ThemeColors.primaryText.withOpacity(0.5),
                    Colors.transparent,
                    ThemeColors.primaryText.withOpacity(0.5),
                  ]),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: ThemeColors.cardPrimaryBg,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 20,
                      color: ThemeColors.whiteText,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      widget.recipe.category ?? '',
                      style: GlobalFonts.titleMedium(ThemeColors.whiteText),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: InkWell(
                onTap: widget.onLikeTap,
                child: Icon(
                  widget.isLiked?Icons.favorite:Icons.favorite_border_rounded,
                  size: 42,
                  color: widget.isLiked?ThemeColors.primary: ThemeColors.whiteText,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      widget.recipe.name ?? '',
                      style: GlobalFonts.titleLarge(ThemeColors.primary),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 24,
                        color: ThemeColors.whiteText,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        widget.recipe.time ?? '',
                        style: GlobalFonts.titleMedium(ThemeColors.whiteText),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const Icon(
                        Icons.people,
                        size: 24,
                        color: ThemeColors.whiteText,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        widget.recipe.serves ?? '',
                        style: GlobalFonts.titleMedium(ThemeColors.whiteText),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
