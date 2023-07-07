import 'package:flutter/material.dart';
import 'package:my_recipes/src/core/fonts/global_fonts.dart';

import '../theme/theme_colors.dart';

class MyRecipeScaffold extends StatelessWidget {
  final String? title;
  final Widget body;
  final EdgeInsetsGeometry padding;
  final Widget? footerSection;
  final bool showleading;
  final VoidCallback? leadingNavigation;
  final bool extendBodyBehindAppBar;

  const MyRecipeScaffold(
      {super.key,
      this.title,
      required this.body,
      this.padding = const EdgeInsets.symmetric(horizontal: 16),
      this.footerSection,
      this.showleading = false,
      this.extendBodyBehindAppBar = false,
      this.leadingNavigation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        centerTitle: false,
        leadingWidth: 56,
        leading: showleading
            ? IconButton(
                key: const Key('BackButton'),
                icon: const Icon(Icons.arrow_back,size: 24,),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                onPressed:
                    leadingNavigation ?? () => Navigator.of(context).maybePop(),
              ):null,

        automaticallyImplyLeading: showleading,
        titleSpacing: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding: padding,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: title != null,
                child: Text(title ?? '',style: GlobalFonts.titleExtraLarge(ThemeColors.primaryText),),
              ),
              Expanded(child: body)
            ]),
      )),
      floatingActionButton: footerSection,
    );
  }
}
