import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../searh.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Search()),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.06,
            vertical: MediaQuery.of(context).size.height*0.001),
        child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              decoration: BoxDecoration(
                color: searchBarBgColor,
                borderRadius: BorderRadius.circular(100),
                // border: Border.all(
                //   color: searchBarBorderColor,
                //   width: 2,
                // ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: signColor,
                    size: 30,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                  const Expanded(
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: "search your grocery",
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Colors.black26,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 9),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
