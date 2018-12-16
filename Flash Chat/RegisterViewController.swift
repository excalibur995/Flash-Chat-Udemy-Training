//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase
import SVProgressHUD


class RegisterViewController: UIViewController {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
  
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    

   

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        
        //TODO: Set up a new user on our Firbase database
        if emailTextfield.text?.isEmpty ?? true {
            showFailedAlert(msg: "Username Cannot Be Empty")
        } else if passwordTextfield.text?.isEmpty ?? true {
            showFailedAlert(msg: "Password Cannot be empty")
        } else {
            SVProgressHUD.show()
            Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (AuthDataResult, Error) in
                if Error != nil {
                    self.showFailedAlert(msg: Error!.localizedDescription)
                } else {
                    print("Successs!")
                    SVProgressHUD.dismiss()
                    self.performSegue(withIdentifier: "goToChat", sender: self)
                }
            }
        }
        
        
        

        
        
    }
    
    
    func showFailedAlert(msg:String){
        let alert = UIAlertController(title: "Failed", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    
}
