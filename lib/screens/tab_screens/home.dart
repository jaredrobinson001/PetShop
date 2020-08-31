import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mollet/model/data/Products.dart';
import 'package:mollet/model/notifiers/cart_notifier.dart';
import 'package:mollet/model/notifiers/products_notifier.dart';
import 'package:mollet/model/services/Product_service.dart';
import 'package:mollet/screens/tab_screens/search_screens/search_tabs.dart';
import 'package:mollet/utils/colors.dart';
import 'package:mollet/utils/internetConnectivity.dart';
import 'package:mollet/widgets/allWidgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    checkInternetConnectivity().then((value) => {
          value == true
              ? () {
                  // BrandsNotifier brandsNotifier =
                  //     Provider.of<BrandsNotifier>(context, listen: false);
                  // getBrands(brandsNotifier);

                  ProductsNotifier productsNotifier =
                      Provider.of<ProductsNotifier>(context, listen: false);
                  getProdProducts(productsNotifier);

                  CartNotifier cartNotifier =
                      Provider.of<CartNotifier>(context, listen: false);
                  getCart(cartNotifier);
                }()
              : showNoInternetSnack(_scaffoldKey)
        });

    _tabController = TabController(
      length: _tabItems.length,
      vsync: this,
    );

    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageStorageBucket searchBucket = PageStorageBucket();

  TabController _tabController;
  final _tabItems = [
    "All",
    "Dogs",
    "Cats",
    "Fish",
    "Birds",
    "Reptiles",
    "Others",
  ];

  @override
  Widget build(BuildContext context) {
    ProductsNotifier productsNotifier = Provider.of<ProductsNotifier>(context);
    var prods = productsNotifier.productsList;

    CartNotifier cartNotifier = Provider.of<CartNotifier>(context);
    var cartList = cartNotifier.cartList;
    var cartProdID = cartList.map((e) => e.productID);

    //Tab Items
    final _tabBody = [
      buildAllBody(prods, cartProdID),
      buildDogBody(prods, cartProdID),
      buildCatBody(prods, cartProdID),
      buildDogBody(prods, cartProdID),
      buildCatBody(prods, cartProdID),
      buildDogBody(prods, cartProdID),
      buildCatBody(prods, cartProdID),
    ];

    return Scaffold(
      key: _scaffoldKey,
      appBar: primaryAppBar(
        null,
        TabBar(
          unselectedLabelColor: MColors.textGrey,
          unselectedLabelStyle: normalFont(MColors.textGrey, 16.0),
          labelColor: MColors.primaryPurple,
          labelStyle: boldFont(MColors.primaryPurple, 20.0),
          indicatorWeight: 0.01,
          isScrollable: true,
          tabs: _tabItems.map((e) {
            return Tab(
              child: Text(
                e,
              ),
            );
          }).toList(),
          controller: _tabController,
        ),
        MColors.primaryWhiteSmoke,
        null,
        false,
        null,
      ),
      body: PageStorage(
        bucket: searchBucket,
        child: Container(
          color: MColors.primaryWhiteSmoke,
          child: prods.isEmpty
              ? progressIndicator(MColors.primaryPurple)
              : TabBarView(
                  physics: BouncingScrollPhysics(),
                  children: _tabBody,
                  controller: _tabController,
                ),
        ),
      ),
    );
  }

  //Build Tabs
  Widget buildAllBody(prods, cartProdID) {
    Iterable<ProdProducts> all = prods.reversed;
    CartNotifier cartNotifier =
        Provider.of<CartNotifier>(context, listen: false);
    ProductsNotifier productsNotifier =
        Provider.of<ProductsNotifier>(context, listen: false);

    return SearchTabWidget(
      prods: all,
      cartNotifier: cartNotifier,
      productsNotifier: productsNotifier,
      cartProdID: cartProdID,
    );
  }

  Widget buildDogBody(prods, cartProdID) {
    Iterable<ProdProducts> dog = prods.where((e) => e.pet == "dog");
    CartNotifier cartNotifier =
        Provider.of<CartNotifier>(context, listen: false);
    ProductsNotifier productsNotifier = Provider.of<ProductsNotifier>(context);

    return SearchTabWidget(
      prods: dog,
      cartNotifier: cartNotifier,
      productsNotifier: productsNotifier,
      cartProdID: cartProdID,
    );
  }

  Widget buildCatBody(prods, cartProdID) {
    Iterable<ProdProducts> cat = prods.where((e) => e.pet == "cat");
    CartNotifier cartNotifier =
        Provider.of<CartNotifier>(context, listen: false);
    ProductsNotifier productsNotifier = Provider.of<ProductsNotifier>(context);

    return SearchTabWidget(
      prods: cat,
      cartNotifier: cartNotifier,
      productsNotifier: productsNotifier,
      cartProdID: cartProdID,
    );
  }
}
