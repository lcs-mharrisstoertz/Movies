//
//  FavouritesView.swift
//  Movies
//
//  Created by Morgan Harris-Stoertz on 2023-04-22.
//
import Blackbird
import SwiftUI

struct FavouritesView: View {
    
    //MARK: stored properties
    @BlackbirdLiveModels({ db in
        try await Movie.read(from: db)
    }) var favouriteMovies
    
    //MARK: computed properties
    var body: some View {
        NavigationView{
            List(favouriteMovies.results){currentMovie in
                VStack(alignment: .leading){
                    Text(currentMovie.Title)
                        .bold()
                    HStack{
                        Text(currentMovie.Director)
                        Text(currentMovie.Rated)
                    }
                   
                }
            }
            .navigationTitle("Movies to Watch")
        }
      
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
