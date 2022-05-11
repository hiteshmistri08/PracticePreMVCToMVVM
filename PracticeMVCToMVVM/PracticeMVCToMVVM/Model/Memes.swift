//
//  Memes.swift
//  PracticeMVCToMVVM
//
//  Created by Hitesh on 10/05/22.
//

import Foundation

// MARK: - MemesResponse
struct MemesResponse: Decodable {
    let success: Bool
    let data: MemeData
}

// MARK: - MemeData
struct MemeData: Decodable {
    let memes: [Meme]
}

// MARK: - Meme
struct Meme: Decodable {
    let id, name: String
    let url: String
    let width, height, boxCount: Int

    enum CodingKeys: String, CodingKey {
        case id, name, url, width, height
        case boxCount = "box_count"
    }
}
