import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_calismasi/bloc/home_bloc.dart';
import 'package:flutter_test_calismasi/constants/app_strings.dart';
import 'package:flutter_test_calismasi/widgets/character_card_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();

    context.read<HomeBloc>().add(const FetchDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.appTitle,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.sp),
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.characterModelList == null) {
            return const Center(child: Text(AppStrings.fetingErrorText));
          } else if (state.characterModelList!.isEmpty) {
            return const Center(child: Text(AppStrings.noCharText));
          } else {
            return SafeArea(
              child: ListView.builder(
                itemCount: state.characterModelList!.length,
                itemBuilder: (context, index) {
                  return CharacterDetailWidget(
                      characterData: state.characterModelList![index]);
                },
              ),
            );
          }
        },
      ),
    );
  }
}
