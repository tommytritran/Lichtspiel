//
//  RandomMovie.swift
//  Lichtspiel
//
//  Created by Tommy Tran on 07/03/2022.
//

import SwiftUI

struct RandomMovie: View {
    
    @StateObject var movieVC = MovieVC()
    
    var body: some View {
        ZStack {
            VStack() {
                Text(movieVC.randMovie?.title ?? movieVC.randMovie?.name ?? movieVC.randMovie?.originalName ?? "")
                    .foregroundColor(Color.white)
                    .bold()
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .center)
                if movieVC.randMovie == nil {
                    ProgressView()
                } else {
                    NavigationLink(destination: MovieDetailView(movie: movieVC.randMovie!)){
                        if let data = try? Data(contentsOf: URL(string: TMDBService().getImgUrl(path: movieVC.randMovie!.posterPath ?? "", size:ImageSize.poster))!), let uiImage =
                            UIImage(data: data) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: CGFloat(300), alignment: .leading)
                                    .border(Color.black)
                                    .padding(.horizontal)
                        }
                    }
                }
                Button() {
                    movieVC.fetchRandomMovie()
                } label: {
                    Text("Get random movie")
                        .foregroundColor(Color("LightGreen"))
                        .padding()
                }
                .background(Color("AccentColor"))
                .clipShape(Capsule())
                .padding(.bottom)
            }
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, lineWidth: 2)
            )
            .padding()
        }
    }
}
