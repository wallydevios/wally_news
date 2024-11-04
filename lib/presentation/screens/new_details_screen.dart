import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wally_news/domain/entities/entities.dart';

class NewDetailsScreen extends StatelessWidget {

  final New newItem;
   
  const NewDetailsScreen(this.newItem, {super.key});
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Center(
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _NewItemImage(image: newItem.image),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  newItem.title,
                  style: theme.textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  newItem.description,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      'Autor: ',
                      style: theme.textTheme.labelMedium,
                    ),
        
                    Text(
                      newItem.author,
                      style: theme.textTheme.bodyMedium,
                    ),
        
                    const SizedBox(width: 10),
        
                    Text(
                      'Fuente: ',
                      style: theme.textTheme.labelMedium,
                    ),
        
                    Text(
                      newItem.source,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                )
              ),
        
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  newItem.content,
                  style: theme.textTheme.headlineLarge,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
        
              const Spacer(),
        
              _NavigateToNewButton(newItem),

              const SizedBox(height: 10),

              _ShareNewButton(newItem)
            ],
           )
        ),
      ),
    );
  }
}

class _ShareNewButton extends StatelessWidget {

  final New newItem;

  const _ShareNewButton(this.newItem);

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    
    return GestureDetector(
      onTap: () {
        Share.share(newItem.linkToNew);
      },
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: theme.colorScheme.primary,
            width: 2
          )
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: size.width * 0.9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'COMPARTIR',
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(width: 5),
            Icon(
              Icons.share,
              color: theme.colorScheme.primary,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}

class _NavigateToNewButton extends StatelessWidget {

  final New newItem;

  const _NavigateToNewButton(this.newItem);
  

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () async {

        if (!await launchUrl(Uri.parse(newItem.linkToNew))) {
          throw Exception('Could not launch ');
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(10)
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: size.width * 0.9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'IR A LA NOTICIA',
              style: TextStyle(
                color: theme.colorScheme.secondary,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(width: 5),
            Icon(
              Icons.link,
              color: theme.colorScheme.secondary,
              size: 30,
            )
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
    final theme = Theme.of(context);

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: theme.cardColor,
          ),
          width: size.width,
          height: size.height / 3,
          child: const Center(
            child: Icon(Icons.cloud, size: 100)
          ),
        ),
        Image.network(
          image,
          width: size.width,
          height: size.height / 3,
          fit: BoxFit.cover,
        ),
        Container(
          width: size.width,
          height: size.height / 3,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.5),
                Colors.transparent
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
          ),
        ),
        Positioned(
          top: 50,
          left: 10,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              size: 25,
              color: Colors.white,
            )
          ),
        )
      ],
    );
  }
}