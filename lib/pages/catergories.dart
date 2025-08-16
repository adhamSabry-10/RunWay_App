import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:runway/models/product_model.dart';
import 'package:runway/pages/product_details.dart';
import 'package:runway/widgets/custom_appbar.dart';
import 'package:runway/widgets/product_item.dart';
import '../widgets/category_filter.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    List<ProductModel> products = [
      ProductModel(
          name: "Top Man Black",
          price: "20",
          image: "assets/images/models/model1.png",
      ),
      ProductModel(
          name: "Top man black with Trous..",
          price: "50",
          image: "assets/images/models/model2.png",
      ),
      ProductModel(
        name: "Deep gray essential regul..",
        price: "26",
        image: "assets/images/models/model3.png",
      ),
      ProductModel(
        name: "Gray coat and white T-sh..",
        price: "100",
        image: "assets/images/models/model4.png",
      ),
    ];

    return Scaffold(
      appBar: CustomAppbar(
          title: "Men",
          prefix: "assets/svgs/arrow-left.svg",
          suffix: "assets/svgs/cart.svg",
      ),
      body: Column(
        children: [
          CategoryFilter(),
          Gap(13),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 3,
                      childAspectRatio: 1/1.8,
                  ),
                  itemBuilder: (context , index) {
                    final item = products[index];
                    return ProductItem(
                        name: item.name,
                        price: item.price, 
                        image: item.image, 
                        onTap: () => Navigator.push(context , MaterialPageRoute(builder: (c) => ProductDetails(
                          image: item.image,
                          name: item.name,
                          price: item.price,
                        )))
                    );
                  },
              ),
            ),
          ),
        ],
      ),
    );
  }
}