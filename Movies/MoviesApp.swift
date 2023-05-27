//
//  MoviesApp.swift
//  Movies
//
//  Created by Morgan Harris-Stoertz on 2023-04-20.
//

import SwiftUI

@main
struct MoviesApp: App {
    var body: some Scene {
        WindowGroup {
//            MovieDetailView()
//                .environment(\.blackbirdDatabase, AppDatabase.instance)
            
            TabView{
                MovieDetailView(movieToShow: exampleMovie)
                    .tabItem{
                        Label("Find Movies", systemImage: "videoprojector.fill")
                    }
                FavouritesView()
                    .tabItem{
                        Label("Watch List", systemImage: "star.fill")
                    }
            }
            
            .environment(\.blackbirdDatabase, AppDatabase.instance)
        }
    }
}
