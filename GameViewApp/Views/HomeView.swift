//
//  HomeView.swift
//  GameViewApp
//
//  Created by Miguel Rios on 14/6/22.
//

import SwiftUI
import AVKit

struct HomeView: View {
    @State var searchText = ""
    @State var isSearchEmpty = false
    @State var isGameViewActive = false
    @State var url: String = ""
    @State var title: String = ""
    @State var studio: String = ""
    @State var contentRaiting: String = ""
    @State var publicationYear: String = ""
    @State var description: String = ""
    @State var platforms: [String] = [""]
    @State var tags: [String] = [""]
    @State var galleryImages: [String] = [""]
    
    @ObservedObject var gameFound = SearchGame()
    
    var body: some View{
        ZStack {
            Color("Bg-Color").ignoresSafeArea()
            VStack {
                Image("appLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit).frame(width: 250)
                    .padding(.bottom, 42)
                    .padding(.top)
                HStack{
                    ZStack(alignment: .leading) {
                        Text(searchText.isEmpty ? "Search" : searchText)
                            .foregroundColor(Color("Light-Gray"))
                        TextField("", text: $searchText)
                            .foregroundColor(.white)
                    }.padding([.top, .leading, .bottom], 11.0)
                        .background(Color("Blue-Gray"))
                        .clipShape(Capsule())
                    Button(action: {
                        if (searchText.isEmpty) {
                            isSearchEmpty = true
                        } else {
                            applySearch(searchText: searchText)
                        }
                    }, label:{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(searchText.isEmpty ? .gray : .white)
                    })
                }.padding(.horizontal, 30).padding(.bottom).alert(isPresented: $isSearchEmpty){
                    Alert(title: Text("Error"), message: Text("Not found"), dismissButton: .default(Text("OK")))
                }
               ScrollView{
                   Populares()
                   Categories()
                   Recomendations()
               }.padding(.bottom, 8)
            }
            
            NavigationLink(
                destination: SingleGameView(url: url, title: title, studio: studio, contentRaiting: contentRaiting, publicationYear: publicationYear, description: description, platforms: platforms, tags: tags, galleryImages: galleryImages),
                isActive: $isGameViewActive,
                label: {
                    EmptyView()
                }
            )
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
        
    }
    
    func applySearch (searchText: String){
        let inputText: String = searchText
        print("Applying search: \(inputText)")
        
        gameFound.search(gameName: "\(inputText)")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            print("Cantidad elementos: \(gameFound.gameInfo.count)")
            if ( gameFound.gameInfo.count == 0 ) {
                isSearchEmpty = true
            }
            url = gameFound.gameInfo[0].videosUrls.mobile
            title = gameFound.gameInfo[0].title
            studio = gameFound.gameInfo[0].studio
            contentRaiting = gameFound.gameInfo[0].contentRaiting
            publicationYear = gameFound.gameInfo[0].publicationYear
            description = gameFound.gameInfo[0].description
            platforms = gameFound.gameInfo[0].platforms
            tags = gameFound.gameInfo[0].tags
            galleryImages = gameFound.gameInfo[0].galleryImages
            isGameViewActive = true
        }
    }
    
}

struct Populares: View {
    @State var isGameViewActive = false
    
    @ObservedObject var gameFound = SearchGame()
    
    @State var url: String = ""
    @State var title: String = ""
    @State var studio: String = ""
    @State var contentRaiting: String = ""
    @State var publicationYear: String = ""
    @State var description: String = ""
    @State var platforms: [String] = [""]
    @State var tags: [String] = [""]
    @State var galleryImages: [String] = [""]
    
