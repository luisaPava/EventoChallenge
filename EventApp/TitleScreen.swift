//
//  TitleScreen.swift
//  EventApp
//
//  Created by Matheus Campioli on 2/23/16.
//  Copyright © 2016 Matheus Campioli. All rights reserved.
//

import UIKit

class TitleScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        
    }
    
    @IBOutlet weak var BackgroundTitle: UIImageView!
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

  
    
    
    @IBAction func registerTitleScreen(sender: AnyObject) {
         performSegueWithIdentifier("TitleToRegister", sender: nil)
        
    }

    
    
    @IBAction func loginTitleScreen(sender: AnyObject) {
        
          performSegueWithIdentifier("TitleToLogin", sender: nil)
    }
    
    
   
    
}
