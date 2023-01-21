import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sneak_crib/cart/cubit/cart_cubit.dart';
import 'package:sneak_crib/core/utils/const.dart';
import 'package:sneak_crib/core/models/product.dart';
import 'dart:math' as math;

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => CartCubit()..getCart(),
        child: Container(
          child: (_buildProductListview()),
        ),
      ),
    );
  }
}

Widget _buildProductListview() {
  return BlocConsumer<CartCubit, CartState>(
    listener: (context, state) {},
    builder: (context, state) {
      return state is UserCartLoadingState
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: CartCubit.get(context).products.length,
                  itemBuilder: (context, index) {
                    return _productItem(CartCubit.get(context).products[index]);
                  },
                ),
              ),
            );
    },
  );
}

Widget _productItem(Product product) {
  return BlocProvider(
    create: (context) => CartCubit(),
    child: BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is UserCartRemoveSuccessState) {
          const snackBar = SnackBar(
            content: Text("Product Deleted"),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return SizedBox(
          width: 350,
          height: 350,
          child: InkWell(
            onLongPress: () {
              CartCubit.get(context).removeFromCart(text: product.text);
            },
            child: Transform.scale(
              scale: 0.85,
              child: Stack(
                children: [
                  LayoutBuilder(
                    builder: (context, layoutConstraints) {
                      return Container(
                        alignment: Alignment.topLeft,
                        width: layoutConstraints.maxWidth,
                        margin: const EdgeInsets.only(right: 30),
                        padding: const EdgeInsets.only(left: 30, top: 30),
                        decoration: const BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              product.text,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  letterSpacing: -1),
                            ),
                            Text(
                              product.price,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  letterSpacing: -2),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "NIKE AIR",
                                style: TextStyle(
                                  fontSize: 70,
                                  color: Colors.black12,
                                  letterSpacing: -6,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 100,
                                padding: const EdgeInsets.all(30),
                                alignment: Alignment.centerRight,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    bottomRight: Radius.circular(50),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  size: 28,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 70),
                      child: Transform.rotate(
                        angle: -math.pi / 6,
                        child: Image.asset(product.url),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
