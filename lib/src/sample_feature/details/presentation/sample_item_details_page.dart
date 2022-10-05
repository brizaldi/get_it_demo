import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator.dart';
import '../../core/model/sample_item_detail.dart';
import '../application/sample_detail_cubit.dart';

class SampleItemDetailsPage extends StatelessWidget {
  const SampleItemDetailsPage({super.key, required this.id});

  final int id;

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl.get<SampleDetailCubit>()..fetch(id),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Item Details'),
        ),
        body: Center(
          child: BlocBuilder<SampleDetailCubit, SampleItemDetail?>(
            builder: (BuildContext context, SampleItemDetail? item) {
              if (item == null) {
                return const CircularProgressIndicator();
              }

              return Text('ID: ${item.id} NAME: ${item.name}');
            },
          ),
        ),
      ),
    );
  }
}
