//
//  MovieDetailView.swift
//  Movies
//
//  Created by Morgan Harris-Stoertz on 2023-04-20.
//

import SwiftUI

struct MovieDetailView: View {
    
    //MARK: stored properties
    @State var currentMovie = exampleMovie
    
    //MARK: computed properties
    var body: some View {
        NavigationView{
            VStack{
                Text(currentMovie.title)
                    .font(.title)
                    .multilineTextAlignment(.center)
            }
            .navigationTitle("Movie Suggestion")
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView()
    }
}
