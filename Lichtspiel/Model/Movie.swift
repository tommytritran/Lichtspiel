//
//  Movie.swift
//  Lichtspiel
//
//  Created by Tommy Tran on 14/02/2022.
//

import SwiftUI


// MARK: - Movie
struct MovieWrapper: Codable {
    let results: [Movie]

}

// MARK: - Result
struct Movie: Codable, Hashable {
    
    let genreIDS: [Int]?
    let originalLanguage: String?
    let originalTitle: String?
    let posterPath: String?
    let video: Bool?
    let voteAverage: Double
    let title: String?
    let overview: String
    let releaseDate: String?
    let voteCount: Int
    let adult: Bool?
    let backdropPath: String?
    let id: Int?
    let popularity: Double?
    let mediaType: String?
    let name, originalName, firstAirDate: String?
    let originCountry: [String]?
    
    enum CodingKeys: String, CodingKey {
        case genreIDS = "genre_ids"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case video
        case voteAverage = "vote_average"
        case title, overview
        case releaseDate = "release_date"
        case voteCount = "vote_count"
        case adult
        case backdropPath = "backdrop_path"
        case id, popularity
        case mediaType = "media_type"
        case name
        case originalName = "original_name"
        case firstAirDate = "first_air_date"
        case originCountry = "origin_country"
    }
}
