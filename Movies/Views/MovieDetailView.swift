//
//  MovieDetailView.swift
//  Movies
//
//  Created by Morgan Harris-Stoertz on 2023-04-20.
//

import SwiftUI

struct MovieDetailView: View {
    
    //MARK: stored properties
    @State var currentMovie = Movie?
   
    
    //MARK: computed properties
    var body: some View {
        NavigationView{
            VStack{
                
                if let currentMovie = currentMovie{
                    Text(currentMovie.title)
                        .font(.title)
                        .multilineTextAlignment(.center)
                } else {
                    ProgressView()
                }
                
                
                
              
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
