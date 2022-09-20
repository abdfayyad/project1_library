import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasources/remote/dio_helper.dart';
import '../blocs/bloc_search/cubit.dart';
import '../blocs/bloc_search/state.dart';

class ToolbarSearch extends StatefulWidget {


  @override
  State<ToolbarSearch> createState() => _ToolbarSearchState();

}

class _ToolbarSearchState extends State<ToolbarSearch> {
  late SearchBooksCubit searchBooksCubit;
  void initState() {
    // TODO: implement initState
    super.initState();
    searchBooksCubit=SearchBooksCubit(dioHelper:DioHelper());
  }
  @override
  Widget build(BuildContext context) {
    var formKey=GlobalKey<FormState>();
    var searchController=TextEditingController();
    return BlocProvider(
        create: (BuildContext context) => searchBooksCubit,
        child: BlocConsumer<SearchBooksCubit, SearchBooksState>(
            listener: (context, state) {
          if (state is SearchBooksSuccessState) {}
          if (state is SearchBooksErrorState) {}
        }, builder: (context, state) {
          SearchBooksCubit cubit = BlocProvider.of(context);
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormField(

                        controller: searchController,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (titles) {
                          SearchBooksCubit.get(context).getSearch(titles);
                        },

                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'error text to search';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'Search',
                            prefixIcon: Icon(
                              Icons.search,
                            ),
                            //hintText: 'Enter Your Emil Address',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0)))),
                    SizedBox(height: 10.0,),
                    if(state is SearchBooksLoadingState)
                      LinearProgressIndicator(),

                  ],
                ),
              ),
            ),
          );
        }));
  }
}
