//
//  MainScreen.swift
//  EventApp
//
//  Created by Matheus Campioli on 2/23/16.
//  Copyright © 2016 Matheus Campioli. All rights reserved.
//

import UIKit

class MainScreen: UIViewController, UITableViewDataSource {


    @IBOutlet weak var table: UITableView!
    
    var numeroSelecionado = 0
    
    var dados1 = ["1.png","2.png", "3.png", "4.png", "5.png", "6.png"]
    var dados2 = ["7.png", "8.png", "9.png", "10.png", "11.png", "12.png"]
    
    var dadosTitulo1 = ["O Regresso", "O Regresso", "O Regresso", "O Regresso", "O Regresso", "O Regresso"]
    var dadosTitulo2 = ["O Regresso", "O Regresso", "O Regresso", "O Regresso", "O Regresso", "O Regresso"]
    
    var dadosDescritos1 = ["O Regresso", "O Regresso", "O Regresso", "O Regresso", "O Regresso", "O Regresso"]
    var dadosDescritos2 = ["O Regresso", "O Regresso", "O Regresso", "O Regresso", "O Regresso", "O Regresso"]
    

    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    var opcoes = ["Cinema", "Shows/Eventos"]
    
    
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return opcoes[section]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return opcoes.count
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! CategoryRow

        if(indexPath.section == 0) {
            cell.arr = dados1
            cell.nomeSegue = "segueDoCinema"
        } else if(indexPath.section == 1) {
            cell.arr = dados2
            cell.nomeSegue = "segueDoShow"
        }
        
        cell.viewController = self
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "segueDoCinema"
        {
            if let destinationVC = segue.destinationViewController as? SelectedMovie {
    

               destinationVC.destinoImagemCinema = dados1[numeroSelecionado]
               destinationVC.destinoTextCinema = dadosTitulo1[numeroSelecionado]
               destinationVC.destinoDescricaoCinema = dadosDescritos1[numeroSelecionado]
            }
        }
        
        if segue.identifier == "segueDoShow"
        {
            if let destinationVC = segue.destinationViewController as? SelectedEvent {
                
//                destinationVC.destinoImagem = dados2[numeroSelecionado]
                destinationVC.destinoText = dadosTitulo2[numeroSelecionado]
                destinationVC.destinoDescricao = dadosDescritos2[numeroSelecionado]
                
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
