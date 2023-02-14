import 'package:api_2/remote_database.dart';
import 'package:flutter/material.dart';

import 'model.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  final RemoteApi data = RemoteApi();
 late final Future<List<NewsModel>> model;
  @override
  void initState() {
    model = data.getApiNews();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: model,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.separated(
              separatorBuilder: (context, index) => Divider(color: Colors.green,thickness: 2,),
              itemBuilder: (context,index){
              return ListTile(title: Text('${snapshot.data![index].title}'),);
            },
              itemCount: snapshot.data!.length,
            );
          }else if(snapshot.hasError){
            return const CircularProgressIndicator(color: Colors.red,);
          }
          return Center(child: CircularProgressIndicator(color: Colors.blue,));
        },
      ),
    );
  }
}
