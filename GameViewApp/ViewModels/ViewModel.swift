//
//  ViewModel.swift
//  GameViewApp
//
//  Created by Miguel Rios on 14/6/22.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var gamesInfo = [Game]()
    
    init() {
        let url = URL(string: "https://gamestream-api.herokuapp.com/api/games")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            do{
                if let jsonData = data {
                    print("Tamaño del json: \(jsonData)")
                    let decodedData = try
                        JSONDecoder().decode([Game].self, from: jsonData)
                    DispatchQueue.main.async {
                        self.gamesInfo.append(contentsOf: decodedData)
                    }
                }
            } catch {
                print("Error: \(error)")
            }
        }.resume()
    }
    
}
