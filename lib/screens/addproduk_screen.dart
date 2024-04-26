import 'package:flutter/material.dart';
import 'package:product/screens/home_screen.dart';
import 'package:product/services/produk_service.dart';

class FormAddProduct extends StatefulWidget {
  const FormAddProduct({super.key});

  @override
  State<FormAddProduct> createState() => _FormAddProductState();
}

class _FormAddProductState extends State<FormAddProduct> {
  final TextEditingController _controller_1 = TextEditingController();
  final TextEditingController _controller_2 = TextEditingController();
  final ProductService _productService = ProductService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Input Product"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueGrey,
      ),
      floatingActionButton: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const ListProduct()));
          },
          icon: Icon(Icons.keyboard_backspace)),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller_1,
                    decoration: InputDecoration(hintText: 'Product Code'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller_2,
                    decoration: InputDecoration(hintText: 'Product Name'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 200,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FloatingActionButton(
                onPressed: () {
                  _productService.addProductItem(
                      _controller_1.text, _controller_2.text, context);
                  _controller_1.clear();
                  _controller_2.clear();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const ListProduct()));
                },
                child: const Text("Input Product"),
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
