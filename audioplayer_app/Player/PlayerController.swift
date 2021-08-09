//
//  PlayerController.swift
//  audioplayer_app
//
//  Created by Арина Яковлева on 09.08.2021.
//

import UIKit
import AVFoundation

class PlayerController: UIViewController {
    //MARK: -> Outlets
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var albumPhoto: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var songTimeSlider: UISlider!
    @IBOutlet weak var songVolumeSlider: UISlider!
    @IBOutlet weak var leftTimeLabel: UILabel!
    
    var songData: Song? = nil
    
    var audioPlayer = AVAudioPlayer()
    var timer: Timer? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songTimeSlider.addTarget(self, action: #selector(changeSongTime), for: .valueChanged)
        
        if let data = songData{
            songName.text = data.author
            albumPhoto.image = data.albumPhoto
            name.text = data.name
            author.text = data.author
            durationLabel.text = data.duration
            do {
                if let audioPath = Bundle.main.path(forResource: data.fileName, ofType: "mp3"){
                    
                try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                    
                    songTimeSlider.maximumValue = Float(audioPlayer.duration)
               }
                
            } catch {
                print("ERROR")
            }
        }
        self.audioPlayer.play()
        playButton.setImage(UIImage(named: "pause.png"), for: .normal)
        
        configureTimer()
   
    }
    

    
    @IBAction func backToPlayList(_ sender: Any) {
        performSegue(withIdentifier: "toPlaylist", sender: nil)
        self.audioPlayer.pause()
    }
    
    @IBAction func changeSongVolume(_ sender: Any) {
        self.audioPlayer.volume = self.songVolumeSlider.value
    }
    
    
    @IBAction func onHandlePlayButton(_ sender: Any) {
        if !self.audioPlayer.isPlaying{
            playButton.setImage(UIImage(named: "pause.png"), for: .normal)
            self.audioPlayer.play()
        }else{
            playButton.setImage(UIImage(named: "play_button.png"), for: .normal)
            self.audioPlayer.pause()
        }
    }
    
    @objc func changeSongTime(sender: UISlider){
        if sender == songTimeSlider{
            self.audioPlayer.currentTime = TimeInterval(sender.value)
        }
    }
    
    func configureTimer(){
        if timer == nil{
            timer = Timer.scheduledTimer(withTimeInterval: 1/5 , repeats: true, block: { [self] time in
                
                self.songTimeSlider.value = Float(self.audioPlayer.currentTime)
                var minutes = Int(audioPlayer.currentTime / 60)
                let seconds = audioPlayer.currentTime - Double(minutes * 60)
                var secodsString = seconds < 9.5 ? "0\(String(format: "%.0f", seconds))" : "\(String(format: "%.0f", seconds))"
                if secodsString == "60" {
                    secodsString = "00"
                    minutes += 1
                }
                leftTimeLabel.text = "\(minutes):\(secodsString)"
            })
        }
    }
}
