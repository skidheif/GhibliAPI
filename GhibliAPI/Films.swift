//
//  Films.swift
//  GhibliAPI
//
//  Created by John Heifetz on 22/08/2019.
//  Copyright © 2019 heif_team. All rights reserved.
//

struct Films: Decodable {
    let title: String?
    let description: String?
    let director: String?
    let producer: String?
    let releaseDate: String?
    let rtScore: String?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "description"
        case director = "director"
        case producer = "producer"
        case releaseDate = "release_date"
        case rtScore = "rt_score"
    }

    init (dictFilms: [String: Any]){
        title = dictFilms["title"] as? String
        description = dictFilms["description"] as? String
        director = dictFilms["director"] as? String
        producer = dictFilms["producer"] as? String
        releaseDate = dictFilms["release_date"] as? String
        rtScore = dictFilms["rt_score"] as? String
    }
    
    static func getFilms(from jsonData: Any) -> [Films] {
        guard let jsonData = jsonData as? Array<[String: Any]> else { return [] }
        return jsonData.compactMap { Films(dictFilms: $0) }
    }
}
