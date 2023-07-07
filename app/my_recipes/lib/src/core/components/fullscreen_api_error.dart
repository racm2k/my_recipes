import 'package:flutter/material.dart';
import 'package:my_recipes/src/core/components/myrecipe_scaffold.dart';

class FullScreenApiError extends StatelessWidget {
  final String? message;
  const FullScreenApiError({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return MyRecipeScaffold(
      body:  Center(
        child: Column(
          children: [
            const Text('Api Error'),
            Text(message ?? ''),
          ],
        ),
      ),
      footerSection: ElevatedButton(onPressed: ()=>Navigator.of(context).pop(), child: const Text('OK')),
    );
  }
}
