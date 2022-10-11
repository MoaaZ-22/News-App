
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../layout/News_Layout/Cubit/cubit.dart';
import '../../../layout/News_Layout/Cubit/states.dart';
import '../../../shared/components/components.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (BuildContext context, NewsStates state) {},
        builder: (BuildContext context, NewsStates state) {
          var list = NewsCubit.get(context).health;
          return articleConditionalBuilder(list);} );
  }
}