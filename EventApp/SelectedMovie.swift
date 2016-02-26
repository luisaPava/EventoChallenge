//
//  SelectedMovie.swift
//  EventApp
//
//  Created by Matheus Campioli on 2/23/16.
//  Copyright © 2016 Matheus Campioli. All rights reserved.
//

import UIKit

class SelectedMovie: UIViewController {
    
    var destinoImagemCinema : UIImage!
    var destinoTextCinema : String!
    var destinoDescricaoCinema : String!
    
    @IBOutlet weak var imageSelectedMovie: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var descriptionLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageSelectedMovie.image = destinoImagemCinema
        titleLabel.text = destinoTextCinema
        descriptionLabel.text = destinoDescricaoCinema
        
        
    }

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
    @IBAction func comprar(sender: AnyObject) {
        
        
        performSegueWithIdentifier("CinemaToDate", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if segue.identifier == "CinemaToDate"
        {
            if let destinationVC = segue.destinationViewController as? CompraCinema{
                
                             
                destinationVC.filme = self.destinoTextCinema

                
            }
            
            
            
        }
        
    }


}
