import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

 class CustomSearchDelegate extends SearchDelegate{
  final List<String> _footBallers = [
    "Messi",
    "Ronaldo",
    "Lionel Messi",
    "Cristiano Ronaldo",
    "Neymar",
    "Lewis Hammett",
  ];
    @override
    List <Widget> buildActions(BuildContext context) {
      return [
        IconButton(icon: const Icon(Icons.clear), onPressed: () {
         query = '';
        }),
      ];
    }

    @override
    Widget buildLeading(BuildContext context) {
      return IconButton(
        onPressed: (){
          close(context, null);
        }, 
        icon: const Icon(Icons.arrow_back),
      );
    }

    @override
    Widget buildResults(BuildContext context) {
      List<String> _matchBallers = [];
      for(var baller in  _footBallers) {
        if(baller.toLowerCase(). contains(query.toLowerCase())){
          _matchBallers.add(baller);
        }
      }
      return ListView.builder(
        itemCount: _matchBallers.length,
        itemBuilder: (context, index){
          var result = _matchBallers[index];
          return ListTile(
            title: Text(result),
          );
        }
      );
    }

    @override
    Widget buildSuggestions(BuildContext context) {
      List<String> _matchBallers = [];
      for(var baller in  _footBallers) {
        if(baller.toLowerCase(). contains(query.toLowerCase())){
          _matchBallers.add(baller);
        }
      }
      return ListView.builder(
        itemCount: _matchBallers.length,
        itemBuilder: (context, index){
          var result = _matchBallers[index];
          return ListTile(
            title: Text(result),
          );
        }
      );
    }
  }

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.white,),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                  ),
                ),
              ),
              IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
               showSearch(
                context: context, 
                delegate: CustomSearchDelegate(),);
              }
            ),
            ],
          ),
        ],
      ),
    );
  }
}