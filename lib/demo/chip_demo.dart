import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {

   List<String> tags = ['李白','王安石','白居易'];
   String action = 'noting';
   List<String> filters = [];
   String choice = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              spacing: 10,
              children: <Widget>[
                Chip(
                  label: Text('chip'),
                ),
                Chip(
                  label: Text('杜甫'),
                  backgroundColor: Colors.yellow,
                ),
                Chip(
                  label: Text('李白'),
                  backgroundColor: Colors.yellow,
                  avatar: CircleAvatar(backgroundColor: Colors.blue,child:
                  Text('曹',style: TextStyle(color: Colors.white),),),
                ),
                Chip(
                  label: Text('白居易'),
                  backgroundColor: Colors.yellow,
                  avatar: CircleAvatar(backgroundColor: Colors.blue,child:
                  Text('曹',style: TextStyle(color: Colors.white),),),
                ),
                Chip(
                  label: Text('王安石'),
                  backgroundColor: Colors.yellow,
                  avatar: CircleAvatar(backgroundColor: Colors.blue,child:
                  Text('曹',style: TextStyle(color: Colors.white),),),
                ),
                Chip(
                  label: Text('chipchipchip'),
                  backgroundColor: Colors.yellow,
                  avatar: CircleAvatar(backgroundImage: NetworkImage('https://c-ssl.duitang.com/uploads/item/201507/07/20150707225339_NxT3C.jpeg'),
                  ),
                ),
                Chip(
                  label: Text('删除'),
                  onDeleted: (){},
                ),
                Chip(
                  label: Text('删除'),
                  onDeleted: (){},
                  deleteIcon: Icon(Icons.add),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Wrap(
                  spacing: 10.0,
                  children: tags.map((tag){
                    return Chip(
                      label:Text(tag),
                      onDeleted:(){
                        setState(() {
                          tags.remove(tag);
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Text(action),
                Wrap(
                  spacing: 10.0,
                  children: tags.map((tag){
                    return ActionChip(
                      label:Text(tag),
                     onPressed: (){
                      setState(() {
                        action = tag;
                      });
                     },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Text(filters.toString()),
                Wrap(
                  spacing: 10.0,
                  children: tags.map((tag){
                    return FilterChip(
                      label:Text(tag),
                      selected: filters.contains(tag),
                      onSelected: (value){
                       setState(() {
                         if(filters.contains(tag)){
                           filters.remove(tag);
                         }else{
                           filters.add(tag);
                         }
                       });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Text(choice),
                Wrap(
                  spacing: 10.0,
                  children: tags.map((tag){
                    return ChoiceChip(
                      label:Text(tag),
                      selected: choice == tag,
                      onSelected: (value){
                       setState(() {
                         choice = tag;
                       });
                      },
                    );
                  }).toList(),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
       setState(() {
         tags = ['李白','王安石','杜甫',];
         filters = [];
       });
      },child: Icon(Icons.restore),),
    );;
  }
}
