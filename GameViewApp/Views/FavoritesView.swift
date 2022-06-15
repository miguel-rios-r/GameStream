//
//  FavoritesView.swift
//  GameViewApp
//
//  Created by Miguel Rios on 14/6/22.
//

import SwiftUI
import AVKit

struct FavoritesView: View {
    
    @ObservedObject var allgames = ViewModel()
    
    var body: some View {
        ZStack {
            Color("Bg-Color").ignoresSafeArea()
            
            VStack {
                Text("Favorites")
                    .font(.title2)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 5, trailing: 0))
                ScrollView {
                    ForEach(allgames.gamesInfo, id: \.self) {
                        game in
                        VStack(spacing: 0){
                            VideoPlayer(player: AVPlayer(url: URL(string: game.videosUrls.mobile)!))
                                .frame(height: 300)
                            Text(game.title)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(Color("Blue-Gray"))
                        }
                    }
                }.padding(.bottom, 8)
            }
            
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
