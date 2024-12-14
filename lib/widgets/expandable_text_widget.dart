import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({super.key, 
    required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  
  bool hiddenText=true;
  
  double textHeight = 10.00;
  
  @override
  void initState(){
    super.initState();
    if(widget.text.length > textHeight){
      firstHalf = widget.text.substring(0,textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);
    }else{
      firstHalf = widget.text;
      secondHalf = '';
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty ? SmallText(size: 16, color: paraColor, text: firstHalf) : Column(
        children: [
          SmallText(height: 1.6, color: paraColor,size: 16,text: hiddenText ? (firstHalf+'....') : (firstHalf+secondHalf)),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText=!hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(text: 'Show more', color: mainColor,),
                Icon(hiddenText ? Icons.arrow_drop_down : Icons.arrow_drop_up, color: mainColor,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
