//
//  TraclListTableViewController.swift
//  TrackList
//
//  Created by mac on 24.02.2022.
//

import UIKit

class TraclListTableViewController: UITableViewController {

    var trackList = Track.getTrackList()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "TrackList"
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        tableView.rowHeight = 80
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        trackList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let track = trackList[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        
        
        content.text = track.song
        content.secondaryText = track.artist
        content.image = UIImage(named: track.title)
        
        content.imageProperties.cornerRadius = tableView.rowHeight / 2

        cell.contentConfiguration = content
        
        return cell
    }
    
    // MARK TableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        var currentTrack = trackList.remove(at: sourceIndexPath.row)
    
        trackList.insert(currentTrack, at: destinationIndexPath.row)
        
    }
    
    
        
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let detailVC = segue.destination as? DetailViewController else { return }
        
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let track = trackList[indexPath.row]
        
        detailVC.track = track
        
    }
    
    

    
}
