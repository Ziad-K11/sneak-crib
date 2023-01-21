import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneak_crib/cart/pages/cart_screen.dart';
import 'package:sneak_crib/core/utils/const.dart';
import 'package:sneak_crib/core/utils/shared_prefrences.dart';
import 'package:sneak_crib/core/widgets/repository.dart';
import 'package:sneak_crib/home/cubit/home_cubit.dart';
import 'package:sneak_crib/login/pages/Login.dart';
import 'package:sneak_crib/core/models/product.dart';
import 'package:sneak_crib/contact_us/presentation/pages/contactus.dart';
import 'dart:io';

class NikeShoesHome extends StatefulWidget {
  const NikeShoesHome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NikeShoesHomeState();
  }
}

class _NikeShoesHomeState extends State<NikeShoesHome> {
  //members
  Repository repository = Repository();

  var categories = [
    "Basketball",
    "Running",
    "Training",
  ];

  List<Product> productList = [
    Product(
        group: "yellow",
        text: "Yellow Nike Air Jordon",
        price: "200\$",
        url: "assets/products/yellow1.png",
        primaryColor: const Color(0xfffcf938),
        textColor: const Color(0xfffcf938)),
    Product(
        group: "blue",
        text: "Blue Nike Air Jordon",
        price: "250\$",
        url: "assets/products/blue1.png",
        primaryColor: const Color(0xff927bd5),
        textColor: const Color(0xff927bd5)),
    Product(
        group: "black",
        text: "Black Nike Air Jordon",
        price: "300\$",
        url: "assets/products/black1.png",
        primaryColor: const Color(0xffde304a),
        textColor: const Color(0xffde304a)),
    Product(
        group: "grey",
        text: "Grey Nike Air Jordon",
        price: "350\$",
        url: "assets/products/grey1.png",
        primaryColor: const Color(0xff8e8b89),
        textColor: const Color(0xff8e8b89)),
  ];

  int _activeCategoryIndex = 0;

  final PageController _pageController = PageController(viewportFraction: 0.7);

  //navigation bg color method
  navColor() {
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarColor: bgColor,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarColor: bgColor,
        ),
      );
    }
  }

  @override
  void initState() {
    navColor();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: Image.asset(
          "assets/extra/logo.png",
          color: Colors.white60,
          //scale: 0.9,
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.segment,
              color: Colors.white60,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CartScreen()));
              },
              icon: const Icon(
                Icons.work_outline,
                color: Colors.white60,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                CacheHelper.removeData(key: 'uId');
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white60,
              ),
            ),
          ),
        ],
      ),
      body: _body(),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  /*
  *  home body
  * */
  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCategories(),
        _buildProductListview(),
      ],
    );
  }

  /* ======================
  ======== products listview =======
   */
  Widget _buildProductListview() {
    return SizedBox(
      height: 400,
      child: Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return _productItem(productList[index]);
          },
        ),
      ),
    );
  }

/*
  Widget _activeProductItem(int index) {
    return InkWell(
      onTap: ()=> print(index),
      child: Transform.scale(
        scale: 1,
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
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "NIKE AIR",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            letterSpacing: -1),
                      ),
                      const Text(
                        "AIR JORDAN 1 MID SE GC",
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          letterSpacing: -2,
                        ),
                      ),
                      const Text(
                        "\$200",
                        style: TextStyle(
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
                          child: const Icon(
                            Icons.add,
                            size: 28,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50)),
                            color: _activeProduct.primaryColor,
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
                margin: const EdgeInsets.only(bottom: 90),
                child: Transform.rotate(
                  angle: -math.pi / 6,
                  child: Hero(
                    tag: "tag",
                    child: Image.asset(
                      _activeProduct.url,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }*/

  Widget _productItem(Product product) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is UserHomeSuccessState) {
            const snackBar = SnackBar(
              content: Text("Product added to your cart"),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          return SizedBox(
            width: 350,
            child: InkWell(
              onTap: () {
                HomeCubit.get(context).addToCart(product);
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

  /*
  ===============
  ===== end products listview =========
  * */

  /* ================================
  ======= categories ==============
   */
  Widget _buildCategories() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: SizedBox(
          height: 40,
          child: ListView.builder(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _activeCategoryIndex == index
                    ? _activeCategory(index)
                    : _buildCategory(index);
              }),
        ));
  }

  Widget _activeCategory(int index) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        categories.elementAt(index),
        style: TextStyle(fontSize: 20, color: productList[index].primaryColor),
      ),
    );
  }

  Widget _buildCategory(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          if (_pageController.hasClients) {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
            );
          }
          _activeCategoryIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          categories.elementAt(index),
          style: const TextStyle(fontSize: 20, color: Colors.white60),
        ),
      ),
    );
  }

/* ================================
  ======= end categories ==============
   */

  /*
======= bottom nav =========
 */
  Widget _buildBottomNav() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 90,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: Colors.red,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.home_outlined),
          Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(5),
            child: const Icon(
              Icons.add_circle_outline,
            ),
            decoration: const BoxDecoration(
              color: Color(0xff1d1f21),
              shape: BoxShape.circle,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ContactPage()));
            },
          ),
        ],
      ),
    );
  }
}
