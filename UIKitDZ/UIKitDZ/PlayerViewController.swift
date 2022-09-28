//
//  PlayerViewController.swift
//  UIKitDZ
//
//  Created by Дмитрий Супрун on 25.09.22.
//

import AVFoundation
import UIKit
/// Main player with control elements
final class PlayerViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var trackSlider: UISlider!
    @IBOutlet weak var timeFromBeginLabel: UILabel!
    @IBOutlet weak var timeToEndLabel: UILabel!
    
    // MARK: - PublicProperties
    var startWithTrack: (song: String, albumImage: String)?
    var currentTrack = 0
    
    // MARK: - PrivateProperties
    let activity = UIActivity()
    private var player = AVAudioPlayer()
    private let media = [(song: "Peremen", albumImage: "LastHero"), (song: "WindOfChange", albumImage: "CrazyWord")]
    
    // MARK: - ViewControllers
    override func viewDidLoad() {
        super.viewDidLoad()
        startPlayer()
    }
    // MARK: - PublicMethod
    
    // MARK: - IBAction
    
    @IBAction func playButtonAction(_ sender: Any) {
        switch player.isPlaying {
        case true: player.pause()
            playButton.imageView?.image = UIImage(systemName: "play.fill")
        case false: player.play()
            playButton.imageView?.image = UIImage(systemName: "pause.fill")
        }
    }
    @IBAction func backActon(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func forwardButtonAction(_ sender: Any) {
        if currentTrack < media.count - 1 {
            currentTrack += 1
            playTrack(track: media[currentTrack].song, image: media[currentTrack].albumImage)
        }
    }
    
    @IBAction func trackSliderAction(_ sender: Any) {
        player.currentTime = TimeInterval(trackSlider.value)
    }
    
    @IBAction func activityAction(_ sender: Any) {
        let items = ["This app is my favorite"]
        let activityController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(activityController, animated: true)
    }
    
    // MARK: - PrivateMethod
    
    private func startPlayer() {
        if let startWithTrack {
            playTrack(track: startWithTrack.song, image: startWithTrack.albumImage)
        }
        _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
            self.trackSlider.value = Float(self.player.currentTime)
            self.timeFromBeginLabel.text = self.player.currentTime.formatted()
            self.timeToEndLabel.text = (self.player.duration - self.player.currentTime).formatted()
        })
    }
    
    private func updateTrackUI() {
        trackSlider.value = Float(player.currentTime)
    }
    
    private func playTrack(track: String, image: String) {
        do {
            if let audioPath = Bundle.main.path(forResource: track, ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                trackSlider.maximumValue = Float(player.duration)
            }
        } catch {
            print("Error in \(#function)")
        }
        trackImageView.image = UIImage(named: image)
    }
}
