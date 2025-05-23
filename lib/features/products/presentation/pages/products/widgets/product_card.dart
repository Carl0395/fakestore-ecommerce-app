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
  final Color? titleProductColor;
  final Color? priceProductColor;
  final Color? ratingIconColor;
  final Color? addButtonColor;
  const ProductCard({
    super.key,
    required this.product,
    this.titleProductColor,
    this.priceProductColor,
    this.ratingIconColor,
    this.addButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      button: true,
      label: product.title ?? 'Producto',
      hint: 'Presiona dos veces para ver el detalle del producto',
      child: GestureDetector(
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
                        ExcludeSemantics(
                          child: Center(
                            child: Image.network(product.image!, height: 100),
                          ),
                        ),
                      SizedBox(height: 10),
                      ExcludeSemantics(
                        child: Text(
                          product.title ?? '',
                          maxLines: 2,
                          style: AppTypography.labelSmall.copyWith(
                            color: titleProductColor ?? AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
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
                      Semantics(
                        label: 'Precio: \$${product.price ?? ''}',
                        excludeSemantics: true,
                        container: true,
                        child: Text(
                          '\$${product.price ?? ''}',
                          style: AppTypography.label.copyWith(
                            color: priceProductColor ?? AppColors.tertiaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Semantics(
                      label: 'Botón añadir al carrito',
                      hint: 'Presiona dos veces para agregar',
                      container: true,
                      excludeSemantics: true,
                      child: CircleButton(
                        onTap: () {},
                        size: 36,
                        icon: Icons.add,
                        color: addButtonColor ?? AppColors.primaryButton,
                        iconColor: AppColors.secondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
