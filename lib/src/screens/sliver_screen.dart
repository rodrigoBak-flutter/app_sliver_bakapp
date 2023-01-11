import 'package:flutter/material.dart';

class SliverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _Titulo(),
      //body: _ListaTareas(),
      // ignore: prefer_const_literals_to_create_immutables
      body: Stack(
        children: [
          const _MainScroll(),
          Positioned(
            bottom: -10,
            right: 0,
            child: _ButtonNewList(),
          ),
        ],
      ),
    );
  }
}

class _ButtonNewList extends StatelessWidget {
  const _ButtonNewList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ButtonTheme(
        minWidth: size.width * 0.9,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xffED6762)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(50))))),
            child: Container(
              height: size.height * 0.1,
              width: size.width * 0.7,
              // ignore: prefer_const_constructors
              child: Center(
                child:const Text(
                  'CREATE A NEW LIST',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                ),
              ),
            ),
            onPressed: () {}));
  }
}

class _MainScroll extends StatelessWidget {
  const _MainScroll({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final items = [
      const _ListItem(color: Colors.orange, titulo: 'Hola'),
      const _ListItem(color: Colors.deepOrange, titulo: 'Hola'),
      const _ListItem(color: Colors.lightBlue, titulo: 'Hola'),
      const _ListItem(color: Colors.lightGreen, titulo: 'Hola'),
      const _ListItem(color: Colors.purple, titulo: 'Hola'),
      const _ListItem(color: Colors.black, titulo: 'Hola'),
      const _ListItem(color: Colors.pink, titulo: 'Hola'),
    ];

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        /*
          SliverAppBar(
          floating: true,
          elevation: 0,
          title: _Titulo()
        ),
         */
        SliverPersistentHeader(
          floating: true,
          delegate: _SilverCustomHeaderDelegate(
              maxheight: size.height * 0.25,
              minheight: size.height * 0.23,
              child: Container(
                alignment: Alignment.centerLeft,
                color: Colors.white,
                child: _Titulo(),
              )),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              ...items,
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SilverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minheight;
  final double maxheight;
  final Widget child;

  _SilverCustomHeaderDelegate({
    required this.minheight,
    required this.maxheight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return SizedBox.expand(child: child);
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxheight;

  @override
  // TODO: implement minExtent
  double get minExtent => minheight;

  @override
  bool shouldRebuild(covariant _SilverCustomHeaderDelegate oldDelegate) {
    return maxheight != oldDelegate.maxheight ||
        minheight != oldDelegate.minheight ||
        child != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: const Text(
              'NEW',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            )),
        Stack(
          children: [
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: const Text(
                  'List',
                  style: TextStyle(
                    // color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                )),
          ],
        )
      ],
    );
  }
}

class _ListaTareas extends StatelessWidget {
  _ListaTareas({
    Key? key,
  }) : super(key: key);

  final item = [
    const _ListItem(color: Colors.orange, titulo: 'Hola'),
    const _ListItem(color: Colors.deepOrange, titulo: 'Hola'),
    const _ListItem(color: Colors.lightBlue, titulo: 'Hola'),
    const _ListItem(color: Colors.lightGreen, titulo: 'Hola'),
    const _ListItem(color: Colors.purple, titulo: 'Hola'),
    const _ListItem(color: Colors.black, titulo: 'Hola'),
    const _ListItem(color: Colors.pink, titulo: 'Hola'),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: item.length,
      itemBuilder: (_, int index) => item[index],
    );
  }
}

class _ListItem extends StatefulWidget {
  final Color color;
  final String titulo;
  const _ListItem({
    Key? key,
    required this.color,
    required this.titulo,
  }) : super(key: key);

  @override
  State<_ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<_ListItem> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      height: size.height * 0.2,
      decoration: BoxDecoration(
          color: widget.color, borderRadius: BorderRadius.circular(30)),
      child: Text(
        widget.titulo,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }
}
