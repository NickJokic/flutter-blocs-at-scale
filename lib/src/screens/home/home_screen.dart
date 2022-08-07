import 'package:blocs_at_scale/src/blocs/index.dart';
import 'package:blocs_at_scale/src/config/routing/app_route_name.dart';
import 'package:blocs_at_scale/src/config/theme/app_constants.dart';
import 'package:blocs_at_scale/src/models/product_model.dart';
import 'package:blocs_at_scale/src/screens/home/components/home_screen_heading.dart';
import 'package:blocs_at_scale/src/screens/home/components/product_card/home_screen_product_card.dart';
import 'package:blocs_at_scale/src/screens/home/home_scaffold.dart';
import 'package:blocs_at_scale/src/utility_widgets/misc/bottom_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<ProductBloc>().add(FetchRemoteData());
    context.read<UserBlocV2>().add(FetchRemoteData());
    context.read<CartBloc>().add(InitializeCart());
    super.initState();
  }

  void _onCartCTAPressed(BuildContext context) => Navigator.of(context).pushNamed(AppRouteName.cart);

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      onCartCTAPressed: () => _onCartCTAPressed(context),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppConstants.kAppMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Heading
              const HomeScreenHeading(),

              // Product Card List
              BlocBuilder<ProductBloc, RemoteDataState<List<Product>>>(
                builder: (context, productState) {
                  List<Product?> _productList = [null, null, null, null, null, null];

                  if (productState is RemoteDataInitialized) {
                    _productList = (productState as RemoteDataInitialized).data;
                  }

                  return MasonryGridView.builder(
                    itemCount: _productList.length,
                    gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    mainAxisSpacing: 44,
                    crossAxisSpacing: AppConstants.kAppMargin,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => BlocBuilder<CartBloc, CartState>(
                      builder: (context, cartState) {
                        final int _productQuantity = cartState is CartInitialized && _productList[index] != null
                            ? cartState.storage.getProductQuantity(_productList[index]!.id)
                            : 0;
                        return HomeScreenProductCard(
                          quantity: _productQuantity,
                          product: _productList[index],
                          index: index,
                        );
                      },
                    ),
                  );
                },
              ),

              const BottomSpacer(),
            ],
          ),
        ),
      ),
    );
  }
}
