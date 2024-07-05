import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/api_calling.dart';
import 'package:weather_app/detailView.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();
  var data;
  String resultText = '';
  bool loading = false;
  List<String> searchHistory = []; // List to store search history

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Weather App"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              cursorColor: const Color(0xFFEFBACA),
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () async {
                    setState(() {
                      loading = true;
                      resultText = '';
                    });
                    try {
                      data = await WeatherService()
                          .getWeather(_searchController.text);
                      setState(() {
                        loading = false;
                      });

                      if (_searchController.text.isNotEmpty) {
                        setState(() {
                          if (!searchHistory.contains(_searchController.text)) {
                            searchHistory.add(_searchController.text);
                            setdata();
                          }
                        });
                      }

                      // ignore: use_build_context_synchronously
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => WeatherCardScreen(
                          data: data,
                        ),
                      ));
                    } catch (e) {
                      setState(() {
                        loading = false;
                        resultText = e.toString();
                      });
                    }
                  },
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
              ),
            ),
            loading
                ? Container()
                : Expanded(
                    child: ListView.builder(
                      itemCount: searchHistory.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(Icons.history),
                          title: Text(searchHistory[index]),
                          onTap: () {
                            _searchController.text = searchHistory[index];
                          },
                        );
                      },
                    ),
                  ),
            const SizedBox(height: 20),
            loading
                ? const CircularProgressIndicator()
                : Text(
                    resultText,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  void setdata() async {
    var pref = await SharedPreferences.getInstance();
    pref.setStringList("history", searchHistory);
  }

  void getdata() async {
    var pref = await SharedPreferences.getInstance();
    setState(() {
      searchHistory = pref.getStringList('history') ?? [];
    });
  }
}
