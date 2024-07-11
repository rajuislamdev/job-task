import 'package:job_task/gen/assets.gen.dart';
import 'package:job_task/models/grid_item_model.dart';

class HomeViewModel {
  final List<GridItemModel> gridItems = [
    GridItemModel(
      image: Assets.svg.man,
      title: "০০০০১",
    ),
    GridItemModel(
      image: Assets.svg.home,
      title: "০০০০২",
    ),
    GridItemModel(
      image: Assets.svg.sit,
      title: "০০০০৩",
    ),
    GridItemModel(
      image: Assets.svg.property,
      title: "০০০০৪",
    ),
    GridItemModel(
      image: Assets.svg.document,
      title: "০০০০৫",
    ),
    GridItemModel(
      image: Assets.svg.data,
      title: "০০০০৬",
    ),
  ];
}
