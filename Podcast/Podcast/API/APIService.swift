//
//  APIService.swift
//  Podcast
//
//  Created by Christophe Bugnon on 10/11/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import Alamofire

class APIService {

    static let shared = APIService()

    private let baseItunesSearchUrl = "https://itunes.apple.com/search"

    func fetchPodcasts(searchText: String, completionHandler: @escaping ([Podcast]) -> Void) {
        let parameters = ["term": searchText, "media": "podcast"]

        Alamofire.request(baseItunesSearchUrl, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).response { (dataResponse) in
            if let err = dataResponse.error {
                print("Failed to contact itunes API:", err)
                return
            }

            guard let data = dataResponse.data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completionHandler(searchResult.results)
            } catch let decodeErr {
                print("Failed to decode Search Result:", decodeErr)
            }
        }
    }
}
