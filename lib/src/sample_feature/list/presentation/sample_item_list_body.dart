import 'package:flutter/material.dart';
import '../../core/model/sample_item.dart';
import '../../details/presentation/sample_item_details_page.dart';

class SampleItemListBody extends StatelessWidget {
  const SampleItemListBody({super.key, required this.items});

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      restorationId: 'sampleItemListPage',
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];

        return ListTile(
          title: Text('SampleItem ${item.id}'),
          leading: const CircleAvatar(
            foregroundImage: AssetImage('assets/images/flutter_logo.png'),
          ),
          onTap: () {
            Navigator.restorablePushNamed(
              context,
              SampleItemDetailsPage.routeName,
              arguments: item.id,
            );
          },
        );
      },
    );
  }
}
