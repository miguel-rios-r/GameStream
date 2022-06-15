//
//  SearchGame.swift
//  GameViewApp
//
//  Created by Miguel Rios on 14/6/22.
//

import Foundation

class SearchGame: ObservableObject {
    
    @Published var gameInfo = [Game]()
    
    func search(gameName: String) {
        
        gameInfo.removeAll()
        
        let gameNameSpaces = gameName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let url = URL(string: "https://gamestream-api.herokuapp.com/api/games/search?contains=\(gameNameSpaces ?? "cuphead")")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
            do{
                if let jsonData = data {
                    print("Tamaño del json: \(jsonData)")
                    let decodedData = try
                        JSONDecoder().decode(GameSearchResults.self, from: jsonData)
                    DispatchQueue.main.async {
                        self.gameInfo.append(contentsOf: decodedData.results)
                    }
                }
            } catch {
                print("Error: \(error)")
            }
        }.resume()
    }
}
