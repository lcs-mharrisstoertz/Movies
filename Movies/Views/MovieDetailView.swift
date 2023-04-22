//
//  MovieDetailView.swift
//  Movies
//
//  Created by Morgan Harris-Stoertz on 2023-04-20.
//

import SwiftUI

struct MovieDetailView: View {
    
    //MARK: stored properties
    
    @State var movieInfoOpacity = 0.0
    @State var currentMovie: Movie?
   
    
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
                
                Button(action: {
                    movieInfoOpacity = 0.0

                    Task {
                        withAnimation {
                            currentMovie = nil
                        }
                        currentMovie = await NetworkService.fetch()
                    }
                }, label: {
                    Text("Fetch another one")
                })
                .disabled(movieInfoOpacity == 0.0 ? true : false)
                .buttonStyle(.borderedProminent)
              
            }
            .navigationTitle("Movie Suggestion")
        }
        
        .task{
            currentMovie = await NetworkService.fetch()
        }
        
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView()
    }
}
