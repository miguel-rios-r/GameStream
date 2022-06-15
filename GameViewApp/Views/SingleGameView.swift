//
//  SingleGameView.swift
//  GameViewApp
//
//  Created by Miguel Rios on 14/6/22.
//

import SwiftUI
import AVKit
import Kingfisher

struct SingleGameView: View {
    
    var url: String
    var title: String
    var studio: String
    var contentRaiting: String
    var publicationYear: String
    var description: String
    var platforms: [String]
    var tags: [String]
    var galleryImages: [String]
    
    var body: some View {
        ZStack{
            Color("Bg-Color").ignoresSafeArea()
            VStack{
                SingleVideo(url: url).frame(height: 300)
                ScrollView {
                    SingleVideoInfo(title: title, studio: studio, publicationYear: publicationYear, description: description, tags: tags, galleryImages: galleryImages)
                }.frame(maxWidth: .infinity)
            }
        }
    }
}

struct SingleVideo: View {
    var url:String
    var body: some View {
        VideoPlayer(player: AVPlayer(url: URL(string: url)!)).ignoresSafeArea()
    }
}

struct SingleVideoInfo: View {
    var title: String
    var studio: String
    var publicationYear: String
    var description: String
    var tags: [String]
    var galleryImages: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding(.leading)
                .padding(.top)
            HStack{
                Text(studio)
                    .foregroundColor(.gray)
                    .font(.subheadline)
                    .padding(.top, 1)
                    .padding(.leading)
                Text(publicationYear)
                    .foregroundColor(.gray)
                    .font(.subheadline)
                    .padding(.top, 1)
                    .padding(.trailing)
            }
            Text(description)
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.top, 5)
                .padding(.leading)
                .padding(.trailing)
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(tags, id:\.self) {
                        tag in
                        Text(tag)
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .padding()
                            .background(Color("Blue-Gray"))
                            
                    }
                }
            }.padding(.top, 5).padding(.leading).padding(.trailing).padding(.bottom, 8)
            
            Gallery(galleryImages: galleryImages)
            
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct Gallery: View {
    var galleryImages: [String]
    
    let formaGrid = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Gallery")
                .foregroundColor(.white)
                .font(.title2)
                .padding(.leading)
                .padding(.top)
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: formaGrid, spacing: 8){
                    ForEach(galleryImages, id: \.self) {
                        imgUrl in
                        KFImage(URL(string: imgUrl))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                }
            }.frame(height: 180)
        }
    }
        
}

struct SingleGameView_Previews: PreviewProvider {
    static var previews: some View {
        SingleGameView(url: "example.ocm", title: "Sonic", studio: "Mimslab studio", contentRaiting: "contentRaiting", publicationYear: "2022", description: "The Master Chief’s iconic journey includes six games, built for PC and collected in a single integrated experience. Whether you’re a long-time fan or meeting Spartan 117 for the first time, The Master Chief Collection is the definitive Halo gaming experience.", platforms: ["platforms"], tags: ["video", "game", "tag", "hard", "coded", "just", "for", "example"], galleryImages: ["galleryImages"])
    }
}
