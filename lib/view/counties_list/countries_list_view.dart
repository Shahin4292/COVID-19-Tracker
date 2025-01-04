import 'package:covid_19/view/counties_list/widget/simmer_effect.dart';
import 'package:flutter/material.dart';

import '../../viewModel/service/covid_19_service.dart';
import '../details_view/details_view.dart';

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
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                style: const TextStyle(color: Colors.white),
                controller: searchController,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintStyle: const TextStyle(color: Colors.white),
                    hintText: 'Search with countries name'),
              ),
            ),
            Expanded(
                child: FutureBuilder(
              future: covid19service.getCovidCountriesApi(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (!snapshot.hasData) {
                  return ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const SimmerEffect();
                      });
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        String name = snapshot.data![index]['country'];
                        if (searchController.text.isEmpty) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsView(
                                            image: snapshot.data![index]
                                                ['countryInfo']['flag'],
                                            name: snapshot.data![index]
                                                ['country'],
                                            totalCases: snapshot.data![index]
                                                ['cases'],
                                            totalRecovered: snapshot
                                                .data![index]['recovered'],
                                            totalDeaths: snapshot.data![index]
                                                ['deaths'],
                                            active: snapshot.data![index]
                                                ['active'],
                                            test: snapshot.data![index]
                                                ['tests'],
                                            todayRecovered: snapshot
                                                .data![index]['todayRecovered'],
                                            critical: snapshot.data![index]
                                                ['critical'],
                                          )));
                            },
                            child: ListTile(
                              subtitle: Text(
                                snapshot.data![index]['cases'].toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                              leading: Image(
                                height: 50,
                                width: 50,
                                image: NetworkImage(snapshot.data![index]
                                        ['countryInfo']['flag']
                                    .toString()),
                              ),
                              title: Text(
                                snapshot.data![index]['country'].toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        } else if (name
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase())) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsView(
                                            image: snapshot.data![index]
                                                ['countryInfo']['flag'],
                                            name: snapshot.data![index]
                                                ['country'],
                                            totalCases: snapshot.data![index]
                                                ['cases'],
                                            totalRecovered: snapshot
                                                .data![index]['recovered'],
                                            totalDeaths: snapshot.data![index]
                                                ['deaths'],
                                            active: snapshot.data![index]
                                                ['active'],
                                            test: snapshot.data![index]
                                                ['tests'],
                                            todayRecovered: snapshot
                                                .data![index]['todayRecovered'],
                                            critical: snapshot.data![index]
                                                ['critical'],
                                          )));
                            },
                            child: ListTile(
                              subtitle: Text(
                                snapshot.data![index]['cases'].toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                              leading: Image(
                                height: 50,
                                width: 50,
                                image: NetworkImage(snapshot.data![index]
                                        ['countryInfo']['flag']
                                    .toString()),
                              ),
                              title: Text(
                                snapshot.data![index]['country'].toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      });
                }
              },
            )),
          ],
        ),
      ),
    );
  }
}
