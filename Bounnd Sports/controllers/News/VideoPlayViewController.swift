//
//  VideoPlayViewController.swift
//  Bounnd Sports
//
//  Created by Qoo on 01/05/2023.
//

import UIKit
import AVKit

class VideoPlayViewController: UIViewController {

    @IBOutlet var lblTime: UILabel!
    @IBOutlet var txtDetails: UITextView!
    @IBOutlet var videoView: UIView!
    
   static var selectedVideo:VideoList?
    var smallVideoPlayerViewController = AVPlayerViewController()
    var player:AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialSettings()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        player?.pause()
        player = nil
        smallVideoPlayerViewController.removeFromParent()
    }
    
    
    func initialSettings(){


        setBackButton()
        
        configureVideoPlayer()
       displaySelectedVideo()
        
        
        
    }
    
    func configureVideoPlayer(){
       //  smallVideoPlayerViewController.showsPlaybackControls = false
        smallVideoPlayerViewController.delegate = self
        player = AVPlayer()
        smallVideoPlayerViewController.player = player
        videoView.addSubview(smallVideoPlayerViewController.view)
       smallVideoPlayerViewController.view.frame = videoView.bounds
        smallVideoPlayerViewController.updatesNowPlayingInfoCenter = false
        //smallVideoPlayerViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    }
    
    func displaySelectedVideo(){
        //player.replaceCurrentItem(with: AVPlayerItem(url: streamingURL))
        txtDetails.text = VideoPlayViewController.selectedVideo?.title
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Utility.dateFormat.ddMMyyyyWithTimeZone.rawValue
        lblTime.text = Utility.formatDate(date: dateFormatter.date(from: VideoPlayViewController.selectedVideo?.createTime ?? ""), with: .ddMMyyyyWithTimePretty)
       
        guard let videoUrl = URL(string: VideoPlayViewController.selectedVideo?.path ?? "") else{return}
        player?.replaceCurrentItem(with: AVPlayerItem(url: videoUrl))
        player?.play()
       
    }

}


extension VideoPlayViewController:AVPlayerViewControllerDelegate{
    func playerViewController(_ playerViewController: AVPlayerViewController, willEndFullScreenPresentationWithAnimationCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        player?.pause()
        player = nil
        guard let videoUrl = URL(string: VideoPlayViewController.selectedVideo?.path ?? "") else{return}
        player = AVPlayer(playerItem: AVPlayerItem(url: videoUrl))
        smallVideoPlayerViewController.player = player
       print("tiggered")
        
    }
}
