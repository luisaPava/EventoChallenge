//
//  LoginScreen.swift
//  EventApp
//
//  Created by Matheus Campioli on 2/23/16.
//  Copyright © 2016 Matheus Campioli. All rights reserved.
//

import UIKit

class LoginScreen: UIViewController, UITextFieldDelegate {


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
   
    
    @IBOutlet weak var emailTextViewlogin: UITextField!
    
    @IBOutlet weak var senhaTextViewlogin: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func LoginToMain(sender: AnyObject) {
        
        
        if emailTextViewlogin.text == "" || senhaTextViewlogin.text == "" {
            
            
            let alertController = UIAlertController(title: "Atenção", message:
                "Você não preencheu todos os campos.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        } else {
            performSegueWithIdentifier("loginToMain", sender: nil)
        }
        
    }


}
