//
//  Session.swift
//  LearningTask-6.3
//
//  Created by Italo cavalcanti on 04/11/22.
//

import Foundation

struct Session {
    var dateTime: Date
    var type: MovieType
    var movie: Movie
}

enum MovieType {
    case subtitled
    case dubbed
    
    var tipo:  String  {
        switch self {
        case .subtitled:
            return "Legendado"
        case .dubbed:
            return "Dublado"
        }
    }
}
