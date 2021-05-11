//
//  AlbumDetailsViewModel.swift
//  AlbumApp
//
//  Created by Raul Sulaimanov on 11.05.21.
//

import Foundation
import UIKit

//Constructed the struct using https://app.quicktype.io based on the given JSON model
// MARK: - AlbumPhotoElement
struct AlbumPhotoElement: Codable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}

typealias AlbumPhotos = [AlbumPhotoElement]
//MARK: - AlbumDetailsVM

class AlbumDetailsViewModel {
    var albumPhotoURLs: [URL] = []
    var albumTitle: String
    var albumId: Int
    
    init(albumTitle: String, albumId: Int) {
        self.albumTitle = albumTitle
        self.albumId = albumId
    }
    
    func downloadJson(_ onSuccess: ((AlbumPhotos) -> Void)?) {
        let urlString =  "https://jsonplaceholder.typicode.com/photos"
        
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    if let decodedResponse = try? JSONDecoder().decode(AlbumPhotos.self, from: data) {
                        DispatchQueue.main.async {
//                            self.albumPhotos = decodedResponse
                            
                            decodedResponse.forEach { photo in
                                if photo.albumID == self.albumId {
                                    if let url: URL = URL(string: photo.url) {
                                        self.albumPhotoURLs.append(url)
                                    }
                                }
                            }
                            
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
