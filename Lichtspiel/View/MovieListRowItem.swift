//
//  MovieListRowItem.swift
//  Lichtspiel
//
//  Created by Tommy Tran on 15/02/2022.
//

import SwiftUI

struct MovieListRowItem: View {
    let movie:Movie?
    var body: some View {
        
        if movie == nil {
            ProgressView()
        } else {
            if let data = try? Data(contentsOf: URL(string: TMDBService().getImgUrl(path: movie!.posterPath ?? "", size:ImageSize.poster))!), let uiImage = UIImage(data: data) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: CGFloat(200), alignment: .leading)
            }
        }

    }
}

