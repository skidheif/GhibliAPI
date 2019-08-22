//
//  ViewController.swift
//  GhibliAPI
//
//  Created by John Heifetz on 22/08/2019.
//  Copyright © 2019 heif_team. All rights reserved.
//

import UIKit

class FilmsViewController: UITableViewController {
    
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    private let ghibliAPI = "https://ghibliapi.herokuapp.com/films"
    private var films: [Films] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return films.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FilmCell
        
        let film = films[indexPath.row]
        cell.configureCell(with: film)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func fetchData(){
        guard let url = URL(string: ghibliAPI) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            
            do {
                self.films = try JSONDecoder().decode([Films].self, from: data)
//                DispatchQueue.main.async {
//                    self.activityIndicator.stopAnimating()
//                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

