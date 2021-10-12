//
//  ViewController.swift
//  AT
//
//  Created by Brad on 28/09/21.
//  Copyright © 2021 Brad. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var str:String = ""
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var dobRegister: UIDatePicker!
    @IBOutlet weak var maleRadio: UIButton!
    @IBOutlet weak var femaleRadio: UIButton!
    @IBOutlet weak var otherRadio: UIButton!
    @IBOutlet weak var aboutYourSef: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var working: UISegmentedControl!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var emailId: UITextField!
    @IBOutlet weak var uiNation: UISegmentedControl!
    
    var variable : String = ""
    var genderVariable : String = ""
    var hobby : String = ""
    var hobbys:[String] = []
    var youWork:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
    @IBAction func addImageButton(_ sender: UIButton) {
        
        let image = UIAlertController(title: "select image", message: "select image from",preferredStyle: .actionSheet)
        
        let cameraButton = UIAlertAction(title: "camera", style: .default){[weak self]
            (_) in self?.showImagePIcker(selectedSource: .camera)
        }
        let imageButton = UIAlertAction(title: "gallery", style: .default) {[weak self]
            (_) in self?.showImagePIcker(selectedSource: .photoLibrary)
        }
        
        
        let cancleButton = UIAlertAction(title: "cancle", style: .cancel , handler: nil)
    
        image.addAction(cameraButton)
        image.addAction(imageButton)
        image.addAction(cancleButton)
        self.present(image, animated: true, completion: nil)
    }
    func showImagePIcker(selectedSource:UIImagePickerController.SourceType)    {
        guard UIImagePickerController.isSourceTypeAvailable(selectedSource) else{
            print("selected source not avaliable")
            return
        }
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = selectedSource
        imagePickerController.allowsEditing = false
        self.present(imagePickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage{
            imageView.image = selectedImage
        }else{
            print("image not found")
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func userName()->Bool
    {
         let fir:String = firstName.text!
        let firstvalid:String = "[a-zA-Z]{4,15}"
        let USERTest = NSPredicate(format: "SELF MATCHES %@", firstvalid)
        guard
            USERTest.evaluate(with: fir)
        else
        {
            print("not valid")
            return false
        }

        print(fir)
        self.firstName.text=""
        return true
    }
    func lastUserName()->Bool
    {
         let fir:String = lastName.text!
        let firstvalid:String = "[a-zA-Z]{4,15}"
        let USERTest = NSPredicate(format: "SELF MATCHES %@", firstvalid)
        guard
            USERTest.evaluate(with: fir)
        else
        {
            print("not valid")
            return false
        }
        
        print(fir)
        self.lastName.text=""
        return true
    }
    func phoneNo()->Bool
    {
         let fir:String = phoneNumber.text!
        let firstvalid:String = "[0-9]{10}"
        let USERTest = NSPredicate(format: "SELF MATCHES %@", firstvalid)
        guard
            USERTest.evaluate(with: fir)
        else
        {
            print("not valid")
            return false
        }
        
        
        print(fir)
        self.phoneNumber.text=""
        return true
    }
    func email()->Bool
      {
           let fir:String = emailId.text!
          let firstvalid:String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
          let USERTest = NSPredicate(format: "SELF MATCHES %@", firstvalid)
          guard
              USERTest.evaluate(with: fir)
          else
          {
              print("not valid")
              return false
          }
          
          print(fir)
          self.emailId.text=""
          return true
      }
    
    @IBAction func datePicker(_ sender: UIDatePicker) {
        
    }
    

    @IBAction func nation(_ sender: UISegmentedControl)
    {
        switch
        uiNation.selectedSegmentIndex
        {
        case 0:
         //   print("indian")
        variable="Indian"
          print(variable)
            
        case 1:
            //print("others")
            variable="other"
            print(variable)
            
        default:
            break
            
           
        }
    }
    
    @IBAction func genderbutton(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            //print("male")
            genderVariable = "male"
        case 1:
            //print("female")
            genderVariable = "female"

        default:
            //print("other")
            genderVariable = "others"


        }
        
        
        
    maleRadio.setImage( UIImage(systemName: "circle"),for: UIControl.State.normal)
    femaleRadio.setImage( UIImage(systemName: "circle"),for: UIControl.State.normal)
    otherRadio.setImage( UIImage(systemName: "circle"),for: UIControl.State.normal)
    sender.setImage( UIImage(systemName: "circle.fill"),for: UIControl.State.normal)
              
    }
    
    
    @IBAction func hobby(_ sender: UIButton) {
     //var abhi = String(sender.isSelected)
    // print(abhi)

    sender.isSelected = !sender.isSelected
    if sender.isSelected
    {
    sender.setImage( UIImage(systemName: "circle.fill"),for: UIControl.State.normal)
    }else{
        
    sender.setImage( UIImage(systemName: "circle"),for: UIControl.State.normal)
        
    }
        
        
        if hobbys.contains(sender.titleLabel?.text ?? "") {
            hobbys=hobbys.filter{ $0 != sender.titleLabel?.text }
        } else {
        hobbys.append(sender.titleLabel?.text ?? "")
        }
        print(hobbys)
}
    
    @IBAction func workingButton(_ sender: UISegmentedControl) {
        
        
        switch
            working.selectedSegmentIndex
        {
            
            case 0:
                print("yes")
                youWork = "yes"
                
            
            case 1:
                print("no")
                youWork = "no"
                
            default:
                print("just join")
                youWork = "just join"
            
        }
        
    }
    @IBAction func button(_ sender: Any) {
        
        
//        guard let Register =  self.storyboard?.instantiateViewController(withIdentifier: "Second") as? secondViewController
//
//        else { return  }
//        print(uination.selectedSegmentIndex)
//        Register.strname = firstname.text
//        Register.strname1 = lastname.text
//        Register.Emailname = emailid.text
//        Register.Phonename = phonenumber.text
//        Register.aboutyou = aboutYourSef.text
//        Register.Nationalityname = uination.selectedSegmentIndex == 0 ? "indian" : "other"
//        Register.Gendername = genderVariable
//        Register.Hobbiesname = hobbys
//
//        Register.Workingname = youWork
//        //Register.dobDate = dobRegister
//        self.navigationController?.pushViewController(Register, animated: true)
//
//        if username(){
//            guard let Login =  self.storyboard?.instantiateViewController(withIdentifier: "loginPage") as? loginPgge
//            else { return  }
//            self.navigationController?.pushViewController(Login, animated: true)
//
//        }

        let HobbiesConverter:String = hobbys.joined(separator: " , ")
        
        var dict = [
            "firstName" : firstName.text,
            "lastName" : lastName.text,
            "emailId" : emailId.text,
            "phoneNumber" : phoneNumber.text,
            "aboutYourSelf" : aboutYourSef.text] as? [String:String]
        dict?["gender"] = genderVariable
        dict?["areYouWorking"] = youWork
        dict?["hobby"] = HobbiesConverter
        dict?["nationality"] = uiNation.selectedSegmentIndex == 0 ? "indian" : "other"
        
        UserDefaults.standard.set(emailId.text, forKey: "email") //setObject
        UserDefaults.standard.set(phoneNumber.text, forKey: "phone") //setObject
        UserDefaults.standard.set(dict, forKey: "data")
        
        let dicts = UserDefaults.standard.value(forKey: "data") as? [String:Any]
        
        print(dicts?["firstName"])
   
        self.navigationController?.popViewController(animated: true)
        
      
        userName()
        lastUserName()
        phoneNo()
        email()
        print(variable)
        print(genderVariable)
        print(hobbys)
        
    }
    
    @IBAction func submit(_ sender: UIButton) {
    }
    
}

