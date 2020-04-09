//
//  ViewController.swift
//  iTunesAPI(A-Lin)
//
//  Created by 蕭聿莘 on 2020/4/9.
//  Copyright © 2020 Kazuku. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVPlayer?
    var playerItem: AVPlayerItem?
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var singerlabel: UILabel!
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
     var artistName: String?
     var trackName: String?
     var previewUrl: URL?
     var artworkUrl100: URL?
     
     func getImage(url: URL,completion: @escaping(UIImage?) -> ()) {
         let task = URLSession.shared.dataTask(with: url) { (data, url, error) in
             if let data = data,let image = UIImage(data: data){
                 completion(image)
             }else{
                 completion(nil)
             }
         }
         task.resume()
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getImage(url: artworkUrl100!) { (image) in
            DispatchQueue.main.async {
                self.albumImageView.image = image
            }
        }
        
        singerlabel.text = artistName!
        trackLabel.text = trackName!
        
        albumImageView.layer.shadowOpacity = 0.5
        albumImageView.layer.shadowRadius = 15
    }

    @IBAction func play(_ sender: UIButton) {
        let urlStr = "\(previewUrl)"
               if player?.rate == nil {
                   let url = URL(string: urlStr)
                   playerItem = AVPlayerItem(url: previewUrl!)
                   player = AVPlayer(playerItem: playerItem)
                   player!.play()
                   playButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
               }else if player?.rate == 0{
                   player!.play()
                   playButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
                    pauseButton.setBackgroundImage(UIImage(systemName: "pause"), for: .normal)
               }
               else{
                   player!.pause()
                   pauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
                   playButton.setBackgroundImage(UIImage(systemName: "play"), for: .normal)
               }
    }
    
    @IBAction func pause(_ sender: UIButton) {
        let urlStr1 = "\(previewUrl)"
               if player?.rate == 1 {
                   let url = URL(string: urlStr1)
                   playerItem = AVPlayerItem(url: previewUrl!)
                   player = AVPlayer(playerItem: playerItem)
                   player?.pause()
                   pauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
                   playButton.setBackgroundImage(UIImage(systemName: "play"), for: .normal)
               }else{
                   player?.play()
                   pauseButton.setBackgroundImage(UIImage(systemName: "pause"), for: .normal)
                   playButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
               }
    }
    
}

