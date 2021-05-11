//
//  AlbumAppTests.swift
//  AlbumAppTests
//
//  Created by Raul Sulaimanov on 11.05.21.
//

import XCTest
@testable import AlbumApp

class AlbumAppTests: XCTestCase {
    
    var sut: LandingPageViewModel!
    var sut1: AlbumDetailsViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = LandingPageViewModel()
        sut1 = AlbumDetailsViewModel(
            albumTitle: "quidem molestiae enim",
            albumId: 1
        )
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        sut = nil // release the sut
        try super.tearDownWithError()
    }
    
    // check for amount of elements in the JSON
    func testNumberOfAlbums() {
        sut.downloadJson { allAlbums in
            XCTAssertEqual(allAlbums.count, 100)
        }
    }
    
    // checking if the JSON is being decoded correctly
    func testFirstAlbum() {
        sut.downloadJson { allAlbums in
            if let first = allAlbums.first {
                XCTAssertEqual(first.id, 1)
                XCTAssertEqual(first.title, "quidem molestiae enim")
                XCTAssertEqual(first.userID, 1)
            }
        }
    }
    
    // check for amount of elements in the JSON
    func testNumberOfPhotos() {
        sut1.downloadJson { allAlbums in
            XCTAssertEqual(allAlbums.count, 5000)
        }
    }
    
    // checking if the JSON is being decoded correctly
    func testFirstPhoto() {
        sut1.downloadJson { allAlbums in
            if let first = allAlbums.first {
                XCTAssertEqual(first.id, 1)
                XCTAssertEqual(first.title, "accusamus beatae ad facilis cum similique qui sunt")
                XCTAssertEqual(first.albumID, 1)
                XCTAssertEqual(first.url, "https://via.placeholder.com/600/92c952")
                XCTAssertEqual(first.thumbnailURL, "https://via.placeholder.com/150/92c952")
            }
        }
    }

}
