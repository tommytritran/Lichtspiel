//
//  MainView.swift
//  Lichtspiel
//
//  Created by Tommy Tran on 12/02/2022.
//

import SwiftUI

struct MainView: View {

    private let tmdbService:TMDBService = TMDBService()
    
    @State var trending:[Movie] = []


    var body: some View {
        NavigationView {
            VStack {
                Text("Trending")
                    .bold()
                    .padding([.top, .leading])
                    .frame(maxWidth: .infinity, alignment: .leading)
                ScrollView(.horizontal) {
                    HStack(alignment: .bottom) {
                        ForEach(trending, id: \.self) { movie in
                            NavigationLink(destination: MovieDetailView(movie: movie)) {
                                MovieListRowItem(movie:movie)
                            }
                        }
                    }
                }
                ScrollView(.horizontal) {
                    HStack(alignment: .bottom) {
                        ForEach(trending, id: \.self) { movie in
                            NavigationLink(destination: MovieDetailView(movie: movie)) {
                                MovieListRowItem(movie:movie)
                            }
                        }
                    }
                }
                Spacer()
            }
                .navigationTitle(Text("Home"))
                .navigationBarHidden(true)
        }
    }
}
