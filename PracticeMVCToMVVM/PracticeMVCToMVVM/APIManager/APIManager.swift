//
//  APIManager.swift
//  PracticeMVCToMVVM
//
//  Created by Hitesh on 10/05/22.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    
    private init() { }
    
    func getMemes(completion:@escaping(Result<MemesResponse,Error>) -> Void) {
        URLSession.shared.dataTask(with: URL(string: "https://api.imgflip.com/get_memes")!) { data, urlResponse, error in
            guard error == nil else {
                return completion(.failure(error!))
            }
            guard let responseData = data else {
                return completion(.failure(NSError(domain: "Data not found", code: 0)))
            }
            
            let decoder = JSONDecoder()
            guard let model = try? decoder.decode(MemesResponse.self, from: responseData) else {
                return completion(.failure(NSError(domain: "Invalid data", code: 0)))
            }

            completion(.success(model))
        }.resume()
    }
}
