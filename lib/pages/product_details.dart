import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../widgets/category_filter.dart';
import '../widgets/custom_appbar.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({
    super.key,
    this.image,
    this.name,
    this.price,
  });
  final String? image , name , price;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showBottomSheet();
    });
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return DraggableScrollableSheet(
            initialChildSize: 0.17,
            minChildSize: 0.17,
            maxChildSize: 0.8,
            expand: false,
            builder: (BuildContext context, ScrollController scrollController) {
              return bottomWidget(
                  scrollController,
                  widget.name,
                  widget.price,
              );
            },

          );
        },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Men",
        prefix: "assets/svgs/arrow-left.svg",
        suffix: "assets/svgs/cart.svg",
        onTap: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            CategoryFilter(),
            Stack(
              children: [
                SizedBox(
                    width: 250,
                    height: 600,
                    child: Image.asset(widget.image.toString()),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  left: 10,
                  child: Image.asset("assets/images/shadow.png".toString()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// bottomSheetWidget
Widget bottomWidget(scroll,name,price) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    padding: const EdgeInsets.all(16),
    child: ListView(
      controller: scroll,
      children: [
        Center(
          child: Container(
            width: 42,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Gap(10),
        Text(name.toString(),maxLines: 1,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
        Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("€{$price}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700)),
            Row(
              children: [
                Icon(Icons.favorite_border),
                Gap(10),
                Text("450",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),
              ],
            ),
          ],
        ),
        Gap(20),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
              width: 0.7,
              color: Colors.black12,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Select color",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(10),
                  SvgPicture.asset("assets/svgs/select.svg"),
                ],
              ),

              Container(
                width: 2,
                height: 40,
                color: Colors.black12,
              ),

              Row(
                children: [
                  Text(
                    "Select size",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(10),
                  SvgPicture.asset("assets/svgs/select.svg"),
                ],
              ),
            ],
          ),
        ),
        Gap(20),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.black
          ),
          child: Center(
              child: Text("Add To Bag",
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
              ),
          ),
        ),
      ],
    ),
  );
}