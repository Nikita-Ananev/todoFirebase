//
//  LoginViewController.swift
//  toDoFirebase
//
//  Created by Никита Ананьев on 15.02.2021.
//

import UIKit

class LoginViewController: UIViewController, RegistrationViewResponseDelegate {

    var blurEffectView = UIVisualEffectView()
    var auth = Authorization.shared
    var loginView: LoginView! {
        guard isViewLoaded else { return nil }
        return (view as! LoginView)
        
    }
    @IBOutlet weak var registrationView: RegistrationView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registrationView.delegate = self
        configureTapGesture()
                
    }
    override func viewWillAppear(_ animated: Bool) {
        loginView.setupView()
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        sender.buttonPressedAnimation()
        auth.resetProperty()
        loginView.logInTextField.text = ""
        loginView.logInTextField.placeholder = "Enter email"
        loginView.loginDescriptionLabel.text = "Enter your email"
        loginView.logInTextField.shake()
    }
    
    
    @IBAction func logInButtonPressed(_ sender: UIButton) {
        sender.buttonPressedAnimation()
        guard let text = loginView.logInTextField.text else { return }
        
        switch auth.status {
        
        case .needEmail:
            auth.email = text
            loginView.logInTextField.text = ""
            loginView.logInTextField.placeholder = "Enter password"
            loginView.loginDescriptionLabel.text = "Enter your password"
            
        case .needPassword:
            auth.password = text
            auth.signIn { (response, isSigninSuccess) in
                
                guard isSigninSuccess else {
                    DispatchQueue.main.async {
                        self.loginView.statusLabel.text = response
                        self.auth.resetProperty()
                        self.loginView.logInTextField.placeholder = "Enter email"
                        self.loginView.loginDescriptionLabel.text = "Enter your email"
                        
                    }
                    return
                }
                self.performSegue(withIdentifier: "loginAcceptedSegue", sender: self)
            }
            

        }
    }
    
    
    @IBAction func registerButton(_ sender: UIButton) {
        sender.buttonPressedAnimation()
        
        
      
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        blurEffectView.alpha = 0
        
    
        view.addSubview(registrationView)
        registrationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            registrationView.widthAnchor.constraint(equalToConstant: 300),
            registrationView.heightAnchor.constraint(equalToConstant: 500),
            registrationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registrationView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        registrationView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        registrationView.alpha = 0
        
        UIView.animate(withDuration: 1) { [weak self] in
            guard let self = self else { return }
            self.blurEffectView.alpha = 1
            self.registrationView.alpha = 1
            self.registrationView.transform = CGAffineTransform.identity
            self.registrationView.layer.cornerRadius = 10
            self.registrationView.layer.masksToBounds = true
            self.registrationView.clipsToBounds = true
        }
        
    }
    
    @objc private func hideContactPreview() {
        
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
        guard let self = self else { return }
        self.registrationView.transform =
          CGAffineTransform(scaleX: 1.1, y: 1.1)
        self.registrationView.alpha = 0
        self.blurEffectView.alpha = 0
    }) { (success) in
        self.registrationView.removeFromSuperview()
        self.blurEffectView.removeFromSuperview()
      }
    }
    
    
    private func configureTapGesture() {
      let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideContactPreview))
        loginView.addGestureRecognizer(tapGesture)

    }
    
    func closeRegistrationView(email: String) {
        loginView.appLabel.text = email
    }
    
    @objc private func doNothing() {
        print("lol")
    }
    

  }
    
    
