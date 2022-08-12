import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_expense_chart/expense_provider.dart';
import 'package:task_expense_chart/pie_chart.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({Key? key}) : super(key: key);

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  @override
  void initState() {
    //  context.read<ExpenseProvider>().getExpenseData();
    context.read<ExpenseProvider>().getCategoryData();
    super.initState();
  }

  TextStyle styleText = TextStyle(
    color: Colors.blue.shade800,
  );
  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseProvider>(
      builder: (_, model, __) => Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: Text("Expenses"),
          centerTitle: true,
        ),
        body: model.loadingPage
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(children: [
                Card(
                  color: Colors.white,
                  child: Row(
                    children: [
                      const PieChartWidget(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                  backgroundColor: Colors.redAccent.shade200
                                      .withOpacity(0.7),
                                  radius: 8),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "20% Drinks",
                                  style: styleText,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                  backgroundColor: Colors.blueAccent,
                                  radius: 8),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "31% Rent",
                                  style: styleText,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                  backgroundColor: Colors.lightGreen,
                                  radius: 8),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "23% Groceries",
                                  style: styleText,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                  backgroundColor: Colors.yellow.shade200,
                                  radius: 8),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "12% Uber",
                                  style: styleText,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                  backgroundColor: Colors.deepOrangeAccent,
                                  radius: 8),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "15% Restaurants",
                                  style: styleText,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * 0.37,
                  child: Column(
                    children: [
                      const Text("Top Spending Categories",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Expanded(
                        child: ListView.builder(
                            itemCount: model.categoryList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => ExpansionTile(
                                  title: Text(
                                    model.categoryList[index].categoryName,
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  subtitle: Text(
                                      "\$ ${model.categoryList[index].amountSpent.toString()} spent",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500)),
                                  onExpansionChanged: (val) {
                                    context
                                        .read<ExpenseProvider>()
                                        .getSubCategoryData(model
                                            .categoryList[index].categoryId);
                                  },
                                  trailing:
                                      const Icon(Icons.keyboard_arrow_right),
                                  children: model.subCategoryList.isNotEmpty
                                      ? List.generate(
                                          model.subCategoryList.length,
                                          (index) => ListTile(
                                                title: Text(
                                                    "${model.subCategoryList[index].subCategoryName}: \$ ${model.subCategoryList[index].amountSpent}"),
                                              ))
                                      : [],
                                )),
                      )
                    ],
                  ),
                )
              ]),
      ),
    );
  }
}
