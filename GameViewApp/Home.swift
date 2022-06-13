//
//  Home.swift
//  GameViewApp
//
//  Created by Miguel Rios on 12/6/22.
//

import SwiftUI
import AVKit

struct Home: View {
    @State var selectedTab: Int = 2
    var body: some View {
        TabView(selection: $selectedTab){
            HomeView()
                .tabItem{
                    Image(systemName: "person")
                }.tag(0)
            HomeView()
                .tabItem{
                    Image(systemName: "gamecontroller")
                }.tag(1)
            HomeView()
                .tabItem{
                    Image(systemName: "house")
                }.tag(2)
            HomeView()
                .tabItem{
                    Image(systemName: "heart")
                }.tag(3)
            HomeView()
                .tabItem{
                    Image(systemName: "slider.horizontal.3")
                }.tag(4)
        }
    }
}

struct HomeView: View {
    @State var searchText = ""
    
    var body: some View{
        ZStack {
            Color("Bg-Color").ignoresSafeArea()
            VStack {
                Image("appLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit).frame(width: 250)
                    .padding(.bottom, 42)
                HStack{
                    ZStack(alignment: .leading) {
                        Text(searchText.isEmpty ? "Search" : searchText)
                            .foregroundColor(Color("Light-Gray"))
                        TextField("", text: $searchText)
                            .foregroundColor(.white)
                    }.padding([.top, .leading, .bottom], 11.0)
                        .background(Color("Blue-Gray"))
                        .clipShape(Capsule())
                    Button(action: applySearch, label:{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(searchText.isEmpty ? .gray : .white)
                    })
                }.padding(.horizontal, 30)
                Populares()
            }
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
    
    func applySearch (){
        print("Applying search")
        searchText = "Nothing here"
    }
}

struct Populares: View {
    @State var playerActive = false
    @State var video_url: String = "https://dl.dropboxusercontent.com/s/k6g0zwmsxt9qery/TheWitcher480.mp4"
    
    var body: some View {
        ScrollView{
            VStack{
                Text("Populares")
                    .foregroundColor(.white)
                    .font(.title3)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                
                ZStack{
                    Button(action: {
                        video_url = "https://dl.dropboxusercontent.com/s/k6g0zwmsxt9qery/TheWitcher480.mp4"
                        print(video_url)
                        playerActive = true
                    }, label: {
                        VStack(spacing: 0){
                            Image("The_Witcher_3")
                                .resizable()
                                .scaledToFit()
                            Text("The Witcher 3")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(Color("Blue-Gray"))
                        }
                    })
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .frame(width: 42, height: 42)
                        .foregroundColor(.white)
                }
                
            }.padding(.horizontal, 30)
            
            NavigationLink(
                destination: VideoPlayer(player: AVPlayer(url: URL(string: video_url)!)),
                isActive: $playerActive,
                label: {
                    EmptyView()
                }
                
            )
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
