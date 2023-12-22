import 'package:coffeeapp/Activities/proHomePage.dart';
import 'package:coffeeapp/Activities/pro_bottom_nav.dart';
import 'package:coffeeapp/Provider/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/item_model.dart';
import 'Home_Screen.dart';

class ProviderCart extends StatefulWidget {
  const ProviderCart({super.key});

  @override
  State<ProviderCart> createState() => _ProviderCartState();
}

class _ProviderCartState extends State<ProviderCart> {

  double total = 0.000;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<FavouriteItem>().updateTotalPrice();
       });
    print('cart screen open');
    // print('$itemdetaillists==============================');
    // context.read<FavouriteItem>().getUniqueItems(itemdetaillist);
    // updateTotalPrice();
  }

  @override
  Widget build(BuildContext context) {
    final cartitem =
    context.watch<FavouriteItem>().getUniqueItems(itemdetaillists);
    final itemCountMap =
    context.watch<FavouriteItem>().countItems(itemdetaillists);



    return Scaffold(
      appBar: AppBar(
        titleSpacing: 15,
        centerTitle: false,
        title: RichText(
          text: TextSpan(
            text: cartitem.length.toString(),
            style: const TextStyle(
              fontSize: 25,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Color(0xff583732),
            ),
            children: const <TextSpan>[
              TextSpan(
                text: ' items in cart',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: Color(0xff583732),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    reverse: true,
                    itemCount: cartitem.length,
                    itemBuilder: (context, index) {
                      final currentItem = cartitem[index];
                      final itemCount = itemCountMap[currentItem];

                      void dialog(int index) {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text("Are You Sure !!"),
                            content: const Text("You want to delete this item from cart?"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: const Text("NO"),
                              ),
                              TextButton(
                                onPressed: () {
                                  // cartitem.remove(index);
                                  Navigator.of(ctx).pop();
                                  context.read<FavouriteItem>().removeItemFromCart(currentItem);
                                  context.read<FavouriteItem>().updateTotalPrice();

                                },
                                child: const Text("YES"),
                              ),
                            ],
                          ),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffd9d9d9),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Image.asset(
                                      cartitem[index].image,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    height: 120,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Text(
                                            cartitem[index].name,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              color: Color(0xff583732),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10, top: 7),
                                              child: Text(
                                                '${context.watch<FavouriteItem>().getTotalItemPrice(cartitem[index])}',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xffd9c61c)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10),
                                                child: Material(
                                                  type:
                                                      MaterialType.transparency,
                                                  child: Ink(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(
                                                                0xff583732),
                                                            width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50)),
                                                    child: InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                      onTap: () {
                                                        if (itemCountMap
                                                            .containsKey(
                                                                cartitem[
                                                                    index])) {
                                                          if (context
                                                                  .read<
                                                                      FavouriteItem>()
                                                                  .getItemCount(
                                                                      currentItem) >
                                                              1) {
                                                            context
                                                                .read<
                                                                    FavouriteItem>()
                                                                .decrementItem(
                                                                    cartitem[
                                                                        index]);
                                                          } else {
                                                            dialog(index);
                                                          }
                                                          context
                                                              .read<
                                                                  FavouriteItem>()
                                                              .updateTotalPrice();
                                                        }
                                                      },
                                                      child: const Icon(
                                                        Icons.remove,
                                                        size: 20,
                                                        color:
                                                            Color(0xff583732),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                '${context.watch<FavouriteItem>().getItemCount(currentItem)}',
                                                style: const TextStyle(
                                                    color: Color(0xff583732),
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Poppins'),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Material(
                                                  type:
                                                      MaterialType.transparency,
                                                  child: Ink(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(
                                                                0xff583732),
                                                            width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50)),
                                                    child: InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                      onTap: () {
                                                        context
                                                            .read<
                                                                FavouriteItem>()
                                                            .addItems(
                                                                currentItem);
                                                        context
                                                            .read<
                                                                FavouriteItem>()
                                                            .updateTotalPrice();

                                                      },
                                                      child: const Icon(
                                                        Icons.add,
                                                        size: 20,
                                                        color:
                                                            Color(0xff583732),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              right: 0,
                              top: 10,
                              child: Material(
                                type: MaterialType.transparency,
                                child: Ink(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xffeb3223),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(100.0),
                                    onTap: () {
                                      dialog(index);

                                      context
                                          .read<FavouriteItem>()
                                          .updateTotalPrice();
                                    },
                                    child: const Icon(
                                      Icons.close,
                                      size: 22,
                                      color: Color(0xffeb3223),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Order Instruction',
                      style: TextStyle(color: Color(0xff583732)),
                    ),
                  ),
                  TextFormField(
                      cursorColor: const Color(0xff583732),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Color(0xff583732),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Color(0xff583732),
                            width: 1.5,
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
              child: Row(
                children: [
                  const Text(
                    'Total : ',
                    style: TextStyle(
                      color: Color(0xff583732),
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Rp.${context.watch<FavouriteItem>().total}',
                    style: const TextStyle(
                      color: Color(0xffd9c61c),
                      fontFamily: 'Poppins',
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 30, right: 30, bottom: 20),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      // print('${}==================)))))))))))===============');
                    },
                    child: Container(
                      width: 400,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0xff583732),
                      ),
                      child: const Center(
                        child: Text(
                          'CheckOut',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProviderBottomNavPage(),
                        ),
                        (route) => false);
                  },
                  child: const Text(
                    'Back to Menu',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff6d504c),
                        fontFamily: 'Poppins'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
