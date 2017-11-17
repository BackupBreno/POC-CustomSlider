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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.label = UILabel()
        
        self.label.textAlignment = .center
        
        self.addSubview(self.label)
        
        self.addTarget(self, action: #selector(CustomSlider.onValueChanged(sender:)), for: .valueChanged)
        
        self.addTarget(self, action: #selector(CustomSlider.endEditingSlider(sender:)), for: .touchUpInside)
    }
    
    func updateLabel() {
        
        self.thumbTintColor = .black
        
        self.label.text = String(Int(round(self.value)))
        
        let offSetTeorico = self.value / (self.maximumValue)
        
        let realOffSet = CGFloat(offSetTeorico) * (self.frame.width - 31)
        
        self.label.frame = CGRect(x: 6.5 + realOffSet, y: -25, width: 20, height: 25)
    }
    
    @objc  func endEditingSlider(sender: CustomSlider) {
        
        self.thumbTintColor = .white
    }
    
    @objc func onValueChanged(sender: CustomSlider){
        
        updateLabel()
    }
}
