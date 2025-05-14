import 'package:ecommerce_system_design/atoms/custom_shimmer.dart';
import 'package:ecommerce_system_design/ecommerce_system_design.dart';
import 'package:ecommerce_system_design/foundation/app_spacing.dart';
import 'package:ecommerce_system_design/molecules/ad_widget.dart';
import 'package:ecommerce_system_design/organisms/products_grid.dart';
import 'package:fake_e_commerce/core/route/routes.dart';
import 'package:fake_e_commerce/features/products/presentation/pages/products/search.dart';
import 'package:fake_e_commerce/features/products/presentation/pages/products/widgets/product_card.dart';
import 'package:fake_e_commerce/features/products/presentation/providers/category_provider.dart';
import 'package:fake_e_commerce/features/products/presentation/providers/filter_query_provider.dart';
import 'package:fake_e_commerce/features/products/presentation/providers/products_provider.dart';
import 'package:fake_e_commerce/main.dart';
import 'package:fake_e_commerce/shared/dialogs.dart';
import 'package:fake_e_commerce/shared/util.dart';
import 'package:fake_store_package/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsPage extends ConsumerStatefulWidget {
  const ProductsPage({super.key});

  @override
  ProductsPageState createState() => ProductsPageState();
}

class ProductsPageState extends ConsumerState<ProductsPage> {
  bool focused = false;
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    overlayState = Overlay.of(context);
    modalLoadingOverlay = Dialogs.getModalLoadingOverlay(context);

    bool filterActive = focused || searchController.text.isNotEmpty;

    final products = ref.watch(getProductsByCategoryAndQueryProvider);
    final categories = ref.watch(getCategoriesProvider);
    final currentCategory = ref.watch(currentCategoryProvider);

    ProductModel? productAd;

    if (products.hasValue) {
      final limit = products.value?.length ?? 0;
      if (limit > 0) {
        productAd = products.value?[Util.getRandomNumber(limit)];
      }
    }
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: 'Fake Store App',
                onCart: () => Navigator.pushNamed(context, Routes.cart),
                onProfile: () => Navigator.pushNamed(context, Routes.login),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sidePadding,
                ),
                child: Search(
                  hintText: 'Search',
                  controller: searchController,
                  onFocus: (focus) {
                    focused = focus;
                    setState(() {});
                  },
                  onChange: (query) {
                    ref.read(filterQueryProvider.notifier).changeQuery(query);
                  },
                ),
              ),
              SizedBox(height: 10),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOut,
                height: filterActive ? 0 : 180,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sidePadding,
                  ),
                  child: AdWidget(
                    label: productAd?.title,
                    imageUrl: productAd?.image,
                    price: productAd?.price?.toString(),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOut,
                height: filterActive ? 0 : 60,
                child: CustomTitle(text: 'Categories'),
              ),

              categories.when(
                data:
                    (data) => TagHorizontalList(
                      tags: data,
                      selectedTag: currentCategory,
                      onTag:
                          (tag) => ref
                              .read(currentCategoryProvider.notifier)
                              .changeCategory(tag),
                    ),
                error: (error, stackTrace) => Text(error.toString()),
                loading:
                    () => CustomShimmer(
                      child: TagHorizontalList(tags: List.filled(5, 'loading')),
                    ),
              ),

              CustomTitle(text: 'Products'),

              products.when(
                error: (error, stackTrace) => Text(error.toString()),
                loading:
                    () => Container(
                      padding: EdgeInsets.only(top: 40),
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(),
                    ),
                data:
                    (items) => ProductsGrid(
                      items: items,
                      itemBuilder: (c, product) {
                        return ProductCard(product: product);
                      },
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
