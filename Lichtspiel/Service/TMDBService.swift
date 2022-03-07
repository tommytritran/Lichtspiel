//
//  TMDBService.swift
//  Lichtspiel
//
//  Created by Tommy Tran on 14/02/2022.
//

import Foundation
import SwiftUI




class TMDBService{
    
    private var apiKey: String = Util().apiKey
    
    private var baseURL:String = Util().baseUrl
    
    private var baseImgURL:String = Util().baseImgUrl
    
    func trendingURL() -> URL? {
        return URL(string:"\(self.baseURL)/trending/all/day\(self.apiKey)")
    }
    
    func recommendationsUrl(movieId:Int) -> URL? {
        return URL(string: "\(self.baseURL)/movie/\(movieId)/similar\(self.apiKey)")
    }
    
    func getImgUrl(path:String, size:ImageSize) -> String {
        return "\(baseImgURL)\(size.getSize())\(path)\(apiKey)"
    }
    
    func movieUrl(movieId:Int) -> URL? {
        return URL(string:"\(baseURL)/movie/\(movieId)\(self.apiKey)")
    }
}
