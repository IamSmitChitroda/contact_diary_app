import 'package:countact_diary_app/headers.dart';

class StepperController extends ChangeNotifier {
  int currentStep = 0;
  GlobalKey nameFormKey = GlobalKey<FormState>();
  GlobalKey numberFormKey = GlobalKey<FormState>();
  GlobalKey emailFormKey = GlobalKey<FormState>();

  void reset() {
    currentStep = 0;
    notifyListeners();
  }

  void onStepTapped({required int index}) {
    currentStep = index;
    notifyListeners();
  }

  void onStepContinue() {
    if (currentStep < 2) {
      currentStep++;
    }

    notifyListeners();
  }

  void onStepCancel() {
    if (currentStep > 0) currentStep--;
    notifyListeners();
  }

  bool isActive(int index) {
    return currentStep == index;
  }
}
