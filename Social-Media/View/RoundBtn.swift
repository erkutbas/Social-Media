//
//  RoundBtn.swift
//  Social-Media
//
//  Created by Erkut Baş on 05/11/2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit

class RoundBtn: UIButton {

    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        print("RoundBtn 1")
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        
        layer.shadowColor = UIColor.darkGray.cgColor
        
        layer.shadowOpacity = 30.0
        layer.shadowRadius = 10.0
        layer.shadowOffset = CGSize(width:  10.0, height: 10.0)
        
        imageView?.contentMode = .scaleAspectFit
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        print("RoundBtn 2")

        
        layer.cornerRadius = self.frame.width / 2
        
    }

}
