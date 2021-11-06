//
//  SearchViewController.swift
//  MusicPlayer
//
//  Created by 1 on 03.11.2021.
//

import UIKit
import Alamofire

class SearchMusicViewController: UITableViewController {
    
   var networkservice = NetworkService()
    
    private var timer: Timer?
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var tracks = [Track]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupSearchBar()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 90
    }
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tracks.count
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let track = tracks[indexPath.row]
        content.text = track.trackName
        content.secondaryText = track.artistName
        content.image = UIImage(named: "Image0")
        content.imageProperties.cornerRadius = 8
        cell.contentConfiguration = content
        return cell
    }
}
extension SearchMusicViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { [weak self] _ in
            self?.networkservice.fetchTracks(searchText: searchText, completion: { searchResult in
                self?.tracks = searchResult?.results ?? []
                self?.tableView.reloadData()
            })
        })
       
    }
}
