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

        // Matheus -- COPIAR AQUI
        
        emailTextViewlogin.delegate = self
        senhaTextViewlogin.delegate = self
        
        // END ATÉ AQUI
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Restrição para não ter campos vazios
    
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

    // --- COPIAR AQUI ----
    
    //-- Matheus : Funcao Subir tela para exibir teclado
    
    func textFieldDidBeginEditing(cpfTextField: UITextField) {
        animateViewMoving(true, moveValue: 100)
    }
    func textFieldDidEndEditing(cpfTextField: UITextField) {
        animateViewMoving(false, moveValue: 100)
    }
    
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration:NSTimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = CGRectOffset(self.view.frame, 0,  movement)
        UIView.commitAnimations()
    }
    
    // ----- Função: Botao next ----
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == self.emailTextViewlogin {
            self.senhaTextViewlogin.becomeFirstResponder()
        }
        
        return true
    }
    
    
    
    // --- Função : Clicar fora da tela pra esconder o teclado.
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    // --- ATÉ AQUI

}
