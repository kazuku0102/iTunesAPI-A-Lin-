//
//  LinTableViewController.swift
//  iTunesAPI(A-Lin)
//
//  Created by 蕭聿莘 on 2020/4/9.
//  Copyright © 2020 Kazuku. All rights reserved.
//

import UIKit

class LinTableViewController: UITableViewController {
    
    var songs = [Song]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let urlStr = "https://itunes.apple.com/search?term=A-Lin&media=music"
               if let url = URL(string: urlStr) {
                   URLSession.shared.dataTask(with: url) { (data, url, error) in
                       let decoder = JSONDecoder()
                       if let data = data,let songResults = try?
                           decoder.decode(SongResults.self, from: data){
                           self.songs = songResults.results
                           DispatchQueue.main.async {
                               self.tableView.reloadData()
                           }
                       }
                   }.resume()
               }
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LinCell", for: indexPath) as! LinTableViewCell

        let song = songs[indexPath.row]
               cell.nameLabel.text = song.trackName
               cell.singerLabel.text = song.artistName
               cell.photoImageView.image = UIImage(systemName: "photo")
               URLSession.shared.dataTask(with: song.artworkUrl100) { (data, url, error) in
                   if let data = data{
                       DispatchQueue.main.async {
                           cell.photoImageView.image = UIImage(data: data)
                       }
                   }
               }.resume()
               return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ViewController
        let indexpath = tableView.indexPathForSelectedRow
        controller.artistName = songs[(indexpath?.row)!].artistName
        controller.trackName = songs[(indexpath?.row)!].trackName
        controller.artworkUrl100 = songs[(indexpath?.row)!].artworkUrl100
        controller.previewUrl = songs[(indexpath?.row)!].previewUrl
    }
    

}
