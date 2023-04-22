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
                    Text("Movie title: \(currentMovie.title)")
                        .font(.title)
                        .multilineTextAlignment(.center)
                    
                    
                    
                    
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
                                                   currentMovie.title,
                                                   currentMovie.year,
                                                   currentMovie.rated,
                                                   currentMovie.director,
                                                   currentMovie.poster,
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
        MovieDetailView()
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
