//
//  RegistrationView.swift
//  toDoFirebase
//
//  Created by Никита Ананьев on 19.02.2021.
//

import UIKit
import FirebaseAuth

protocol RegistrationViewResponseDelegate: class {
    func closeRegistrationView(email: String)
}

class RegistrationView: UIView {
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var emailTextLabel: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var secondPasswordTextfield: UITextField!
    
    @IBOutlet weak var signupButton: UIButton!
    
    
    var delegate: RegistrationViewResponseDelegate?

    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        signupButton.buttonPressedAnimation()
        guard passwordTextfield.text == secondPasswordTextfield.text else { return }
        
        guard let password = passwordTextfield.text else {return}
        guard let email = emailTextLabel.text else {return}
    
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                guard result != nil else {
                    UIView.animate(withDuration: 0.5) { [weak self] in
                        self?.statusLabel.shake()
                        self?.statusLabel.text = error?.localizedDescription
                        self?.statusLabel.alpha = 1
                    }
                    return
                }
                UIView.animate(withDuration: 1, animations: { [weak self] in
                    self?.statusLabel.alpha = 1
                    self?.statusLabel.text = "Registration was successful!"
                }, completion: { [weak self] _ in
                    self?.delegate?.closeRegistrationView(email: email)
                })
            }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadView()
        
    }
    
    func loadView() {
        
        let bundle = Bundle(for: RegistrationView.self)
        let nib = UINib(nibName: "RegistrationView", bundle: bundle)
        let view = nib.instantiate(withOwner: self).first as! UIView
        statusLabel.alpha = 0
        signupButton.dropShadow(shadowColor: UIColor.black.cgColor, offset: CGSize(width: 1, height: 1), opacity: 0.4, radius: 1)
        view.frame = bounds
        
        addSubview(view)
    }
    
  }
