//
//  MainView.swift
//  Lichtspiel
//
//  Created by Tommy Tran on 12/02/2022.
//

import SwiftUI

struct MainView: View {

    private let tmdbService:TMDBService = TMDBService()
    
    @StateObject var movieVC = MovieVC()

    var body: some View {
        NavigationView {
            if movieVC.isLoading {
                LoadingView()
            } else if movieVC.errorMsg != nil {
                ErrorView()
            } else {
                ZStack {
                    Color.black.ignoresSafeArea()
                    VStack {
                        Text("Trending")
                            .foregroundColor(Color("LightGreen"))
                            .bold()
                            .padding([.top, .leading])
                            .frame(maxWidth: .infinity, alignment: .leading)
                        ScrollView(.vertical){
                            ScrollView(.horizontal) {
                                HStack(alignment: .bottom) {
                                    ForEach(movieVC.trending, id: \.self) { movie in
                                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                                            MovieListRowItem(movie:movie)
                                        }
                                    }
                                }
                            }
                            RandomMovie()
                        }
                       
                        Spacer()
                    }
                    .navigationTitle(Text("Home"))
                .navigationBarHidden(true)
                }
            }
        }
    }
}
