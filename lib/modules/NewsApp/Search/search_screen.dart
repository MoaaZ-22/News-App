import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../layout/News_Layout/Cubit/cubit.dart';
import '../../../layout/News_Layout/Cubit/states.dart';
import '../../../shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();

    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(BuildContext context,NewsStates states){} ,
      builder: (BuildContext context,NewsStates states)
      {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ReusableTextField(
                  borderColor: NewsCubit.get(context).isDark == true ? Colors.white: Colors.grey,
                  onChange: (value)
                  {
                    NewsCubit.get(context).getSearch(value);
                  },
                  labelText: 'Search',
                  prefixIcon: Icons.search,
                  keyboardInputType: TextInputType.text,
                  isPassword: false,
                  controller: searchController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Search Bar Empty",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 2,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                    return null;
                  },
                ),
              ),
              searchController.text.isEmpty ?
                Expanded(
                  child: Center(
                  child: Text('Search For Every Thing',style: TextStyle(fontSize: 20,
                      color: (NewsCubit.get(context).isDark == true) ? Colors.deepOrange : Colors.black),),
              ),
                ):Expanded(child: ConditionalBuilder(
                condition: NewsCubit.get(context).search.isNotEmpty,
                builder: (BuildContext context)
                {
                  return ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, index) => buildArticleItem(NewsCubit.get(context).search[index],context),
                      separatorBuilder: (BuildContext context, index) => divider(colorOfDivider: Colors.grey),
                      itemCount: NewsCubit.get(context).search.length);
                },
                fallback: (BuildContext context) =>
                const Center(child: CircularProgressIndicator()),

              ))
            ],
          ),
        );
      },
    );
  }
}
