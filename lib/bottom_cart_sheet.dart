import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thuchanh/model/cart_provider.dart';
import 'package:thuchanh/pages/payment_screen.dart';

class BottomCartSheet extends StatefulWidget {
  const BottomCartSheet({super.key});

  @override
  _BottomCartSheetState createState() => _BottomCartSheetState();
}

class _BottomCartSheetState extends State<BottomCartSheet> {
 
  List<String?> selectedSizes = [null, null, null, null];

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final List<String> sizes = ['29', '30', '31', '32', '33', '34'];

    return Material(
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        color: const Color(0xFFCEDDEE),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < cartProvider.cartItems.length; i++)
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 240,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F9FD),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFF9A826).withOpacity(0.3),
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, right: 70),
                                    height: 130,
                                    width: 110,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF476269),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  Image.asset(
                                    cartProvider.cartItems[i]['image'],
                                    height: 130,
                                    width: 130,
                                    fit: BoxFit.contain,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    cartProvider.cartItems[i]['name'],
                                    style: const TextStyle(
                                      color: Color(0xFFF9A826),
                                      fontSize: 23,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: DropdownButton<String>(
                                      hint: Text("Select Size"),
                                      value: selectedSizes[i] ?? 
                                              cartProvider.cartItems[i]['size'],
                                      items: sizes.map((size) {
                                        return DropdownMenuItem(
                                          value: size,
                                          child: Text(size),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedSizes[i] = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Text(
                                    "Size: ${selectedSizes[i] ?? cartProvider.cartItems[i]['size']}",
                                    style: const TextStyle(
                                      color: Color(0xFFF9A826),
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "\$${cartProvider.cartItems[i]['price'].toStringAsFixed(2)}",
                                    style: const TextStyle(
                                      color: Color(0xFFF9A826),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Quantity: ${cartProvider.cartItems[i]['quantity']}",
                                    style: const TextStyle(
                                      color: Color(0xFF475269),
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 65),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      cartProvider.removeFromCart(
                                          cartProvider.cartItems[i]);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('Xóa thành công'),
                                          duration: Duration(seconds: 3),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF9A826),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0xFFF9A826)
                                                .withOpacity(0.3),
                                            blurRadius: 5,
                                            spreadRadius: 1,
                                          ),
                                        ],
                                      ),
                                      child: const Icon(
                                        Icons.delete,
                                        color: Color(0xFF475269),
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F9FD),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFF9A826).withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 22,
                          color: Color(0xFFF9A826),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 9),
                      Text(
                        "\$${cartProvider.totalPrice.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color(0xFF475269),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentScreen(
                            cartItems: cartProvider.cartItems,
                            total: cartProvider.totalPrice,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9A826),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "Check Out",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
