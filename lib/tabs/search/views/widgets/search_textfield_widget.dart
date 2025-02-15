
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/tabs/search/controller/search_movies_controller.dart';



class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchMoviesController>(
      builder: (controller) {
        return TextField(
          // onChanged: (query) => controller.searchMovies(query: query),
          onSubmitted: (value) {
            controller.searchMovies(query: value);
          },
          controller: controller.textController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: Colors.black54),
            hintText: "TV shows, movies and more",
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            suffixIcon: IconButton(
              icon: Icon(Icons.close, color: Colors.black54),
              onPressed: () {
                controller.clearSearch();
              },
            ),
          ),
        );
      }
    );
  }
}
