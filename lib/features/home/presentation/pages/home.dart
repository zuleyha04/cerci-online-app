import 'package:cerci_online/core/di/locator.dart';
import 'package:cerci_online/core/widgets/myAppBar.dart';
import 'package:cerci_online/features/home/domain/repositories/banner_repository.dart';
import 'package:cerci_online/features/home/presentation/cubit/home_cubit.dart';
import 'package:cerci_online/features/home/presentation/cubit/home_state.dart';
import 'package:cerci_online/features/home/presentation/widgets/banner_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(sl<BannerRepository>())..loadBanners(),

      child: Scaffold(
        appBar: MyAppBar(),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeLoaded) {
              return ListView(
                padding: const EdgeInsets.all(12),
                children: [BannerSlider(banners: state.banners)],
              );
            } else if (state is HomeError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
