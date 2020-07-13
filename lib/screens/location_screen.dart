import 'package:flavors_example/providers/locations_provider.dart';
import 'package:flavors_example/widgets/location.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationScreen extends StatelessWidget {
  final int id;
  final String name;

  LocationScreen({
    @required this.id,
    @required this.name,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Provider.of<LocationsProvider>(context, listen: false)
            .fetchLocationsWithCharacters(id),
        builder: (BuildContext context, location) {
          if (location.connectionState == ConnectionState.done) {
            if (location.data == null) {
              return Center(
                child: Text(
                  "Sorry this location has disappeared",
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        color: Theme.of(context).primaryColorDark,
                      ),
                ),
              );
            } else {
              return Location(location.data);
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
