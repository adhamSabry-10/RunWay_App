import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.name, required this.price, required this.image,required this.onTap});
  final String name, price,image;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200,
            height: 255,
            decoration: BoxDecoration(
              color: Color(0xffECECEC),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  Center(child: Image.asset(image)),
                  Positioned(
                    bottom: 0,
                    right: 10,
                    left: 10,
                    child: Image.asset("assets/images/shadow.png"),
                  ),

                ],
              ),
            ),
          ),
          Gap(13),
          Text(name,maxLines: 1,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400)),
          Gap(6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("€{$price}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700)),
              Icon(Icons.favorite_border),
            ],
          ),
        ],
      ),
    );
  }
}
