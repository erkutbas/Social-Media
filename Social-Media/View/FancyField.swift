//
//  FancyField.swift
//  Social-Media
//
//  Created by Erkut Baş on 05/11/2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit

class FancyField: UITextField {

    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        print("FancyField 1")
        
        layer.borderColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.0).cgColor
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 10.0
        
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5 )
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5 )

    }

}
