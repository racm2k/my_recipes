import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_recipes/src/core/fonts/global_fonts.dart';
import 'package:my_recipes/src/core/models/recipe_model.dart';

import '../../../../../core/theme/theme_colors.dart';

class RecipeDetailUI extends StatefulWidget {
  final RecipeModel recipe;

  const RecipeDetailUI({super.key, required this.recipe});

  @override
  State<RecipeDetailUI> createState() => _RecipeDetailUIState();
}

class _RecipeDetailUIState extends State<RecipeDetailUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.transparent,
        leading: BackButton(
          color: ThemeColors.primaryBg,
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.recipe.image ?? ''),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ThemeColors.primaryText.withOpacity(0.5),
                    ThemeColors.primaryText.withOpacity(0.5),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              elevation: 10,
              margin: const EdgeInsets.all(0),
              clipBehavior: Clip.antiAlias,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: ThemeColors.primaryBg,
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                                flex: 2,
                                fit: FlexFit.loose,
                                child: Text(
                                  widget.recipe.name ?? '',
                                  style: GlobalFonts.titleExtraLarge(
                                      ThemeColors.primaryText),
                                )),
                            InkWell(
                              onTap: () {
                                //TODO: Add to favorites
                              },
                              child: const Icon(
                                size: 32,
                                Icons.favorite_border,
                                color: ThemeColors.primaryText,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: ThemeColors.primary,
                                borderRadius: BorderRadius.circular(35),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: ThemeColors.whiteText,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    widget.recipe.category ?? '',
                                    style: GlobalFonts.labelMedium(
                                        ThemeColors.primaryBg),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              decoration: BoxDecoration(
                                color: ThemeColors.primary,
                                borderRadius: BorderRadius.circular(35),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.people_rounded,
                                    color: ThemeColors.whiteText,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    widget.recipe.serves ?? '',
                                    style: GlobalFonts.labelMedium(
                                        ThemeColors.primaryBg),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'by ',
                                style: GlobalFonts.labelMedium(
                                    ThemeColors.primaryText),
                                children: [
                                  TextSpan(
                                    text: widget.recipe.creator ?? '',
                                    style: GlobalFonts.labelLargeUnderline(
                                        ThemeColors.primaryText),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        //TODO: Add navigation to creator profile
                                      },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            const CircleAvatar(
                              radius: 14,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ExpansionTile(
                                  title: Text(
                                    'Ingredients',
                                    style: GlobalFonts.labelLarge(
                                        ThemeColors.primaryText),
                                  ),
                                  expandedCrossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  expandedAlignment: Alignment.topLeft,
                                  tilePadding: const EdgeInsets.all(0),
                                  children: widget.recipe.ingredients
                                          ?.map((ingredient) {
                                        return Text(ingredient,
                                            style: GlobalFonts.labelMedium(
                                                ThemeColors.primaryText));
                                      }).toList() ??
                                      [],
                                ),
                                ExpansionTile(
                                  title: Text(
                                    'Nutritional Values',
                                    style: GlobalFonts.labelLarge(
                                        ThemeColors.primaryText),
                                  ),
                                  expandedAlignment: Alignment.topLeft,
                                  tilePadding: const EdgeInsets.all(0),
                                  children: widget.recipe.nutritionValues?.entries
                                          .map((entry) {
                                        final key = entry.key;
                                        final value = entry.value;
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(key,
                                                style: GlobalFonts.labelMedium(
                                                    ThemeColors.primaryText)),
                                            Text(value,
                                                style: GlobalFonts.labelMedium(
                                                    ThemeColors.primaryText)),
                                          ],
                                        );
                                      }).toList() ??
                                      [],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 56),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ThemeColors.primary,
                  padding: const EdgeInsets.all(
                    16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
                onPressed: () {
                  //TODO: Start cooking
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.play_arrow_rounded,
                      color: ThemeColors.whiteText,
                      size: 32,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${widget.recipe.time} to cook',
                      style: GlobalFonts.titleMedium(ThemeColors.whiteText),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
