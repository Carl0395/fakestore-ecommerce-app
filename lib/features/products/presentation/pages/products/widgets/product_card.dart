import 'package:ecommerce_system_design/atoms/rating_label.dart';
import 'package:ecommerce_system_design/ecommerce_system_design.dart';
import 'package:ecommerce_system_design/foundation/app_colors.dart';
import 'package:ecommerce_system_design/foundation/app_spacing.dart';
import 'package:ecommerce_system_design/foundation/app_typography.dart';
import 'package:fake_e_commerce/core/route/routes.dart';
import 'package:fake_store_package/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => Navigator.pushNamed(
            context,
            Routes.productDetail,
            arguments: product,
          ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: CardBox(
          child: Padding(
            padding: EdgeInsets.all(AppSpacing.insideCard),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (product.image != null)
                      Center(child: Image.network(product.image!, height: 100)),
                    SizedBox(height: 10),
                    Text(
                      product.title ?? '',
                      maxLines: 2,
                      style: AppTypography.labelSmall.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    RatingLabel(
                      rate: product.rating?.rate?.toString() ?? '',
                      count: product.rating?.count?.toString() ?? '',
                    ),
                    Text(
                      '\$${product.price ?? ''}',
                      style: AppTypography.label.copyWith(
                        color: AppColors.tertiaryColor,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: CircleButton(
                    onTap: () {},
                    size: 36,
                    icon: Icons.add,
                    color: AppColors.primaryButton,
                    iconColor: AppColors.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
