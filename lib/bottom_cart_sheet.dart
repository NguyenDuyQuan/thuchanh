import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:thuchanh/pages/payment_screen.dart';


class BottomCartSheet extends StatefulWidget {
  const BottomCartSheet({super.key});

  @override
  _BottomCartSheetState createState() => _BottomCartSheetState();
}

class _BottomCartSheetState extends State<BottomCartSheet> {
  List<Map<String, dynamic>> cartItems = [
    {
      "name": "Nike Shoe",
      "price": 50,
      "quantity": 2,
      "image": "images/1.png",
      "size": "28"
    },
    {
      "name": "Nike Shoe",
      "price": 75,
      "quantity": 1,
      "image": "images/2.png",
      "size": "30"
    },
    {
      "name": "Nike Shoe",
      "price": 60,
      "quantity": 3,
      "image": "images/3.png",
      "size": "34"
    },
  ];

  final List<String> availableSizes = [
    "28","29","30","31","32","33","34","35"
  ];

  double getTotal() {
    return cartItems.fold(
        0, (sum, item) => sum + item['price'] * item['quantity']);
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Xóa thành công'),
        duration: Duration(seconds: 3),
      ),
    );
    
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context);  
    });
  }

  void updateSize(int index, String newSize) {
    setState(() {
      cartItems[index]['size'] = newSize;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    for (int i = 0; i < cartItems.length; i++)
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 210,
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
                                    cartItems[i]['image'],
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
                                    cartItems[i]['name'],
                                    style: const TextStyle(
                                      color: Color(0xFFF9A826),
                                      fontSize: 23,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "Size: ",
                                        style: TextStyle(
                                          color: Color(0xFFF9A826),
                                          fontSize: 16,
                                        ),
                                      ),
                                      DropdownButton<String>(
                                        value: cartItems[i]['size'],
                                        items: availableSizes
                                            .map((size) => DropdownMenuItem(
                                                  value: size,
                                                  child: Text(size),
                                                ))
                                            .toList(),
                                        onChanged: (newSize) {
                                          if (newSize != null) {
                                            updateSize(i, newSize);
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () => setState(() {
                                          if (cartItems[i]['quantity'] > 1) {
                                            cartItems[i]['quantity']--;
                                          }
                                        }),
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFF5F9FD),
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
                                            CupertinoIcons.minus,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          cartItems[i]['quantity'].toString(),
                                          style: const TextStyle(
                                            color: Color(0xFFF9A826),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () => setState(() {
                                          cartItems[i]['quantity']++;
                                        }),
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFF5F9FD),
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
                                            CupertinoIcons.add,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                      height: 10),
                                  Text(
                                    "\$${(cartItems[i]['price'] * cartItems[i]['quantity']).toStringAsFixed(2)}",
                                    style: const TextStyle(
                                      color: Color(0xFFF9A826),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
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
                                    onTap: () => removeItem(i),
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
                        "\$${getTotal().toStringAsFixed(2)}",
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
                            cartItems: cartItems,
                            total: getTotal(),
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
