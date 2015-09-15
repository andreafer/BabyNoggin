//
//  BNUIManager.swift
//  ScreenTest
//
//  Created by Andrea Ferrari on 9/15/15.
//  Copyright (c) 2015 Andrea Ferrari. All rights reserved.
//

import UIKit

class BNUIManager {
    
    internal static func applyDefaultButtonStyle( button : UIButton ) {
        button.layer.cornerRadius = 3.0
        button.backgroundColor = UIColor.cyanColor()
        button.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
    }
    
}
