import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it_demo/src/sample_feature/core/model/sample_item_detail.dart';

import '../../core/service/sample_service.dart';
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
          create: (context) => SampleDetailCubit(SampleService())..fetch(id),
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
