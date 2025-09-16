import 'package:cerci_online/common/widgets/buttons/common_button.dart';
import 'package:cerci_online/features/cart/presentation/store/cart_store.dart';
import 'package:cerci_online/features/register/presentataion/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CartTotalSection extends StatelessWidget {
  const CartTotalSection({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.watch<CartStore>();
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Toplam : ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "${store.totalPrice.toStringAsFixed(2)} ₺",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          CommonButton(
            onPressed: () {
              //TODO:Kayıtlı ise Sepeti onayla sayfasına değilse register'a yönlendirilecek
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const RegisterPage()),
              );
            },
            text: "Sepeti Onayla",
            horizontalPadding: 65.w,
            verticalPadding: 12.h,
          ),
        ],
      ),
    );
  }
}
