import 'package:bhagvadgita_api/screen/home_screen/model/home_model.dart';
import 'package:bhagvadgita_api/screen/slok_screen/slok_model/slok_model.dart';
import 'package:bhagvadgita_api/utils/api_helper.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
{
    RxList<HomeModel> dataList = <HomeModel>[].obs;
    RxList<SlokModel> slokList = <SlokModel>[].obs;
    int chNo=0;

  void readApi()
  async {
    List<HomeModel> l1 = await ApiHelper.helper.callApi();
    dataList.value=l1;
  }

    // ---------- getSlokApi ----------//

    void getSlokApi()
    async {
    slokList.clear();
      List<SlokModel> l1 = await ApiHelper.helper.getlApi(chNo);
      slokList.value=l1;

    }
}