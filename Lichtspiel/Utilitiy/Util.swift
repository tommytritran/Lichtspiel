//
//  Util.swift
//  Lichtspiel
//
//  Created by Tommy Tran on 15/02/2022.
//

import Foundation
import SwiftUI

struct Util {
    let apiKey = "?api_key=08cb7205eaa1a25111cf1ead0ed907e2"
    let baseUrl = "https://api.themoviedb.org/3"
    let baseImgUrl = "https://image.tmdb.org/t/p/"
    
    
}

enum ImageSize{
    case small
    case poster
    
    func getSize() -> String {
        switch self {
        case .small:
            return "w92"
        case .poster:
            return "original"
        }
    }
}
