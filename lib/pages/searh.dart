import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/home/search_bar.dart';
import 'package:food_delivery_app/pages/navigation_bar.dart';
import '../utils/colors.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  final List<Map<String, dynamic>> _allUsers = [
    {"id": 0, "name": "Vegitable"},
    {"id": 1, "name": "Fruits"},
    {"id": 2, "name": "Diary Products" },
    {"id": 3, "name": "Chocolate Puff Pastry"},
    {"id": 4, "name": "Snacks"},
    {"id": 5, "name": "Canned goods"},
    {"id": 6, "name": "Condaments"},
    {"id": 7, "name": "Pasta"},
    {"id": 8, "name": "Rice"},
    {"id": 9, "name": "Coconut Milk Powder"},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {

    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height*0.05,
          right: MediaQuery.of(context).size.width*0.05,
          left: MediaQuery.of(context).size.width*0.05,),
          child: Column(
            children: [
              Positioned(
                  top: 45,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NavigationBarScreen()),
                          ); // Navigate to the home page
                        },
                      ),
                    ],
                  )
              ),
            TextField(
              onChanged: (value) => _runFilter(value),
               decoration: const InputDecoration(
                  labelText: 'search your grocery', prefixIcon: Icon(Icons.search)),
             ),
            Expanded(
               child: _foundUsers.isNotEmpty
                ? ListView.builder(
                  itemCount: _foundUsers.length,
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      leading:
                      Text(_foundUsers[index]['name'], style:TextStyle(fontSize: 15,
                        color:Colors.black87
                    )),
                    ),
                  ),
                )
              : const Text(
                'No results found',
                  style: TextStyle(fontSize: 24),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
