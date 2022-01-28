import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';

import 'button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String previousNum='';
  String currentNum='';
  String result='';
  String prev_result="";
  String selectedOperation='';

  _onButtonPressed(String value){
    setState((){
      switch(value){
        case "/":
        case "*":
        case "-":
        case "+":
          if(previousNum!=''){
            _calculateResult();
          }
          else{
            previousNum=currentNum;
          }
          currentNum='';
          selectedOperation=value;
          break;

        case "+/-":
          currentNum=convertStringToDouble(currentNum) < 0 ?  currentNum.replaceAll("-", '') : "-$currentNum";
          result=currentNum;
          break;

        case "%":
          currentNum = (convertStringToDouble(currentNum)/100).toString();
          result=currentNum;
          break;

        case "=":
          _calculateResult();
          previousNum='';
          selectedOperation='';
          break;

        case "C":
          _resetCalci();
          break;
          default:
            currentNum=currentNum+value;
            result=currentNum;
            prev_result=previousNum;
      }


    });
  }

  void _calculateResult(){
    double _previousNum=convertStringToDouble(previousNum);

    double _currentNum=convertStringToDouble(currentNum);

    switch(selectedOperation){
      case "+" :_previousNum=_previousNum+_currentNum;
                break;

      case "-" :
        _previousNum=_previousNum - _currentNum;
                break;

      case "/" :
        _previousNum=_previousNum / _currentNum;
                 break;

      case "*" :
        _previousNum=_previousNum * _currentNum;
                 break;
      default:
                  break;
    }

    currentNum=(_previousNum % 1 == 0 ? _previousNum.toInt() : _previousNum ).toString();


    result=currentNum;


  }

  void _resetCalci(){
    previousNum='';
    currentNum='';
    result='';
    selectedOperation='';
    prev_result='';
  }

  convertStringToDouble(String number){
    return double.tryParse(number);
  }

  void _dragToDelete(){
    setState(() {
      if(result.length > 1){
        result=result.substring(0,result.length-1);
        currentNum=result;
      }else{
        result='';
        currentNum='';
      }
      
    });

  }

  // String _formatResult(String number){
  //   var formatter=NumberFormat("###,###.##","en_US");
  //   return formatter.format(number);
  // }
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffe2ebf0),
                  Color(0xffcfd9df),
                ])
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children:  [
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 25),
                   child: Text(prev_result,style:  const TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.brown),),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 18),
                   child: Text(selectedOperation,style:  const TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.brown),),
                 ),
               ],
             ),
             GestureDetector(
               onHorizontalDragEnd: (details) => {_dragToDelete()},
               child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 18),
                child: Text(result,style: TextStyle(fontSize: result.length > 5 ? 50 : 80  ,fontWeight: FontWeight.bold,color: Colors.black),),
            ),
             ),
             SizedBox(
              height: MediaQuery.of(context).size.height*0.61,
              child: Center(child: _buildButtonGrid()),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButtonGrid() => StaggeredGridView.countBuilder(
    crossAxisCount: 4,
    itemCount: buttons.length,
    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
    itemBuilder: (context,index){
      return MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 7,
        padding: const EdgeInsets.all(0),
        color:  (buttons[index].value == selectedOperation && currentNum != "") ? Colors.white :  buttons[index].bgColor,
        splashColor: Colors.purple,

        onPressed: () {
          _onButtonPressed(buttons[index].value);
        },
        child: Text(
          buttons[index].value,
          style: TextStyle(fontSize: buttons[index].value == '=' ? 55 : 30 , fontWeight: FontWeight.bold,
          color:  (buttons[index].value == selectedOperation && currentNum != "") ? Colors.black :  buttons[index].fgColor),),);
    },
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
    staggeredTileBuilder:(index)=> StaggeredTile.count( buttons[index].value == '=' ?  2:1,1),
  );

}