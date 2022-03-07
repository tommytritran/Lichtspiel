//
//  Util.swift
//  Lichtspiel
//
//  Created by Tommy Tran on 15/02/2022.
//

import Foundation
import SwiftUI

struct Util {
    let apiKey = "add your own api key"
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
