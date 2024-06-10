/*
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BookApiScreen extends StatefulWidget {
  const BookApiScreen({Key? key}) : super(key: key);

  @override
  _BookApiScreenState createState() => _BookApiScreenState();
}

class _BookApiScreenState extends State<BookApiScreen> {
  final String apiKey = 'AIzaSyAKHQ1chKwJV0yUmIOiAWcfgkZAF4LH32g'; // API anahtarınızı buraya ekleyin
  TextEditingController _searchController = TextEditingController();
  List books = [];
  bool isLoading = false;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchBooks('flutter');
  }

  Future<void> fetchBooks(String query) async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    final response = await http.get(Uri.parse(
        'https://www.googleapis.com/books/v1/volumes?q=$query&key=$apiKey'));
    if (response.statusCode == 200) {
      setState(() {
        books = json.decode(response.body)['items'];
        isLoading = false;
      });
    } else {
      setState(() {
        errorMessage = 'Failed to load books';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Books API Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search books...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    fetchBooks(_searchController.text);
                  },
                ),
              ),
              onSubmitted: (value) {
                fetchBooks(value);
              },
            ),
            SizedBox(height: 10),
            if (isLoading) CircularProgressIndicator(),
            if (errorMessage.isNotEmpty) Text(errorMessage, style: TextStyle(color: Colors.red)),
            if (!isLoading && errorMessage.isEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    var book = books[index]['volumeInfo'];
                    var thumbnail = book['imageLinks'] != null ? book['imageLinks']['thumbnail'] : null;
                    return ListTile(
                      leading: thumbnail != null
                          ? Image.network(
                              thumbnail,
                              fit: BoxFit.cover,
                              width: 50,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.broken_image, size: 50);
                              },
                            )
                          : Icon(Icons.book, size: 50),
                      title: Text(book['title']),
                      subtitle: Text(book['authors']?.join(', ') ?? 'Unknown'),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
*/
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BookApiScreen extends StatefulWidget {
  const BookApiScreen({Key? key}) : super(key: key);

  @override
  _BookApiScreenState createState() => _BookApiScreenState();
}

class _BookApiScreenState extends State<BookApiScreen> {
  final String apiKey = 'AIzaSyAKHQ1chKwJV0yUmIOiAWcfgkZAF4LH32g'; 
  TextEditingController _searchController = TextEditingController();
  List books = [];
  bool isLoading = false;
  String errorMessage = '';
  String selectedFilter = 'partial';

  @override
  void initState() {
    super.initState();
    fetchBooks('flutter');
  }

  Future<void> fetchBooks(String query) async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    final response = await http.get(Uri.parse(
        'https://www.googleapis.com/books/v1/volumes?q=$query&filter=$selectedFilter&key=$apiKey'));
    if (response.statusCode == 200) {
      setState(() {
        books = json.decode(response.body)['items'];
        isLoading = false;
      });
    } else {
      setState(() {
        errorMessage = 'Failed to load books';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Books API Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search books...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    fetchBooks(_searchController.text);
                  },
                ),
              ),
              onSubmitted: (value) {
                fetchBooks(value);
              },
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedFilter,
              onChanged: (String? newValue) {
                setState(() {
                  selectedFilter = newValue!;
                });
                fetchBooks(_searchController.text);
              },
              items: <String>[
                'partial',
                'full',
                'free-ebooks',
                'paid-ebooks',
                'ebooks'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            if (isLoading) CircularProgressIndicator(),
            if (errorMessage.isNotEmpty) Text(errorMessage, style: TextStyle(color: Colors.red)),
            if (!isLoading && errorMessage.isEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    var book = books[index]['volumeInfo'];
                    var thumbnail = book['imageLinks'] != null ? book['imageLinks']['thumbnail'] : null;
                    return ListTile(
                      leading: thumbnail != null
                          ? Image.network(
                              thumbnail,
                              fit: BoxFit.cover,
                              width: 50,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.broken_image, size: 50);
                              },
                            )
                          : Icon(Icons.book, size: 50),
                      title: Text(book['title']),
                      subtitle: Text(book['authors']?.join(', ') ?? 'Unknown'),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
