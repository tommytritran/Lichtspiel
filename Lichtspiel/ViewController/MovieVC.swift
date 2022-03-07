//
//  MovieVC.swift
//  Lichtspiel
//
//  Created by Tommy Tran on 24/02/2022.
//

import Foundation

class MovieVC: ObservableObject {
    @Published var trending: [Movie] = []
    @Published var recommendations: [Movie] = []
    @Published var randMovie: Movie? = nil
    @Published var isLoading: Bool = false
    @Published var errorMsg: String? = nil

    
    
    let tmdbService = TMDBService()
    let apiService = APIService()
    
    let example = Movie(genreIDS: [1], originalLanguage: "English", originalTitle: "Example Movie", posterPath: "/xwggrEugjcJDuabIWvK2CpmK91z.jpg", video: true, voteAverage: 0.54, title: "Example Movie", overview: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ante nisl, finibus eget augue vitae, gravida pellentesque sapien. Fusce fringilla arcu id rhoncus pharetra. Aliquam justo enim, feugiat faucibus tincidunt non, commodo elementum nisl. Ut cursus ex a suscipit dapibus. In scelerisque cursus magna, semper tempor enim scelerisque ac. Nullam commodo tellus at neque feugiat volutpat. In vel lorem justo. Phasellus ac libero eros.", releaseDate: "2022-02-20", voteCount: 542, adult: true, backdropPath: "/2hC8HHRUvwRljYKIcQDMyMbLlxz.jpg", id: 137697, popularity: 54.32, mediaType: "", name: "Example Movie", originalName: "Example Movie", firstAirDate: "2022-02-20", originCountry: ["Norway"])
    
    init() {
        self.fetchTrending()
        self.fetchRandomMovie()
    }
    
    func fetchTrending (){
        isLoading = true
        let url = tmdbService.trendingURL()
        apiService.fetch(MovieWrapper.self, url: url){ [unowned self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMsg = error.localizedDescription
                    print(error)
                case .success(let movieWrapper):
                    print("success trending")
                    self.trending = movieWrapper.results
                }
            }
        }
    }
    func fetchRecommendation(movieId:Int) {
        isLoading = true
        let url = tmdbService.recommendationsUrl(movieId:movieId)
        apiService.fetch(MovieWrapper.self, url: url) { [unowned self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMsg = error.localizedDescription
                    print(error)
                case .success(let movieWrapper):
                    print("success recommendation")
                    self.recommendations = movieWrapper.results
                }
            }
        }
    }
    func fetchMovie(movieId:Int){
        isLoading = true
        let url = tmdbService.movieUrl(movieId: movieId)
        apiService.fetch(Movie.self, url: url) { [unowned self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMsg = error.localizedDescription
                    if(error.description.contains("404")){
                        self.fetchTrending()
                        print("random movie retry")
                    }
                    print(error)
                case .success(let movie):
                    print("success movie")
                    self.randMovie = movie
                }
            }
        }
    }
    
    func fetchRandomMovie(){
        self.fetchMovie(movieId: Int.random(in: 1...9999))
    }
    
}
