import 'package:api_2/core/utils/media_quary.dart';
import 'package:flutter/material.dart';

class head_home_view extends StatelessWidget {
  const head_home_view({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: SizedBox(
        height: context.height * 0.045,
        width: context.weight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
               color: const Color(0xFFF0F1FA),
                borderRadius: BorderRadius.circular(15),

              ),
              padding: const EdgeInsets.symmetric(horizontal: 12,),
              width: context.weight * 0.8,
              child: Center(
                child: TextFormField(
                  decoration: const InputDecoration(

                    hintText: 'search...',
                    border: InputBorder.none,


                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Color(0xffFF3A44), Color(0xffFF8086)],
                ),
              ),
              child: const Icon(
                Icons.add_alert_outlined,
                color: Colors.white,
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
