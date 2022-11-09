import 'package:flutter/material.dart';
import 'package:velorant/service/map_service.dart';

import '../model/school_model.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  TextEditingController searchController = TextEditingController();
  String searchText = '';
  var x = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          onChanged: (value) {
            setState(() {
              searchText = value;
            });
          },
        ),
      ),
      body: FutureBuilder(
        future: SchoolService.schoolService(),
        builder: (BuildContext context, AsyncSnapshot<SchoolModel?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var info = snapshot.data!.clients;
            // print("length======>${info.length}");
            print("Text======>${searchText}");
            if (searchText.isNotEmpty) {
              info = info?.where((element) {
                return element.name
                    .toString()
                    .toLowerCase()
                    .contains(searchText.toLowerCase());
              }).toList();
            }
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: info?.length,
              itemBuilder: (context, index) {
                x.add(info![index].name);
                print('LISRT$x');
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text('${info[index].name}'),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
