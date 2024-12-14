import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import '../models/products_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{
  final List<Product> _cart = [];
  List <Product> get cart => _cart;
  void toogleFavourite (Product product){
    if(_cart.contains(product)){
      for(Product element in _cart){
        element.quantity++;
      }
    }else{
      _cart.add(product);
    }
    notifyListeners();
  }
  //for increment
  incrementQtn(int index){
    _cart[index].quantity++;
    notifyListeners();
  }

  //for decrement
  decrementQtn(int index){
    if(_cart[index].quantity <= 1){
      return;
    }
    _cart[index].quantity--;
    notifyListeners();
  }

  //for total amount
  totalPrice(){
    double myTotal = 0.0; //initali
    for(Product element in _cart){
      myTotal += element.price * element.quantity;
    }
    return myTotal;
  }

  static CartProvider of(BuildContext context ,{bool listen = true}){
    return Provider.of<CartProvider> (
        context,
        listen: listen
    );
  }
}