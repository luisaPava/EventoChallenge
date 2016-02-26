//
//  TelaFinal.swift
//  EventApp
//
//  Created by Luisa Mello on 2/23/16.
//  Copyright © 2016 Matheus Campioli. All rights reserved.
//

import UIKit

class TelaFinal: UIViewController {

    @IBOutlet weak var showLabel: UILabel!
    
    @IBOutlet weak var infoPessoalLabel: UILabel!
    
    @IBOutlet weak var dadosCompraLabel: UILabel!
    
    
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
        
        
        showLabel.text = "\(nomeShow)     -    \(dia)   -  \(hora)"
        infoPessoalLabel.text = "Nome:\(nome) \n Cartão:\(cartao)"
        dadosCompraLabel.text = "Inteiras:  \(String(qtdInteiras)) -    Meias:  \(String(qtdMeias)) \n Valor total da compra:  \(String(valorTot))"
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func voltarMain(sender: AnyObject) {
        
    performSegueWithIdentifier("TelaFinalToMain", sender: nil)
    }

}
