//
//  Movie.swift
//  LearningTask-6.3
//
//  Created by rafael.rollo on 15/04/2022.
//

import Foundation

struct Movie {
    var backgroundImage: String
    var posterImage: String
    var title: String
    var rating: MovieRating
    var durationInMinutes: TimeInterval
    var criticsScore: Int
    var publicScore: Int
    
    var duration: TimeInterval {
        return durationInMinutes
    }
    
    init(backgroundImage: String, posterImage: String, title: String, rating: MovieRating, durationInMinutes: TimeInterval, criticsScore: Int, publicScore: Int) {
        self.backgroundImage = backgroundImage
        self.posterImage = posterImage
        self.title = title
        self.rating = rating
        self.durationInMinutes = durationInMinutes
        self.criticsScore = criticsScore
        self.publicScore = publicScore
    }
}

enum MovieRating: String, RawRepresentable {
    case free = "L"
    case notRecommendedUnder10 = "10"
    case notRecommendedUnder12 = "12"
    case notRecommendedUnder14 = "14"
    case notRecommendedUnder16 = "16"
    case notRecommendedUnder18 = "18"
}
