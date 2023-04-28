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
    @BlackbirdColumn var Title: String
    @BlackbirdColumn var Year: Int
    @BlackbirdColumn var Rated: String
    @BlackbirdColumn var Director: String
    @BlackbirdColumn var Poster: String
    @BlackbirdColumn var imdbRating: Double
    @BlackbirdColumn var imbdID: String
}



let exampleMovie = Movie(Title:"Star Wars",
                         Year: 1995,
                         Rated: "pg",
                         Director: "Some director",
                         Poster: "https://m.media-amazon.com/images/M/MV5BOTA5NjhiOTAtZWM0ZC00MWNhLThiMzEtZDFkOTk2OTU1ZDJkXkEyXkFqcGdeQXVyMTA4NDI1NTQx._V1_SX300.jpg",
                         imdbRating: 5.7,
                         imbdID: "tt0076759")
