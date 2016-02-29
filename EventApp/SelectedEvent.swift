//
//  SelectedEvent.swift
//  EventApp
//
//  Created by Matheus Campioli on 2/23/16.
//  Copyright © 2016 Matheus Campioli. All rights reserved.
//

import UIKit

class SelectedEvent: UIViewController {

    @IBOutlet weak var newImgView: UIImageView!
    
    @IBOutlet weak var newDescricaoShow: UITextView!
    @IBOutlet weak var newLabelShow: UILabel!
    @IBOutlet weak var RJButton: UIButton!
    @IBOutlet weak var SPButton: UIButton!
    @IBOutlet weak var RSButton: UIButton!
    
    var name : AnyObject? {
        get {
            return NSUserDefaults.standardUserDefaults().objectForKey("name")
        }
    }
    
    var cont = 0
    
    
    var destinoImagem: UIImage!
    var destinoText: String!
    var destinoDescricao: String!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cont = 0
        
        RJButton.setTitle("20/02", forState: UIControlState.Normal)
        RJButton.setTitle("23/02", forState: UIControlState.Normal)
        RJButton.setTitle("29/02", forState: UIControlState.Normal)
        
        newImgView.image = destinoImagem
        newLabelShow.text = destinoText
        newDescricaoShow.text = destinoDescricao
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Funções de cada botão - Nicolas
    
    
    
    @IBAction func RJSelectedEvent(sender: AnyObject) {
        
        self.cont = 1
        performSegueWithIdentifier("SelectedEventToCompraShow", sender: self)
    }
    
    
    @IBAction func SPSelectedEvent(sender: AnyObject) {
        self.cont = 2
        performSegueWithIdentifier("SelectedEventToCompraShow", sender: self)
    }
    
    
    @IBAction func RSSelectedEvent(sender: AnyObject) {
        self.cont = 3
        performSegueWithIdentifier("SelectedEventToCompraShow", sender: self)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if segue.identifier == "SelectedEventToCompraShow"
        {
            if let destinationVC = segue.destinationViewController as? CompraShow{
                
 
                
                if self.cont == 1{
                    destinationVC.diaShow = "20/02"
                    destinationVC.cidadeShow = "Rio de Janeiro"
                    destinationVC.show = self.destinoText
                }
                else if self.cont == 2{
                    
                    destinationVC.diaShow = "23/02"
                    destinationVC.cidadeShow = "São Paulo"
                    destinationVC.show = self.destinoText

                    
                }
                    
                else {
                    
                    destinationVC.diaShow = "29/02"
                    destinationVC.cidadeShow = "Rio Grande so Sul"
                    destinationVC.show = self.destinoText

                }
            }
            
            
            
        }
        
        
    }

}
