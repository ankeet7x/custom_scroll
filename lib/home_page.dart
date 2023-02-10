import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget horizontalList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          "First",
          "Second",
          "Third",
          "Fourth",
          "Fifth",
          "Sixth",
          "Seventh",
        ]
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Chip(
                    label: Text(e.toString()),
                  ),
                ))
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: horizontalList(),
          ),
          SliverAppBar(
            title: horizontalList(),
            pinned: true,
            titleSpacing: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          SliverToBoxAdapter(
            child: horizontalList(),
          ),
          SliverAppBar(
            title: horizontalList(),
            pinned: true,
            titleSpacing: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          SliverToBoxAdapter(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: ((context, index) => const SizedBox(
                    height: 5,
                  )),
              shrinkWrap: true,
              itemCount: 50,
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  alignment: Alignment.center,
                  color: Colors.yellow,
                  width: double.infinity,
                  child: Text("$index"),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
