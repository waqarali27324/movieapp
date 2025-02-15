import 'package:get/get.dart';
import 'package:sample_app/tabs/watch/models/movie_model.dart';


class MovieTicketDetailBindings extends Bindings {
  @override
  void dependencies() {
    final params = Get.arguments;
    final movie = params?["movie"] as MovieModel;
    Get.lazyPut<MovieTicketDetailController>(() => MovieTicketDetailController(movie: movie));
  }
  
}

class MovieTicketDetailController extends GetxController {

  MovieModel? movie;

  MovieTicketDetailController({
     this.movie,
  });
  
  int selectedDateIndex = 0;
  int selectedTimeIndex = 0;

  final List<String> dates = ["5 Mar", "6 Mar", "7 Mar", "8 Mar", "9 Mar"];
  final List<String> times = ["12:30", "13:30", "15:00"];
  final List<String> halls = [
    "Cinetech + Hall 1",
    "Cinetech",
    "Cinetech + Hall 2"
  ];
  final List<String> prices = [
    "50\$ or 2500 bonus",
    "75\$ or 3000 bonus",
    "60\$ or 2000 bonus"
  ];

  void selectDate(int index) {
    selectedDateIndex = index;
    update();
  }

  void selectTime(int index) {
    selectedTimeIndex = index;
    update();
  }
}