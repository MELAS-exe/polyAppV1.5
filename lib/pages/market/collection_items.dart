import 'package:flutter/material.dart';

class CollectionItems extends StatefulWidget {
  int value;
  Image image;
   CollectionItems({super.key,
   required this.value,
   required this.image
   });

  @override
  State<CollectionItems> createState() => _CollectionItemsState();
}

class _CollectionItemsState extends State<CollectionItems> {
  @override
  Widget build(BuildContext context) {
    return widget.image;
  }
}