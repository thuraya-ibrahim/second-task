import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:task/models/site_model.dart';
import 'package:task/widgets/sites_list.dart';
import 'package:task/widgets/sites_map.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<SiteModel>> sitesFuture;

  void getSites() {
    final response = Dio().get(
      'https://api.npoint.io/3ea79f14c78bdda83278',
      options: Options(responseType: ResponseType.json),
    );
    sitesFuture = response.then(
      (value) {
        return List.from(value.data).map((e) => SiteModel.fromJson(e)).toList();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getSites();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sites App'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Sites List'),
              Tab(text: 'Sites Map'),
            ],
          ),
        ),
        body: FutureBuilder(
          future: sitesFuture,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'An error occurred. Please try again',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        getSites();
                        setState(() {});
                      },
                      child: Text('retry'),
                    ),
                  ],
                ),
              );
            }
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return TabBarView(
              children: [
                SitesList(sites: snapshot.data!),
                SitesMap(sites: snapshot.data!),
              ],
            );
          },
        ),
      ),
    );
  }
}
