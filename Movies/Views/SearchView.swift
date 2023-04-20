//
//  SearchView.swift
//  Movies
//
//  Created by Morgan Harris-Stoertz on 2023-04-20.
//

import SwiftUI

struct SearchView: View {
    //MARK: Stored properties
    @State var foundMovies: [Movie] = []
    
    //MARK: Computed properties
    var body: some View {
        List(foundMovies, id: \.self){ currentMovie in
            VStack{
                Text(currentMovie.title)
                    .bold()
                Text(currentMovie.director)
                    .italic()
            }
        }
                
                
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
