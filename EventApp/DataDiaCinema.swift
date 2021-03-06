//
//  DataDiaCinema.swift
//  EventApp
//
//  Created by Luisa Paiva on 2/25/16.
//  Copyright © 2016 Matheus Campioli. All rights reserved.
//

import UIKit


// Classe pra mudar a cor do datepicker - Luisa

class ColoredDatePicker: UIDatePicker {
    var changed = false
    override func addSubview(view: UIView) {
        if !changed {
            changed = true
            self.setValue(UIColor.whiteColor(), forKey: "textColor")
        }
        super.addSubview(view)
    }
}

class DataDiaCinema: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var cont = 0
    var filmeSelecionado: String!

    @IBOutlet weak var dateSelected: UILabel!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    

    @IBOutlet weak var myPicker: UIPickerView!
    
    //vetor de opcoes para o picker view
    
    let pickerData = ["Kinoplex Leblon","Cinemark Botafogo","Lagoon","Roxy","Estação Gávea","Estação NET"]

    //MARK: - Delegates and data sources
    //MARK: Data Sources
    
    //funcoes do picker view
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    
    //mudar a cor do picker view para branco
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: pickerData[row], attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
        return attributedString
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        cont = 0
        
        myPicker.dataSource = self
        myPicker.delegate = self
        
        dateSelected.hidden = true  //esconde a label do date picker


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func datePickerAction(sender: AnyObject) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let strDate = dateFormatter.stringFromDate(myDatePicker.date)
        self.dateSelected.text = strDate
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //proxima tela, depende do botao
    
    @IBAction func HourSelected(sender: AnyObject) {
        
        self.cont = 1

        performSegueWithIdentifier("dataToCadeira", sender: self)
    }

    @IBAction func HoursSlected(sender: AnyObject) {
        
        self.cont = 2
        

        performSegueWithIdentifier("dataToCadeira", sender: self)
    }
    
    
    @IBAction func HourSlected(sender: AnyObject) {
        
        self.cont = 3
        

        performSegueWithIdentifier("dataToCadeira", sender: self)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if segue.identifier == "dataToCadeira"
        {
            
//            ENVIAR OS DADOS
            
            
            if let destinationVC = segue.destinationViewController as? CompraCinema{

                destinationVC.filme = self.filmeSelecionado

                if self.cont == 1{
                    destinationVC.date = String(self.dateSelected.text!)
                    destinationVC.hora = "15:30"
                }
                else if self.cont == 2{
                    
                    destinationVC.date = String(self.dateSelected.text!)
                    destinationVC.hora = "17:20"
                    
                }
                    
                else {
                    
                    destinationVC.date = String(self.dateSelected.text!)
                    destinationVC.hora = "19:40"
                }
            }
            
            
            
        }
        
        
    }


}
