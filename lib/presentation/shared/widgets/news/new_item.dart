import 'package:flutter/material.dart';
import 'package:wally_news/domain/entities/entities.dart';
import 'package:wally_news/presentation/screens/screens.dart';

class NewItem extends StatelessWidget {

  final New newItem;

  const NewItem(this.newItem, {super.key});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewDetailsScreen(newItem)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _NewItemImage(image: newItem.image),
      
            const SizedBox(height: 5),
            
            Text(
              newItem.title,
              style: Theme.of(context).textTheme.titleMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
      
            const SizedBox(height: 5),
            
            Text(
              newItem.description,
              style: Theme.of(context).textTheme.headlineMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
      
            const SizedBox(height: 20),
            
          ],
        ),
      ),
    );
  }
}

class _NewItemImage extends StatelessWidget {

  final String image;


  const _NewItemImage({
    required this.image,
  });


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10)
          ),
          width: size.width,
          height: size.height / 4,
          child: const Center(
            child: Icon(Icons.cloud, size: 100)
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            image,
            width: size.width,
            height: size.height / 4,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}