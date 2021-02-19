//
//  LoginView.swift
//  
//
//  Created by Никита Ананьев on 15.02.2021.
//

import UIKit
import PopupDialog

class LoginView: UIView {
    
    
    @IBOutlet weak var taskManagerBackground: UIView!
    @IBOutlet weak var loginFieldsBackground: UIView!
    @IBOutlet weak var appLabel: UILabel!
    @IBOutlet weak var statusLabel:UILabel!
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginDescriptionLabel: UILabel!
    
    @IBOutlet weak var widthContraint: NSLayoutConstraint!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var logInTextField: UITextField!
    
    
    
    
    func setupView() {
        // подготовка для анимации
        loginFieldsBackground.alpha = 0
        signupButton.alpha = 0
        appLabel.alpha = 0
        appLabel.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        statusLabel.alpha = 0
        heightConstraint.constant = self.frame.height * 0.25

        //анимирует logo
        UIView.animate(withDuration: 1) { [weak self] in
            self?.appLabel.alpha = 1
            self?.appLabel.transform = CGAffineTransform.identity
        }
        
        
        dropShadows()
        setCornerRadius()
        lowerCurtain()
    }
    
    
    // MARK: Спускает и анимирует шторку и поле логина
    // MARK: TO-DO шторка не спускается, а рисуется в две стороны -пофиксить
    func lowerCurtain() {
        
        loginFieldsBackground.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        signupButton.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        
        
        UIView.animate(withDuration: 1, delay: 1, options: .curveEaseInOut , animations: { [self] in
            self.taskManagerBackground.layoutIfNeeded()
            
        }, completion: { [self]_ in
            UIView.animate(withDuration: 0.5, animations: { [self] in
                loginFieldsBackground.alpha = 1
                loginFieldsBackground.transform = CGAffineTransform.identity
                
            })
            UIView.animate(withDuration: 0.5 , delay: 0.6, animations: { [self] in
                signupButton.alpha = 1
                signupButton.transform = CGAffineTransform.identity

            })
        })
        layoutIfNeeded()
    }
    
    
    func dropShadows() {
        loginButton.dropShadow(shadowColor: UIColor.black.cgColor, offset: CGSize(width: 1, height: 1), opacity: 0.4, radius: 1)
        resetButton.dropShadow(shadowColor: UIColor.black.cgColor, offset: CGSize(width: 1, height: 1), opacity: 0.4, radius: 1)
        signupButton.dropShadow(shadowColor: UIColor.black.cgColor, offset: CGSize(width: 1, height: 1), opacity: 0.4, radius: 1)
        loginFieldsBackground.dropShadow(shadowColor: UIColor.black.cgColor, offset: CGSize(width: 1, height: 1), opacity: 0.4, radius: 3)
    }
    func setCornerRadius() {
        loginButton.layer.cornerRadius = 5
        resetButton.layer.cornerRadius = 5
        signupButton.layer.cornerRadius = 5
        loginFieldsBackground.layer.cornerRadius = 5
    }
    
    
    
    
}
