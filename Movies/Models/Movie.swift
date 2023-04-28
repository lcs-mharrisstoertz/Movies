//
//  Movie.swift
//  Movies
//
//  Created by Morgan Harris-Stoertz on 2023-04-20.
//
import Blackbird
import Foundation

//struct Movie: Codable, Hashable {
//    let title: String
//    let year: Int
//    let rated: String
//    let director: String
//    let poster: String
//    let imdbRating: Double
//}

struct Movie: Codable, Hashable, BlackbirdModel {
    @BlackbirdColumn var title: String
    @BlackbirdColumn var year: Int
    @BlackbirdColumn var rated: String
    @BlackbirdColumn var director: String
    @BlackbirdColumn var poster: String
    @BlackbirdColumn var imdbRating: Double
}

let exampleMovie = Movie(title: "Star Wars",
                         year: 1995,
                         rated: "pg",
                         director: "Some director",
                         poster: "https://m.media-amazon.com/images/M/MV5BOTA5NjhiOTAtZWM0ZC00MWNhLThiMzEtZDFkOTk2OTU1ZDJkXkEyXkFqcGdeQXVyMTA4NDI1NTQx._V1_SX300.jpg",
                         imdbRating: 5.7)
