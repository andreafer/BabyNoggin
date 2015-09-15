//
//  FirstViewController.swift
//  ScreenTest
//
//  Created by Andrea Ferrari on 9/15/15.
//  Copyright (c) 2015 Andrea Ferrari. All rights reserved.
//

import UIKit

class FirstViewController: BaseViewController, TestOverViewControllerDelegate {
    
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var vwContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.showTestOverviewControllerWithAnimated(false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showTestOverviewControllerWithAnimated( animated: Bool ) {
        var duration = 0.0
        
        if( animated ) {
            duration = 0.2
        }
        
        let vcTestOverview = storyboard!.instantiateViewControllerWithIdentifier("TestOverview") as! TestOverviewViewController
        self.addChildViewController(vcTestOverview)
        
        vcTestOverview.view.frame = self.vwContainer.bounds
        vcTestOverview.delegate = self;
        vcTestOverview.view.alpha = 0;
        self.vwContainer.addSubview(vcTestOverview.view)
        
        UIView.animateWithDuration(duration, animations: { () -> Void in
            vcTestOverview.view.alpha = 1;
        })
    }
    
    func showTimeToTestViewControllerWitHAnimated( animated: Bool ) {
        var duration = 0.0
        
        if( animated ) {
            duration = 0.2
        }
        
        let vcTimeToTest = storyboard!.instantiateViewControllerWithIdentifier("TimeToTest") as! TimeToTestViewController
        self.addChildViewController(vcTimeToTest)
        
        vcTimeToTest.view.frame = self.vwContainer.bounds
        vcTimeToTest.view.alpha = 0;
        self.vwContainer.addSubview(vcTimeToTest.view)
        
        UIView.animateWithDuration(duration, animations: { () -> Void in
            vcTimeToTest.view.alpha = 1;
        })
    }
    
    //TestOverViewController Delegate
    func onNextStepButtonClicked(controller: TestOverviewViewController) {
        controller.view.removeFromSuperview()
        controller.removeFromParentViewController()
        self.showTimeToTestViewControllerWitHAnimated(true);
    }
}

