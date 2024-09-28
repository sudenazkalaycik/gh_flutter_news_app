import 'package:flutter/material.dart';

class NewsDetailsPage extends StatefulWidget {
  final String title;
  final String description;

  NewsDetailsPage({required this.title, required this.description});

  @override
  State<NewsDetailsPage> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Fotoğraf başlığın üstüne alındı
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Fotoğraf Yükleniyor...',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.title,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                "Lorem ipsum dolor sit amet,\n"
                    "consectetur adipiscing elit,\n"
                    "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n"
                    "Ut enim ad minim veniam,\n"
                    "quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n"
                    "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n"
                    "Excepteur sint occaecat cupidatat non proident,\n"
                    "sunt in culpa qui officia deserunt mollit anim id est laborum.\n"
                    "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,\n"
                    "totam rem aperiam,\n"
                    "eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.\n"
                    "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit,\n"
                    "sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.\n"
                    "Neque porro quisquam est,\n"
                    "qui dolorem ipsum quia dolor sit amet,\n"
                    "consectetur, adipisci velit,\n"
                    "sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.\n"
                    "Ut enim ad minima veniam,\n"
                    "quis nostrum exercitationem ullam corporis suscipit laboriosam,\n"
                    "nisi ut aliquid ex ea commodi consequatur?\n"
                    "Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur,\n"
                    "vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
              style: TextStyle(color: Colors.white,
              fontSize: 20),),
              const Text("Haber Kaynağı",
              style: TextStyle(color: Colors.red,fontSize: 20) )
            ],
          ),
        ),
      ),
    );
  }
}
