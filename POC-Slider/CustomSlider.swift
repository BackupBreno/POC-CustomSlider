//
//  CustomSlider.swift
//  POC-Slider
//
//  Created by Breno Aquino on 16/11/2017.
//  Copyright © 2017 Breno Aquino. All rights reserved.
//

import UIKit

class CustomSlider: UISlider {

    var label: UILabel!
    
    var imgView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.label = UILabel()
        
        self.imgView = UIImageView(image: #imageLiteral(resourceName: "icons8-marker-filled-100"))
        self.imgView.isHidden = true
        
        self.label.textAlignment = .center
        
        self.addSubview(imgView)
        
        self.addSubview(self.label)
        
        self.addTarget(self, action: #selector(CustomSlider.onValueChanged(sender:)), for: .valueChanged)
        
        self.addTarget(self, action: #selector(CustomSlider.endEditingSlider(sender:)), for: .touchUpInside)
    }
    
    func updateLabel() {
        
        self.imgView.isHidden = false
        
        self.thumbTintColor = .black
        
        self.label.textColor = .white
        
        self.label.text = String(Int(round(self.value)))
        
        let offSetTeorico = self.value / (self.maximumValue)
        
        let realOffSet = CGFloat(offSetTeorico) * (self.frame.width - 31)
        
        self.imgView.frame = CGRect(x: 6 - 10 + realOffSet, y: -30, width: 40, height: 40)
        
        self.label.frame = CGRect(x: 6 + realOffSet, y: -27, width: 20, height: 25)
    }
    
    @objc  func endEditingSlider(sender: CustomSlider) {
        
        self.imgView.isHidden = true
        
        self.thumbTintColor = .white
    }
    
    @objc func onValueChanged(sender: CustomSlider){
        
        updateLabel()
    }
}
