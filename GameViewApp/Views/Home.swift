//
//  Home.swift
//  GameViewApp
//
//  Created by Miguel Rios on 12/6/22.
//

import SwiftUI

struct Home: View {
    @State var selectedTab: Int = 2
    var body: some View {
        ZStack {
            Color("Bg-Color").navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            TabView(selection: $selectedTab){
                ProfileView()
                    .tabItem{
                        Image(systemName: "person")
                    }.tag(0)
                GamesView()
                    .badge("*")
                    .tabItem{
                        Image(systemName: "gamecontroller")
                    }.tag(1)
                HomeView()
                    .tabItem{
                        Image(systemName: "house")
                    }.tag(2)
                FavoritesView()
                    .tabItem{
                        Image(systemName: "heart")
                    }.tag(3)
            }
            .accentColor(.white)
        }
    }
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(Color("Navbar-Color"))
        UITabBar.appearance().isTranslucent = true
        
        print("iniciando las vistas de home")
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
