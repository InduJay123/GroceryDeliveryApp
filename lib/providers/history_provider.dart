import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/products_model.dart';

class HistoryProvider extends ChangeNotifier{
  final List<Product> _history = [];
  List <Product> get histotys => _history;
  void toggleHistory(Product product){
    // if(_history.contains(product)){
    //   _history.remove(product);
    // }else{
    //   _history.add(product);
    // }
    _history.addAll(histotys);
    notifyListeners();
  }
  bool isExist (Product product) {
    final isExist = _history.contains((product));
    return isExist;
  }
  static HistoryProvider of(BuildContext context, { bool listen = true}){
    return Provider.of<HistoryProvider>(
      context,
      listen: listen,
    );
  }
}