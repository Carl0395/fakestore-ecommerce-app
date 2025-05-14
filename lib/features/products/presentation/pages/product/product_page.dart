import 'package:ecommerce_system_design/atoms/rating_label.dart';
import 'package:ecommerce_system_design/ecommerce_system_design.dart';
import 'package:ecommerce_system_design/foundation/app_colors.dart';
import 'package:ecommerce_system_design/foundation/app_spacing.dart';
import 'package:ecommerce_system_design/foundation/app_typography.dart';
import 'package:fake_store_package/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final ProductModel product;
  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sidePadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Center(child: Image.network(product.image ?? '', height: 250)),
                SizedBox(height: 20),
                CustomTitle(text: product.title, padding: EdgeInsets.zero),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      '\$${product.price.toString()}',
                      style: AppTypography.title.copyWith(fontSize: 24),
                    ),
                    Spacer(),
                    Counter(value: 1),
                  ],
                ),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        style: AppTypography.label.copyWith(),
                        children: [
                          TextSpan(
                            text: 'Category: ',
                            style: TextStyle(color: AppColors.primaryColor),
                          ),
                          TextSpan(text: product.category),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: AppColors.textBody,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(width: 8),
                    RatingLabel(
                      rate: product.rating?.rate?.toString() ?? '',
                      count: product.rating?.count?.toString() ?? '',
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(product.description ?? '', style: AppTypography.body),
                SizedBox(height: 20),
                CustomTextButton(text: 'Add to cart'),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
