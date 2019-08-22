//
//  FilmCell.swift
//  GhibliAPI
//
//  Created by John Heifetz on 22/08/2019.
//  Copyright © 2019 heif_team. All rights reserved.
//

import UIKit

class FilmCell: UITableViewCell {
    @IBOutlet var filmTitle: UILabel!
    @IBOutlet var filmDecription: UILabel!
    @IBOutlet var filmDirector: UILabel!
    @IBOutlet var filmProducer: UILabel!
    @IBOutlet var filmReleaseDate: UILabel!
    @IBOutlet var filmRating: UILabel!
    
    func configureCell(with films: Films) {
        filmTitle.text = films.title
        filmDecription.text = films.description
        filmDirector.text = films.director
        filmProducer.text = films.producer
        filmReleaseDate.text = "Year: \(films.release_date ?? 0)"
        filmRating.text = "Rotten Tomatoes score: \(films.rt_score ?? 0)"
    }
    
}
