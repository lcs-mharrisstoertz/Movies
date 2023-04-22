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
                MovieDetailView()
                    .tabItem{
                        Label("New", systemImage: "carrot")
                    }
                FavouritesView()
                    .tabItem{
                        Label("Watch List", systemImage: "face.smiling")
                    }
            }
            
            .environment(\.blackbirdDatabase, AppDatabase.instance)
        }
    }
}
