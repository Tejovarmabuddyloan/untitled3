import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';



class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // First Column with Two Containers in a Row
            Row(
              children: [
                Expanded(
                  child: ShimmerCont(


                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: ShimmerCont(),
                ),
              ],
            ),
            SizedBox(height: 16.0),
              ShimmerCont(),
            SizedBox(height: 16.0),
            // Third Column with Box Shadow and Shimmer
            Container(

              height: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300]!,
                    offset: Offset(0, 2),

                  ),
                ],
              ),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Small Container 1
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ShimmerContainer(),
                        ShimmerContainer(),
                        ShimmerContainer(),
                        ShimmerContainer(),
                      ],
                    ),
                    // Small Container 2
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ShimmerContainer(),
                        ShimmerContainer(),
                        ShimmerContainer(),
                        ShimmerContainer(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Fourth Column with Box Shadow and Shimmer
             Container(

              height: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300]!,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Small Container 1
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ShimmerContainer(),
                        ShimmerContainer(),
                        ShimmerContainer(),
                        ShimmerContainer(),
                      ],
                    ),
                    // Small Container 2
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ShimmerContainer(),
                        ShimmerContainer(),
                        ShimmerContainer(),
                        ShimmerContainer(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Fifth Column with Box Shadow
            ShimmerCont(),
          ],
        ),
      ),
    );
  }
}

class ShimmerContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
class ShimmerCont extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 150.0,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              offset: Offset(0, 2),
            ),
          ],
        ),
      ),
    );
  }
}
