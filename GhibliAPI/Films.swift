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
    let release_date: Int?
    let rt_score: Int?
}
