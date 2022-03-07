//
//  MovieDetailView.swift
//  Lichtspiel
//
//  Created by Tommy Tran on 14/02/2022.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movie:Movie
    @StateObject var movieVC = MovieVC()

    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                AsyncImage(url: URL(string: TMDBService().getImgUrl(path: movie.posterPath ?? "", size:ImageSize.poster))) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .ignoresSafeArea()
                } placeholder: {
                    ProgressView()
                        .frame(maxWidth: .infinity, minHeight: 300)
                        .overlay(Rectangle().stroke(Color.white,lineWidth:4).shadow(radius: 10))
                }
            }
            VStack(alignment: .leading) {
                HStack(spacing: 10) {
                    Text("Rating \(movie.voteAverage, specifier: "%.1f")")
                        .font(.system(size: 12, weight: .light))
                    Text("Popularity \(movie.popularity! , specifier: "%.1f")")
                        .font(.system(size: 12, weight: .light))
                    Text("Release \(movie.releaseDate ?? "")")
                        .font(.system(size: 12, weight: .light))
                }.padding()
                Text(movie.overview)
                Divider()
                VStack(alignment: .leading) {
                    Text("Recommendations").font(.title2)
                }
            }.padding()
            if movieVC.recommendations.count == 0 {
                LoadingView()
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .bottom) {
                        ForEach(movieVC.recommendations, id: \.self) { movie in
                            NavigationLink(destination: MovieDetailView(movie: movie).onAppear(perform: {
                                movieVC.fetchRecommendation(movieId: movie.id ?? -1)
                            })) {
                                MovieListRowItem(movie:movie)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            self.movieVC.fetchRecommendation(movieId: self.movie.id ?? -1)
        }
        .navigationTitle(Text(movie.title ?? movie.name ?? movie.originalName ?? ""))
        .navigationBarTitleDisplayMode(.inline)
    }
}

