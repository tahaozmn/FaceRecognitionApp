//
//  ViewController.swift
//  FaceRecognitionApp
//
//  Created by Taha Özmen on 19.10.2023.
//

import UIKit
import LocalAuthentication


class ViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInClicked(_ sender: Any) {
        
        let authContext = LAContext()
        
        var error: NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Bu Sen Misin ?") { (success, error) in
                if success == true {
                    //başarılı giriş
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                } else {
                    DispatchQueue.main.async {
                        self.myLabel.text = "Bu Sen Değilsin!"
                    }
                    
                }
            }
            
        }
        
    }
    
}

