//
//  GamesView.swift
//  GameViewApp
//
//  Created by Miguel Rios on 14/6/22.
//

import SwiftUI
import Kingfisher

struct GamesView: View {
    @ObservedObject var allGames = ViewModel()
    @State var gameViewIsActive: Bool = false
    @State var url: String = ""
    @State var title: String = ""
    @State var studio: String = ""
    @State var contentRaiting: String = ""
    @State var publicationYear: String = ""
    @State var description: String = ""
    @State var platforms: [String] = [""]
    @State var tags: [String] = [""]
    @State var galleryImages: [String] = [""]
    
    let formaGrid = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            Color("Bg-Color").ignoresSafeArea()
            VStack{
                Text("All Games")
                    .font(.title2)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 5, trailing: 0))
                ScrollView{
                    LazyVGrid(columns: formaGrid, spacing: 8) {
                        ForEach(allGames.gamesInfo, id: \.self) {
                            game in
                            Button(action: {
                                url = game.videosUrls.mobile
                                title = game.title
                                studio = game.studio
                                contentRaiting = game.contentRaiting
                                publicationYear = game.publicationYear
                                description = game.description
                                platforms = game.platforms
                                tags = game.tags
                                galleryImages = game.galleryImages
                                print("Game: \(game.title)")
                                gameViewIsActive = true
                            }, label: {
                                VStack{
                                    KFImage(URL(string: game.galleryImages[0]))
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .clipShape(RoundedRectangle .init(cornerRadius: 10))
                                    Text("\(game.title)")                                }
                            })
                        }
                        
                    }
                }.padding(.bottom, 8)
            }.padding(.horizontal, 6)
            NavigationLink(destination: SingleGameView(url: url, title: title, studio: studio, contentRaiting: contentRaiting, publicationYear: publicationYear, description: description, platforms: platforms, tags: tags, galleryImages: galleryImages),
               isActive: $gameViewIsActive,
               label: {
                    EmptyView()
                }
            )
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true).onAppear(
            perform: {
                print("Start game view")
                print("\(allGames.gamesInfo[0].title)")
                print("\(allGames.gamesInfo[0])")
            }
        )
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
