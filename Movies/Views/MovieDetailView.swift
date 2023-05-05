//
//  MovieDetailView.swift
//  Movies
//
//  Created by Morgan Harris-Stoertz on 2023-04-20.
//
import Blackbird
import SwiftUI

struct MovieDetailView: View {
    
    //MARK: stored properties
    @State var movieToShow: Movie
    @Environment(\.blackbirdDatabase) var db: Blackbird.Database?
    @State var movieInfoOpacity = 0.0
    @State var currentMovie: Movie?
    @State var savedToDatabase = false
   
    
    //MARK: computed properties
    var body: some View {
        NavigationView{
            VStack{
                
                Spacer()
                
                if let currentMovie = currentMovie{
                    
                    HStack{
                        Text("Movie title: \(currentMovie.Title)")
                            .font(.title)
                            .bold()
                            .multilineTextAlignment(.center)
                        
                        RemoteImageView(urlOfImageToShow: movieToShow.Poster)
                            
                    }
                    
                    HStack{
                        Text(currentMovie.Director)
                            .font(.title3)
                            .italic()
                        Text(currentMovie.Rated)
                            .font(.title3)
                            .bold()
                    }
                   
                    
                    
                    
                    
                } else {
                    ProgressView()
                }
                
                
               Spacer()
                
                HStack{
                    Button(action: {
                        movieInfoOpacity = 0.0

                        Task {
                            withAnimation {
                                currentMovie = nil
                            }
                            currentMovie = await NetworkService.fetch()
                            savedToDatabase = false
                        }
                    }, label: {
                        Text("Generate New Movie")
                    })
                    .disabled(movieInfoOpacity == 0.0 ? true : false)
                    .buttonStyle(.borderedProminent)
                    
                    Button(action: {
                        Task{
                            if let currentMovie = currentMovie {
                                try await db!.transaction{ core in
                                    try core.query("INSERT INTO Movie (title, year, rated, director, poster, imdbRating) VALUES (?, ?, ?, ?, ?, ?)",
                                                   currentMovie.Title,
                                                   currentMovie.Year,
                                                   currentMovie.Rated,
                                                   currentMovie.Director,
                                                   currentMovie.Poster,
                                                   currentMovie.imdbRating)
                                    
                                    savedToDatabase = true
                                }
                            }
                        }
                    }, label: {
                        Text("Add to Watch List")
                    })
                    .disabled(savedToDatabase == true ? true : false)
                    .tint(.green)
                    .buttonStyle(.borderedProminent)
                }
                
            
              
            }
            .navigationTitle("Movie Suggestion")
        }
        
        .task {
            if currentMovie == nil {
                currentMovie = await NetworkService.fetch()
            }
        }
        
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieToShow: exampleMovie)
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
