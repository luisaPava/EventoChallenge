//
//  PagamentoCinema.swift
//  EventApp
//
//  Created by Luisa Paiva on 2/25/16.
//  Copyright © 2016 Matheus Campioli. All rights reserved.
//

import UIKit

class PagamentoCinema: UIViewController {

    @IBOutlet weak var nomeCinema: UITextField!
    @IBOutlet weak var numeroCartaoCinema: UITextField!

    @IBOutlet weak var codigoCinema: UITextField!
    
    @IBOutlet weak var validadeCinema: UITextField!
    var diaCinema: Int!
    var horaCinema: Int!
    
    var cinema: String!
    var date:String! // Property you want to pass to
    var hora: String!
    var qtdMeias: Int!
    var qtdInteiras: Int!
    var valorTot: Int!
    


    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    @IBAction func confirmaCompraCinema(sender: AnyObject) {
        
        
        if numeroCartaoCinema.text!.isEmpty || nomeCinema.text!.isEmpty || codigoCinema.text!.isEmpty || validadeCinema.text!.isEmpty {
            
            
            let alertController = UIAlertController(title: "Atenção", message:
                "Você não preencheu todos os campos.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
                
            else{
                
                
                performSegueWithIdentifier("compraCinemaToFinal", sender: self)
            }
        }

    
    
    

    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if segue.identifier == "compraCinemaToFinal"
        {
            if let destinationVC = segue.destinationViewController as? TelaFinal{
                
                
                
                destinationVC.cidade = self.cinema
                destinationVC.qtdMeias = self.qtdMeias
                destinationVC.qtdInteiras = self.qtdInteiras
//
                destinationVC.valorTot = String(self.valorTot)
//
                destinationVC.nome = nomeCinema.text
                destinationVC.cartao = numeroCartaoCinema.text
//                
                destinationVC.dia = self.date
                destinationVC.hora = self.hora
                destinationVC.nomeShow = self.cinema
//
            }
            
            
            
        }
        
        


    }



}
