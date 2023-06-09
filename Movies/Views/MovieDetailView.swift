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
    @State var input = ""
   
    
    //MARK: computed properties
    var body: some View {
        NavigationView{
            VStack{
                
                
                if let currentMovie = currentMovie{
                   
                    VStack{
                        HStack{
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 30))
                            TextField("Search Movie Title",
                                      text: $input)
                            .multilineTextAlignment(.leading)
                            .font(.largeTitle)
                        }
                        .padding()
                           
                            
                           
                       
                        VStack{
                           
                                Text(currentMovie.Title)
                                .foregroundColor(.white)
                                    .font(.title)
                                    .bold()
                                    .multilineTextAlignment(.center)
                                
                                RemoteImageView(urlOfImageToShow: currentMovie.Poster)
                            HStack{
                                Text(currentMovie.Director)
                                    .foregroundColor(.red)
                                    .font(.title3)
                                    .italic()
                                    .bold()
                                Text(currentMovie.Rated)
                                    .foregroundColor(.white)
                                    .font(.title3)
                                    .bold()
                            }
                               
                        }
                        .padding()
                        .background(Color.black)
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
                            currentMovie = await NetworkService.fetch(resultsFor: input)
                            //need to add an input that can change for this
                            //get input that changes from text field
                            savedToDatabase = false
                        }
                    }, label: {
                        Text("Search For Movie")
                    })
                    .buttonStyle(.borderedProminent)
                    
                    Button(action: {
                        Task{
                            if let currentMovie = currentMovie {
                                try await db!.transaction{ core in
                                    try core.query("INSERT INTO Movie (Title, Year, Rated, Director, Poster, imdbRating, imdbID) VALUES (?, ?, ?, ?, ?, ?, ?)",
                                                   currentMovie.Title,
                                                   currentMovie.Year,
                                                   currentMovie.Rated,
                                                   currentMovie.Director,
                                                   currentMovie.Poster,
                                                   currentMovie.imdbRating,
                                                   currentMovie.imdbID)
                                    
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
            .navigationTitle("Movie Finder")
        }
        
        .task {
            if currentMovie == nil {
                currentMovie = await NetworkService.fetch(resultsFor: "harry potter")
                    
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
