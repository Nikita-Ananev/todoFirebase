//
//  extensions.swift
//  toDoFirebase
//
//  Created by Никита Ананьев on 16.02.2021.
//

import UIKit

extension UIView {
    
    
    func dropShadow(shadowColor: CGColor, offset: CGSize, opacity: Float, radius: CGFloat) {
        self.layer.shadowColor = shadowColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.clipsToBounds = false
        self.layer.masksToBounds = false

    }
    
    
    func shake() {
            let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
            animation.duration = 0.6
            animation.values = [-10.0, 10.0, -10.0, 10.0, -5.0, 5.0, -2.0, 2.0, 0.0 ]
            layer.add(animation, forKey: "shake")
        }
    
}

extension UIButton {
    func buttonPressedAnimation() {
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        } completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.transform = CGAffineTransform.identity
            }
            
        }
    }
}
