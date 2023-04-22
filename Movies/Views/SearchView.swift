//
//  SearchView.swift
//  Movies
//
//  Created by Morgan Harris-Stoertz on 2023-04-20.
//

//import SwiftUI
//
//struct SearchView: View {
//    //MARK: Stored properties
//   @State var foundMovies: [Movie] = []
//
//    //MARK: Computed properties
//    var body: some View {
//        List(foundMovies, id: \.self){ movie in
//            VStack(alignment: .leading){
//                Text(movie.title)
//                    .bold()
//                Text(movie.director)
//                    .italic()
//            }
//        }
//        .task {
//            foundMovies = await NetworkService.fetch()
//        }
//
//    }
//}
//
//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}












//import SwiftUI
//
//struct SearchView: View {
//    //MARK: Stored properties
//   @State var foundMovies: [Movie] = []
//
//    //MARK: Computed properties
//    var body: some View {
//
//        List(foundMovies, id: \.self){ currentMovie in
//            VStack{
//                Text(currentMovie.title)
//                    .bold()
//                Text(currentMovie.director)
//                    .italic()
//            }
//        }
//        .task {
//            foundMovies = await NetworkService.fetch()
//        }
//
//    }
//}
//
//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
