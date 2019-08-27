//
//  ViewController.swift
//  GhibliAPI
//
//  Created by John Heifetz on 22/08/2019.
//  Copyright © 2019 heif_team. All rights reserved.
//

import UIKit
import Alamofire

class FilmsViewController: UITableViewController {
    
    private let ghibliAPI = "https://ghibliapi.herokuapp.com/films"
    private var films: [Films] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataWithAlamofire()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return films.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FilmCell
        
        let film = films[indexPath.row]
        cell.configureCell(with: film)
        
        return cell
    }
    
    // MARK: - TableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    
    
    func fetchDataWithAlamofire(){
        guard let url = URL(string: ghibliAPI) else { return }
        request(url).validate().responseJSON { dataResponse in
            
            switch dataResponse.result {
            case .success(let value):
                self.films = Films.getFilms(from: value)
                print(self.films)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
