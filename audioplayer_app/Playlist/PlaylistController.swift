//
//  PlaylistController.swift
//  audioplayer_app
//
//  Created by Арина Яковлева on 09.08.2021.
//

import UIKit

class PlaylistController: UITableViewController {

    @IBOutlet var playlistTable: UITableView!
    
    var songs = [Song]()
    var selectedRow: Song? = nil
    var currentIndex: Int? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let songsProvider = SongProvider()
        
        songsProvider.songs().forEach { (song) in
            songs.append(song)
        }
                
        playlistTable.allowsSelection = true
        
        playlistTable.register(UINib(nibName: String(describing: SongCell.self), bundle: nil), forCellReuseIdentifier: "reuseCell")
        playlistTable.delegate = self
        playlistTable.dataSource = self
    }

    // MARK: - Table view data source

    @IBAction func unwindToMainController(segue: UIStoryboardSegue) {
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let songCell = playlistTable.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath) as! SongCell
//        songCell.songIndex = indexPath.row
        currentIndex = indexPath.row
        songCell.setSong(song: songs[indexPath.row])
        return songCell

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = songs[indexPath.row]
        performSegue(withIdentifier: "toPlayer", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PlayerController, let data = selectedRow{
            destination.songData = data
            destination.songIndex = currentIndex
        }
    }
    


}
