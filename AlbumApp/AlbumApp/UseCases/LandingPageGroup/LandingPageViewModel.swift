//
//  LandingPageViewModel.swift
//  AlbumApp
//
//  Created by Raul Sulaimanov on 11.05.21.
//

import Foundation

// MARK: - AlbumElement
struct AlbumElement: Codable {
    let userID, id: Int
    let title: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title
    }
}

typealias Albums = [AlbumElement]

class LandingPageViewModel {
    var allAlbums: [AlbumElement] = []
    
    init() {
        
    }
    
    func downloadJson(_ onSuccess: ((Albums) -> Void)?) {
        let urlString =  "https://jsonplaceholder.typicode.com/albums"
        
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    if let decodedResponse = try? JSONDecoder().decode(Albums.self, from: data) {
                        DispatchQueue.main.async {
                            self.allAlbums = decodedResponse
                            onSuccess?(decodedResponse)
                        }
                        return
                    }
                }
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            }.resume()
        }
    }
}
