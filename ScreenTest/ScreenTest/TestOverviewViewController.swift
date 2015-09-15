//
//  TestOverviewViewController.swift
//  ScreenTest
//
//  Created by Andrea Ferrari on 9/15/15.
//  Copyright (c) 2015 Andrea Ferrari. All rights reserved.
//

import UIKit
import MediaPlayer

protocol TestOverViewControllerDelegate {
    func onNextStepButtonClicked(controller:TestOverviewViewController)
}

class TestOverviewViewController: UIViewController {
    
    var delegate:TestOverViewControllerDelegate! = nil
    
    @IBOutlet weak var vwVideo: UIView!
    @IBOutlet weak var btnNextStep: UIButton!
    
    var moviePlayer : MPMoviePlayerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.playVideo()
        BNUIManager.applyDefaultButtonStyle(self.btnNextStep)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onNextStepButtonClicked(sender: UIButton) {
        if( self.delegate != nil ) {
            self.delegate.onNextStepButtonClicked(self)
        }
    }
    
    func playVideo() {
        let url = NSURL(string: "http://jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v")
        moviePlayer = MPMoviePlayerController(contentURL: url)
        
        if let player = moviePlayer {
            player.view.backgroundColor = UIColor.whiteColor()
            self.vwVideo.layoutIfNeeded()
            player.view.frame = self.vwVideo.bounds
            player.controlStyle = MPMovieControlStyle.Fullscreen;
            player.prepareToPlay()
            player.scalingMode = .AspectFit
            self.vwVideo.addSubview(player.view)
        } else {
            debugPrintln("Something wrong when playing video")
        }
        
        
    }
    
}