    var body: some View {
        VStack{
            Text("Populares")
                .foregroundColor(.white)
                .font(.title3)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            ZStack{
                Button(action: {
                    getSingleGame(searchText: "Witcher")
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
            destination: SingleGameView(url: url, title: title, studio: studio, contentRaiting: contentRaiting, publicationYear: publicationYear, description: description, platforms: platforms, tags: tags, galleryImages: galleryImages),
            isActive: $isGameViewActive,
            label: {
                EmptyView()
            }
        )
    }
    func getSingleGame (searchText: String){
        let inputText: String = searchText
        print("Applying search: \(inputText)")
        
        gameFound.search(gameName: inputText)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            print("Cantidad elementos: \(gameFound.gameInfo.count)")
            
            url = gameFound.gameInfo[0].videosUrls.mobile
            title = gameFound.gameInfo[0].title
            studio = gameFound.gameInfo[0].studio
            contentRaiting = gameFound.gameInfo[0].contentRaiting
            publicationYear = gameFound.gameInfo[0].publicationYear
            description = gameFound.gameInfo[0].description
            platforms = gameFound.gameInfo[0].platforms
            tags = gameFound.gameInfo[0].tags
            galleryImages = gameFound.gameInfo[0].galleryImages
            
            isGameViewActive = true
            
        }
    }
}

struct Categories: View {
    var body: some View{
        VStack{
            Text("Categories")
                .foregroundColor(.white)
                .font(.title3)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    Button(action: {}, label: {
                        Image(systemName: "triangle.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color("Blue-Gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    })
                    Button(action: {}, label: {
                        Image(systemName: "square.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color("Blue-Gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    })
                    Button(action: {}, label: {
                        Image(systemName: "x.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color("Blue-Gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    })
                    Button(action: {}, label: {
                        Image(systemName: "circle.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color("Blue-Gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    })
                    Button(action: {}, label: {
                        Image(systemName: "logo.playstation")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color("Blue-Gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    })
                    Button(action: {}, label: {
                        Image(systemName: "logo.xbox")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color("Blue-Gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    })
                }
            }
        }.padding(.horizontal, 30)
    }
}

struct Recomendations: View {
    @State var isGameViewActive = false
    
    @ObservedObject var gameFound = SearchGame()
    
    @State var url: String = ""
    @State var title: String = ""
    @State var studio: String = ""
    @State var contentRaiting: String = ""
    @State var publicationYear: String = ""
    @State var description: String = ""
    @State var platforms: [String] = [""]
    @State var tags: [String] = [""]
    @State var galleryImages: [String] = [""]
    
    var body: some View{
        VStack{
            Text("Recomendations")
                .foregroundColor(.white)
                .font(.title3)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    Button(action: {
                        getSingleGame(searchText: "halo")
                    }, label: {
                        Image("HALO")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    })
                    Button(action: {
                        getSingleGame(searchText: "grand")
                    }, label: {
                        Image("GTA")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    })
                    Button(action: {
                        getSingleGame(searchText: "DEATH")
                    }, label: {
                        Image("CYBER_PUNK")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    })
                    Button(action: {
                        getSingleGame(searchText: "crash")
                    }, label: {
                        Image("CRASH")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    })
                }
            }
        }.padding(.horizontal, 30)
        NavigationLink(
            destination: SingleGameView(url: url, title: title, studio: studio, contentRaiting: contentRaiting, publicationYear: publicationYear, description: description, platforms: platforms, tags: tags, galleryImages: galleryImages),
            isActive: $isGameViewActive,
            label: {
                EmptyView()
            }
        )
    }
    func getSingleGame (searchText: String){
        let inputText: String = searchText
        print("Applying search: \(inputText)")
        
        gameFound.search(gameName: inputText)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            print("Cantidad elementos: \(gameFound.gameInfo.count)")
            
            url = gameFound.gameInfo[0].videosUrls.mobile
            title = gameFound.gameInfo[0].title
            studio = gameFound.gameInfo[0].studio
            contentRaiting = gameFound.gameInfo[0].contentRaiting
            publicationYear = gameFound.gameInfo[0].publicationYear
            description = gameFound.gameInfo[0].description
            platforms = gameFound.gameInfo[0].platforms
            tags = gameFound.gameInfo[0].tags
            galleryImages = gameFound.gameInfo[0].galleryImages
            
            isGameViewActive = true
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
