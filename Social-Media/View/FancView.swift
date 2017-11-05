//
//  FancView.swift
//  Social-Media
//
//  Created by Erkut Baş on 05/11/2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit

class FancView: UIView {

    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        print("FancView 1")
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.0).cgColor
        
        layer.shadowColor = UIColor.black.cgColor
        
        layer.shadowOpacity = 50.0
        layer.shadowRadius = 50.0
        layer.shadowOffset = CGSize(width:  10.0, height: 10.0)
        
        print("FancView 2")
    }

}
