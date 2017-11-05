//
//  FancyFooter.swift
//  Social-Media
//
//  Created by Erkut Baş on 05/11/2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit

class FancyFooter: UIView {

    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        print("FancyFooter starts")
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.0).cgColor
        
        layer.shadowColor = UIColor.black.cgColor
        
        layer.shadowOpacity = 50.0
        layer.shadowRadius = 20.0
        layer.shadowOffset = CGSize(width:  10.0, height: 10.0)
        
    }

}
