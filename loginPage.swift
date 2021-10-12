//
//  loginPgge.swift
//  AT
//
//  Created by Satya on 05/10/21.
//  Copyright © 2021 Brad. All rights reserved.
//

import UIKit

class loginPgge: UIViewController {

    @IBOutlet weak var emailId: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    @IBAction func button(_ sender: UIButton) {

        if UserDefaults.standard.string(forKey: "email") == emailId.text && UserDefaults.standard.string(forKey: "phone") == password.text {
            guard let Login =  self.storyboard?.instantiateViewController(withIdentifier: "secondViewController") as? secondViewController else { return  }
            self.navigationController?.pushViewController(Login, animated: true)
        }
        
            
        
    
        
        
        
        
    }
    
    @IBAction func registrationForm(_ sender: UIButton) {
    let vc = storyboard?.instantiateViewController(identifier: "first") as!  ViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
        
        
    //self.navigationController?.pushViewController(vc, animated: true)
    }
    


}
