//
//  PayVideoViewController.swift
//  AllNews
//
//  Created by sreekanth reddy iragam reddy on 7/26/17.
//  Copyright © 2017 com.sree.objc. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class PlayVideoViewController: UIViewController {
    
    var videoUrl:String!

    override func viewDidLoad() {
        super.viewDidLoad()
        let fileURL = NSURL(string: videoUrl)!
        playVideo(url: URL(string:videoUrl)!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func playVideo(url: URL){
        let player = AVPlayer(url: url)
        let playerController = AVPlayerViewController()
        
        playerController.player = player
        self.addChildViewController(playerController)
        self.view.addSubview(playerController.view)
        playerController.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 300)
        
        player.play()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
