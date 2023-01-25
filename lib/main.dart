import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _scrollController = FixedExtentScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("Clickable List Wheel View",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),
          centerTitle: true,
        ),
        body: ClickableListWheelScrollView(
          scrollController: _scrollController,
          itemHeight: 60,
          itemCount: 100,
          onItemTapCallback: (index) {
            print("onItemTapCallback index: $index");
          },
          child: ListWheelScrollView.useDelegate(
            controller: _scrollController,
            itemExtent: 60,
            physics: const FixedExtentScrollPhysics(),
            overAndUnderCenterOpacity: 0.5,
            perspective: 0.002,
            onSelectedItemChanged: (index) {
              print("onSelectedItemChanged index: $index");
            },
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index){
                return SizedBox(
                  height: 60,
                  child: ListTile(
                    leading: Icon(IconData(int.parse("0xe${index + 200}"), fontFamily: 'MaterialIcons'), size: 30,color: Colors.black,),
                    title: const Text('Heart Shaker'),
                    subtitle: const Text('Description here',style: TextStyle(fontSize: 10),),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,size: 18,color: Colors.black,),
                  ),
                );
              },
              childCount: 100,
            ),
          ),
        ),
      ),
    );
  }
}