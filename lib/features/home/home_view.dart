import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../support/services/injector/injector.dart';
import '../../support/styles/app_colors.dart';
import '../../support/styles/app_fonts.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_events.dart';
import 'bloc/home_state.dart';
import 'components/home_section.dart';
import 'components/service_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final bloc = injector.get<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black02,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.black02,
        title: Text('EMPRESA', style: AppFonts.nunito(fontSize: 24, fontWeight: FontWeight.w600)),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.notifications, color: AppColors.white),
          ),
        ],
      ),
      drawer: Drawer(child: Column(children: [Text('')])),
      body: BlocConsumer<HomeBloc, HomeState>(
        bloc: bloc,
        listener: (context, state) {},
        builder: (_, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(gradient: LinearGradient(colors: [AppColors.green, AppColors.yellow])),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: AppColors.white,
                        child: Icon(Icons.person, color: AppColors.black),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Bem-vindo(a)', style: AppFonts.nunito(fontSize: 12, fontColor: AppColors.white)),
                          SizedBox(height: 4),
                          Text(
                            state.user.name?.isNotEmpty ?? false ? state.user.name ?? '' : state.user.email,
                            style: AppFonts.nunito(fontSize: 16, fontColor: AppColors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Cotar e Contratar',
                        style: AppFonts.nunito(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.only(left: 24, right: 8),
                      child: SizedBox(
                        height: 80,
                        child: ListView.separated(
                          padding: EdgeInsets.only(right: 24),
                          scrollDirection: Axis.horizontal,
                          itemCount: state.services.length,
                          separatorBuilder: (_, __) => SizedBox(width: 12),
                          itemBuilder: (_, index) {
                            return ServiceItem(
                              service: state.services[index],
                              onTap: () {
                                bloc.add(HomeServiceSelected(state.services[index]));
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    HomeSection(
                      title: 'Contratos',
                      description: 'Adicione aqui membros da sua família e compartilhe os seguros com eles',
                      icon: Icons.add,
                      onTap: () {
                        bloc.add(HomeAddContractSelected());
                      },
                    ),
                    SizedBox(height: 20),
                    HomeSection(
                      title: 'Contratados',
                      description: 'Você ainda não possui seguros contratados',
                      icon: Icons.person,
                      onTap: () {
                        bloc.add(HomeContractorsSelected());
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
