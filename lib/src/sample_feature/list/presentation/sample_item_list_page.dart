import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../settings/presentation/settings_page.dart';
import '../../core/model/sample_item.dart';
import '../../core/service/sample_service.dart';
import '../application/sample_list_cubit.dart';
import 'sample_item_list_body.dart';

class SampleItemListPage extends StatelessWidget {
  const SampleItemListPage({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SampleListCubit(SampleService())..fetch(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sample Items'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.restorablePushNamed(context, SettingsPage.routeName);
              },
            ),
          ],
        ),
        body: BlocBuilder<SampleListCubit, List<SampleItem>>(
          builder: (BuildContext context, List<SampleItem> items) {
            if (items.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return SampleItemListBody(items: items);
          },
        ),
      ),
    );
  }
}
