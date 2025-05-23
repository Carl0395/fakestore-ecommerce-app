import 'package:ecommerce_system_design/atoms/rating_label.dart';
import 'package:ecommerce_system_design/ecommerce_system_design.dart';
import 'package:ecommerce_system_design/foundation/app_colors.dart';
import 'package:ecommerce_system_design/foundation/app_spacing.dart';
import 'package:ecommerce_system_design/foundation/app_typography.dart';
import 'package:fake_e_commerce/core/extensions/widget_ref_parametrized_extension.dart';
import 'package:fake_store_package/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductPage extends ConsumerWidget {
  final ProductModel product;
  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(ref.text.details),
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
                CustomTitle(
                  text: product.title,
                  padding: EdgeInsets.zero,
                  color: ref.theme.textTitle,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      '\$${product.price.toString()}',
                      style: AppTypography.title.copyWith(
                        fontSize: 24,
                        color: ref.theme.textTitle,
                      ),
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
                            style: TextStyle(color: ref.theme.primaryColor),
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
                    Semantics(
                      label:
                          'Calificación de ${product.rating?.rate?.toString() ?? ''} estrellas con ${product.rating?.count?.toString() ?? ''} reseñas',
                      container: true,
                      excludeSemantics: true,
                      child: RatingLabel(
                        rate: product.rating?.rate?.toString() ?? '',
                        count: product.rating?.count?.toString() ?? '',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(product.description ?? '', style: AppTypography.body),
                SizedBox(height: 20),
                CustomTextButton(
                  text: 'Add to cart',
                  colorButton: ref.theme.primaryButton,
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
