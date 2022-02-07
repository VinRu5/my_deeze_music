import 'package:flutter/material.dart';
import 'package:my_deeze_music/components/section_horizontal.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 24, 0, 32),
        child: CustomScrollView(
          slivers: [
            SectionHorizontal(
              title: 'I podcast del momento',
            )
          ],
        ),
      ),
    );
  }
}
