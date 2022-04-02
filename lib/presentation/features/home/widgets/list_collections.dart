import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_win/app/injection_container.dart';
import 'package:todo_win/app/name_route.dart';
import 'package:todo_win/domain/entities/collection.dart';
import 'package:todo_win/presentation/features/settings/mobx/settings.store.dart';
import 'package:todo_win/presentation/shared/style/app_colors.dart';
import 'package:todo_win/presentation/shared/style/app_edge_insets.dart';
import 'package:todo_win/presentation/shared/style/app_input_border.dart';
import 'package:todo_win/presentation/shared/widgets/empty/list_empty.dart';
import 'package:todo_win/presentation/shared/widgets/refresh/refresh_widget.dart';
import 'package:todo_win/string_extension.dart';
import 'package:todo_win/utils/cool_navigate.dart';

class ListCollections extends StatefulWidget {
  const ListCollections({Key? key}) : super(key: key);

  @override
  _ListCollectionsState createState() => _ListCollectionsState();
}

class _ListCollectionsState extends State<ListCollections> {
  late SettingsStore settingsStore;
  final _keyRefresh = GlobalKey<RefreshIndicatorState>();

  @override
  void didChangeDependencies() {
    settingsStore = sl<SettingsStore>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return settingsStore.listCollection.isEmpty
            ? const ListEmpty(
                isEnabledImage: true,
                message: 'Nenhuma lista foi encontrada',
              )
            : Expanded(
                child: RefreshWidget(
                  keyRefresh: _keyRefresh,
                  onRefresh: refreshList,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: settingsStore.listCollection.length,
                    itemBuilder: (context, index) {
                      final collect = settingsStore.listCollection[index];
                      return InkWell(
                        onTap: () async => _openTasks(collect),
                        child: Padding(
                          padding: AppEdgeInsets.tsd,
                          child: Slidable(
                            key: Key(collect.id.toString()),
                            endActionPane: ActionPane(
                              motion: const StretchMotion(),
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: AppEdgeInsets.hsd,
                                    child: InkWell(
                                      onTap: () async =>
                                          _deleteCollection(collect),
                                      child: Container(
                                        padding: AppEdgeInsets.sdAll,
                                        decoration: AppInputBorder.borderRadius
                                            .copyWith(
                                                color: AppColors.redColor),
                                        child: const Center(
                                          child: Icon(
                                            Icons.delete,
                                            color: AppColors.white,
                                            size: 27,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              //padding: AppEdgeInsets.vmd,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              decoration: AppInputBorder.borderRadius.copyWith(
                                color: Colors.green[100],
                              ),
                              child: ListTile(
                                title: Text(
                                  collect.collectionName.capitalizeFirstOfEach,
                                  style: const TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
      },
    );
  }

  Future<void> _deleteCollection(Collection collect) async {
    settingsStore.selectedCollection = collect;
    await settingsStore.deleteCollection(
      context: context,
      collectionId: collect.id,
      callBackSucess: () async {
        await settingsStore.deleteTaskFromCollection(context: context);
      },
    );
  }

  Future<void> _openTasks(Collection collect) async {
    settingsStore.selectedCollection = collect;
    coolNavigate.navigateTo(NameRoute.tasks);
  }

  Future<void> refreshList() async {
    await Future.delayed(const Duration(seconds: 1));
    await settingsStore.getCollections();
  }
}
