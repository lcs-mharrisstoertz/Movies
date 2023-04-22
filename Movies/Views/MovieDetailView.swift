//
//  MovieDetailView.swift
//  Movies
//
//  Created by Morgan Harris-Stoertz on 2023-04-20.
//

import SwiftUI

struct MovieDetailView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Star Wars")
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
