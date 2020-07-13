import 'package:flavors_example/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:provider/provider.dart';

import '../models/locations_endpoint/location_model.dart';
import '../providers/locations_provider.dart';
import '../widgets/card_location.dart';

class LocationsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PaginationView<LocationModel>(
      padding: const EdgeInsets.all(15),
      separatorBuilder: (BuildContext context, _) => SizedBox(height: 10),
      onEmpty: Center(
        child: Text("No data to present right now"),
      ),
      onError: (err) => Center(
        child: Text(err),
      ),
      pageFetch:
          Provider.of<LocationsProvider>(context, listen: false).fetchLocations,
      paginationViewType: PaginationViewType.listView,
      itemBuilder: (BuildContext context, LocationModel location, int index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LocationScreen(
                  id: location.id,
                  name: location.name,
                ),
              ),
            );
          },
          child: CardLocation(location),
        );
      },
    );
  }
}
