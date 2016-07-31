//
//  ViewController.swift
//  toDoAppsFirebase
//
//  Created by Mohammad Kukuh on 7/30/16.
//  Copyright © 2016 Mohammad Kukuh. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    
    override func viewDidLayoutSubviews() {
        bottomBorder(mailTextField)
        bottomBorder(passTextField)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
    }
    


    @IBAction func loginButtonAction(sender: AnyObject) {
        
        let email = mailTextField.text!
        let pass = passTextField.text!
        
        FIRAuth.auth()?.signInWithEmail(email, password: pass, completion: { (user:FIRUser?, error: NSError?) in
            if error != nil{
                if let errorCode : FIRAuthErrorCode = FIRAuthErrorCode(rawValue: error!.code){
                        let alert : UIAlertView = UIAlertView(title: "tetot!", message: "masukkan email: qw@qw.com \n password : qwqwqw", delegate: nil, cancelButtonTitle: "OK")
                        alert.show()
                    
                }
            }else{
                let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let m : UINavigationController = storyboard.instantiateViewControllerWithIdentifier("ToDoView")as! UINavigationController
                self.presentViewController(m, animated: true, completion: nil)
            }
        })
    }
    
    
    func bottomBorder(textField : UITextField) -> UITextField {
        let border = CALayer()
        let width = CGFloat(2.0)
        
        border.borderColor = UIColor.whiteColor().CGColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height)
        
        border.borderWidth = width
        textField.borderStyle = UITextBorderStyle.None
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
        
        return textField

    }
    

}

