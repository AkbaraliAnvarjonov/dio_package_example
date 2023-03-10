import 'package:dio_package/data/api_servise/api_servise.dart';
import 'package:dio_package/data/api_servise/currensy_servise.dart';
import 'package:dio_package/data/repository/bank_repository.dart';
import 'package:dio_package/data/repository/currency_repository.dart';
import 'package:dio_package/data/repository/repository.dart';
import 'package:dio_package/ui/currency_screen/currency_page.dart';
import 'package:dio_package/view_model/bank_view_model/expenses_view_mode.dart';
import 'package:dio_package/view_model/bank_view_model/incomes_view_model.dart';
import 'package:dio_package/view_model/category_id_model.dart';
import 'package:dio_package/view_model/category_view_model.dart';
import 'package:dio_package/view_model/currency_view_model/currency_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => CategoryViewModel(
            repository: Repository(
          apiSerice: ApiSerice(),
        )),
      ),
      ChangeNotifierProvider(
        create: (context) =>
            CategoryIdViewModel(repository: Repository(apiSerice: ApiSerice())),
      ),
      ChangeNotifierProvider(
        create: (context) => TransactionsViewModel(
            bankRepository: BankRepository(
          apiSerice: ApiSerice(),
        )),
      ),
      ChangeNotifierProvider(
        create: (context) => IncomeTypesViewModel(
            bankRepository: BankRepository(
          apiSerice: ApiSerice(),
        )),
      ),
      ChangeNotifierProvider(
        create: (context) => CurrencyViewModel(
            currencyRepository: CurrencyRepository(
          apiSerice: CurrensyApi(),
        )),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const CurrrecyPage(),
    );
  }
}
