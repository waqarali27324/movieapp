import 'package:get/get.dart';
import 'package:sample_app/tabs/navbar/controllers/navbarController.dart';
import 'package:sample_app/tabs/navbar/views/screens/navBar.dart';
import 'package:sample_app/tabs/search/controller/search_movies_controller.dart';
import 'package:sample_app/tabs/search/views/screens/search_movies_screen.dart';
import 'package:sample_app/tabs/watch/controller/movie_detail_controller.dart';
import 'package:sample_app/tabs/watch/controller/movie_ticket_detail_controller.dart';
import 'package:sample_app/tabs/watch/controller/youtube_trailer_controller.dart';
import 'package:sample_app/tabs/watch/views/screens/movie_detail_screen.dart';
import 'package:sample_app/tabs/watch/views/screens/movie_tickets_detail_screen.dart';
import 'package:sample_app/tabs/watch/views/screens/youtube_trailer_screen.dart';

//
class RouteHelper {
  static const String initialRoute = '/initialRoute';
  static const String searchView = '/searchView';
  static const String movieDetailView = '/movieDetailView';
  static const String movieTicketDetailView = '/movieTicketDetailView';
  static const String youtubeTrailerView = '/youtubeTrailerView';


 
  // routes list
  static List<GetPage> routes = [

    GetPage(name: initialRoute, binding: NavBarBindings(), page: () => NavBar()),

    GetPage(name: searchView, binding: SearchMoviesBindings(), page: () => SearchMoviesScreen()),

    GetPage(
        name: movieDetailView,
        binding: MoviesDetailBindings(),
        page: () {
          return MovieDetailScreen();
        }),

    GetPage(
        name: movieTicketDetailView,
        binding: MovieTicketDetailBindings(),
        page: () {
          return MovieTicketDetailScreen();
        }),    

    GetPage(
        name: youtubeTrailerView,
        binding: YoutubeTrailerBindings(),
        page: () {
          return YouTubeTrailerScreen();
        }),  
        


  ];
}

