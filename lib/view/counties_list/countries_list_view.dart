import 'package:flutter/material.dart';

import '../../viewModel/service/covid_19_service.dart';

class CountriesListView extends StatefulWidget {
  const CountriesListView({super.key});

  @override
  State<CountriesListView> createState() => _CountriesListViewState();
}

class _CountriesListViewState extends State<CountriesListView> {
  TextEditingController searchController = TextEditingController();
  Covid19Service covid19service = Covid19Service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                style: const TextStyle(color: Colors.white),
                controller: searchController,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintStyle: const TextStyle(color: Colors.white),
                    hintText: 'Search with countries name'),
              ),
              Expanded(
                  child: FutureBuilder(
                future: covid19service.getCovidCountriesApi(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: Text('Loading'));
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            subtitle: Text(
                              snapshot.data![index]['cases'].toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                            leading: Image(
                              height: 50,
                              width: 50,
                              image: NetworkImage(
                                  snapshot.data![index]['countryInfo']['flag'].toString()),
                            ),
                            title: Text(
                              snapshot.data![index]['country'].toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        });
                  }
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
