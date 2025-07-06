import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../support/services/injector/injector.dart';
import '../../support/styles/app_colors.dart';
import '../../support/styles/app_fonts.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_state.dart';

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
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          separatorBuilder: (_, __) => SizedBox(width: 12),
                          itemBuilder: (_, __) {
                            return AspectRatio(
                              aspectRatio: 1.5,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.black03,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.card_giftcard, color: AppColors.green),
                                    SizedBox(height: 8),
                                    Text(
                                      'Automóvel',
                                      style: AppFonts.nunito(fontSize: 14, fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Contratos', style: AppFonts.nunito(fontSize: 24, fontWeight: FontWeight.bold)),
                          SizedBox(height: 16),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                            decoration: BoxDecoration(
                              color: AppColors.black03,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: AppColors.white, width: 2),
                                  ),
                                  padding: EdgeInsets.all(4),
                                  child: Icon(Icons.add, color: AppColors.white, size: 40),
                                ),
                                SizedBox(height: 24),
                                Text(
                                  'Adicione aqui membros da sua família e compartilhe os seguros com eles',
                                  style: AppFonts.nunito(fontSize: 16, fontWeight: FontWeight.normal),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Contratados', style: AppFonts.nunito(fontSize: 24, fontWeight: FontWeight.bold)),
                          SizedBox(height: 16),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                            decoration: BoxDecoration(
                              color: AppColors.black03,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: AppColors.white, width: 2),
                                  ),
                                  padding: EdgeInsets.all(4),
                                  child: Icon(Icons.person, color: AppColors.white, size: 40),
                                ),
                                SizedBox(height: 24),
                                Text(
                                  'Você ainda não possui seguros contratados',
                                  style: AppFonts.nunito(fontSize: 16, fontWeight: FontWeight.normal),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
