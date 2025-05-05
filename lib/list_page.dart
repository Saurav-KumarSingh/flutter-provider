import 'package:flutter/material.dart';
import 'package:flutter_basic/add_list_data.dart';
import 'package:flutter_basic/list_map_provider.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Consumer<ListMapProvider>(
          builder: (ctx,provider,__){
            var allData=provider.getData();
        return allData.isNotEmpty ? ListView.builder(
          itemCount: allData.length,
            itemBuilder: (context,index){
        return ListTile(
          title: Text('${allData[index]['Name']}'),
          subtitle: Text('${allData[index]['Mobileno']}'),
        );
        }):Center(child: Text("No data Available!"),);
      })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddListData()));
        },
        child: Icon(Icons.add),
      ),

    );
  }
}
