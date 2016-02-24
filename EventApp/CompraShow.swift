//
//  CompraShow.swift
//  EventApp
//
//  Created by Matheus Campioli on 2/23/16.
//  Copyright © 2016 Matheus Campioli. All rights reserved.
//

import UIKit

class CompraShow: UIViewController {
    

    @IBOutlet weak var stepperMeia: UIStepper!
    @IBOutlet weak var stepperInteira: UIStepper!
    @IBOutlet weak var contagemMeia: UILabel!
    @IBOutlet weak var contagemInteira: UILabel!
    @IBOutlet weak var valorTotal: UILabel!
    
    @IBOutlet weak var numCartaoTextField: UITextField!
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var codTextField: UITextField!
    @IBOutlet weak var valTextField: UITextField!
    
    var totalMeia: Int!
    var totalInteira: Int!
    
    var diaShow : String!
    var cidadeShow : String!
    

    var show : String!
    
    
    @IBAction func increaseDecreaseMeia(sender: AnyObject) {
        contagemMeia.text = String(Int(stepperMeia.value))
        calculaTotal()
        
    }
    
    
    @IBAction func increaseDecreaseInteira(sender: AnyObject) {
        contagemInteira.text = String(Int(stepperInteira.value))
        calculaTotal()
        
    }
    
    func calculaTotal () {
        totalInteira = Int(stepperInteira.value) * 50
        totalMeia = Int(stepperMeia.value) * 25
        
        let soma: Int = totalInteira + totalMeia
        
        valorTotal.text = String(soma.description)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contagemMeia.text = "0"
        contagemInteira.text = "0"
        
        stepperMeia.maximumValue = 10
        stepperMeia.minimumValue = 0
        //        stepperMeia.wraps = true       --- chega em 10 e volta pro 0
        
        stepperInteira.maximumValue = 10
        stepperInteira.minimumValue = 0
        
    }
    
    override func didReceiveMemoryWarning() {
        didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a littlepreparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    
    
    @IBAction func confirmaCompraShow(sender: AnyObject) {
        
        
        
        
        
        if numCartaoTextField.text!.isEmpty || nomeTextField.text!.isEmpty || codTextField.text!.isEmpty || valTextField.text!.isEmpty {
            
            
            let alertController = UIAlertController(title: "Atenção", message:
                "Você não preencheu todos os campos.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
            
            
            
        else {
            
            if Int(stepperMeia.value) == 0 && Int(stepperInteira.value) == 0{
                
                let alertController = UIAlertController(title: "Atenção", message:
                    "Você não comprou nenhum ingresso.", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
                
            }
                
            else{
                
                
                performSegueWithIdentifier("CompraShowToTelaFinal", sender: self)
            }
        }
        
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if segue.identifier == "CompraShowToTelaFinal"
        {
            if let destinationVC = segue.destinationViewController as? TelaFinal{
                
                
                
                destinationVC.cidade = self.cidadeShow
                destinationVC.qtdMeias = Int(stepperMeia.value)
                destinationVC.qtdInteiras = Int(stepperInteira.value)
                
                destinationVC.valorTot = valorTotal.text
                
                destinationVC.nome = nomeTextField.text
                destinationVC.cartao = numCartaoTextField.text
                destinationVC.nomeShow = self.show
                
                destinationVC.dia = self.diaShow
                
            }
            
            
            
        }
        
        
        
        
    }
}




