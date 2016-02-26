//
//  TelaFinal.swift
//  EventApp
//
//  Created by Luisa Mello on 2/23/16.
//  Copyright © 2016 Matheus Campioli. All rights reserved.
//

import UIKit

class TelaFinal: UIViewController {

    
    @IBOutlet weak var infoFinal: UITextView!
    
    
    var cidade : String!
    var dia : String!
    var qtdMeias : Int!
    var qtdInteiras : Int!
    var valorTot : String!
    var cartao : String!
    var nome : String!
    var nomeShow : String!
    var hora: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if hora == nil{
        infoFinal.text = "\(nomeShow)     -    \(dia)\n Nome:\(nome) \n Cartão:\(cartao)\n Inteiras:  \(String(qtdInteiras)) -    Meias:  \(String(qtdMeias)) \n \n Valor total da compra:  \(String(valorTot))"
        }
        
        else{
            
        infoFinal.text = "\(nomeShow)  -    \(dia)  -  \(hora)\n Nome:\(nome) \n Cartão:\(cartao)\n Inteiras:  \(String(qtdInteiras)) -    Meias:  \(String(qtdMeias)) \n \n Valor total da compra:  \(String(valorTot))"

    }
        
    }
    
        
        // Do any additional setup after loading the view.
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func voltarMain(sender: AnyObject) {
        
    performSegueWithIdentifier("TelaFinalToMain", sender: nil)
    }

}
