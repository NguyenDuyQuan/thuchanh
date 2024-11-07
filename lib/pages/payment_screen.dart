import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;
  final double total;

  PaymentScreen({super.key, required this.cartItems, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Thanh toán")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            const Text(
              "Chi tiết đơn hàng",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  var item = cartItems[index];
                  return ListTile(
                    leading: Image.asset(
                      item['image'],
                      height: 50,
                      width: 50,
                    ),
                    title: Text(item['name']),
                    subtitle: Text("Size: ${item['size']}"),
                    trailing: Text(
                      "\$${(item['price'] * item['quantity']).toStringAsFixed(2)}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
            ),
            
            Text(
              "Tổng tiền: \$${total.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            
            const Text(
              "Địa chỉ giao hàng",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nhập địa chỉ của bạn',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

           
            const Text(
              "Phương thức thanh toán",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Radio(value: 1, groupValue: 1, onChanged: (value) {}),
                const Text("Thẻ tín dụng"),
                Radio(value: 2, groupValue: 1, onChanged: (value) {}),
                const Text("Thanh toán khi nhận hàng"),
              ],
            ),
            const SizedBox(height: 20),

            // Nút thanh toán
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Xử lý thanh toán ở đây
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Thanh toán thành công"),
                      content: const Text("Cảm ơn bạn đã mua sắm!"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Đóng dialog
                            Navigator.pop(context); // Quay lại trang trước
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text("Thanh toán"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 60), backgroundColor: Colors.orange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
