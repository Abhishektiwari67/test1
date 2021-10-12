//
//  secondViewController.swift
//  AT
//
//  Created by Satya on 05/10/21.
//  Copyright © 2021 Brad. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
    
    
    
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var secondName: UILabel!
    
    @IBOutlet weak var dob: UILabel!
    @IBOutlet weak var hobby: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var about: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var emali: UILabel!
    @IBOutlet weak var nationalSelection: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var aboutWorking: UILabel!
    var strname:String?
    var strname1:String?
    var Emailname:String?
    var Phonename:String?
    var PasswordID:String?
    var dobDate:String?
    var aboutyou:String?
    var Gendername:String?
     var  Hobbiesname:[String]?=[]
    var Nationalityname:String?
    var Workingname:String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let dict = UserDefaults.standard.value(forKey: "data") as? [String:String]
        
        firstName.text = dict?["firstName"]
        secondName.text = dict?["lastName"]
        emali.text = dict?["emailId"]
        phoneNumber.text = dict?["phoneNumber"]
        hobby.text = dict?["hobby"]
        gender.text = dict?["gender"]
        about.text = dict?["aboutYourSelf"]
        nationalSelection.text = dict?["nationality"]
        dob.text = dict?["dateOfBirth"]
//        secondName.text = strname1 ?? ""
//        emali.text = Emailname ?? ""
//        phoneNumber.text = Phonename ?? ""
//        gender.text = Gendername ?? ""
//        about.text = aboutyou ?? ""
//        nationalSelection.text = Nationalityname ?? ""
//        hobby?.text = HobbiesConverter
//        //print(HobbiesSelected?.text ?? "")
//        aboutWorking.text = Workingname ?? ""
//        //dob.text = dobDate ?? ""

        // Do any additional setup after loading the view.
    }
    

    @IBAction func buttonAction(_ sender: UIButton) {
    }
  

}
