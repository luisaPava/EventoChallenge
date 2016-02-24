//
//  CompraCinema.swift
//  EventApp
//
//  Created by Luisa Mello on 2/23/16.
//  Copyright © 2016 Matheus Campioli. All rights reserved.
//

import UIKit

class CompraCinema: UIViewController, ZSeatSelectorDelegate {

    @IBOutlet weak var stepperMeia: UIStepper!
    @IBOutlet weak var stepperInteira: UIStepper!
    @IBOutlet weak var contagemMeia: UILabel!
    @IBOutlet weak var contagemInteira: UILabel!
    @IBOutlet weak var valorTotal: UILabel!
    
    var totalMeia: Int!
    var totalInteira: Int!
    
    
    
    @IBAction func increaseDecreaseMeia(sender: AnyObject) {
        contagemMeia.text = String(Int(stepperMeia.value))
        calculaTotal()
        
        print("helo")
        
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
    
//    func conta ()-> Int {
//        
//        return Int(stepperMeia.value)
//    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        contagemMeia.text = "0"
        contagemInteira.text = "0"
        
        stepperMeia.maximumValue = 10
        stepperMeia.minimumValue = 0
        

        //        stepperMeia.wraps = true       --- chega em 10 e volta pro 0
        
        stepperInteira.maximumValue = 10
        stepperInteira.minimumValue = 0
        
        
        
        
        
        
        
        
        
        
        
        
        
        let map:String =    "AAAAA_AAAAA/" +
            "UAAAA_AAAAA/" +
            "UUUUU_AAAAA/" +
            "UAAAA_AAAAA/" +
        "AAADD_DDAAA/";
        
        
        let seats = ZSeatSelector()
        
        // 200 desse proximo comando muda a altura do frame (caixa), resto não sei
        
        
        seats.frame = CGRectMake(0, 350, self.view.frame.size.width, 500)
        // width e height muda o tamanho da cadeira
        
        seats.setSeatSize(CGSize(width: 20, height: 20))
        seats.setAvailableImage(UIImage(named: "A")!,
            andUnavailableImage:UIImage(named: "U")!,
            andDisabledImage:   UIImage(named: "D")!,
            andSelectedImage:   UIImage(named: "S")!)
        seats.setMap(map)
        seats.seat_price = 10.0
        seats.selected_seat_limit = 0
        seats.seatSelectorDelegate = self
        self.view.addSubview(seats)
        
        
        
        
        // AI NAO MEXER NISSO AQUI PQ EU DESATIVEI -----------------------------------
        
        let map2:String =   "________________" +
            "_____/" +
            "________________________/" +
            "______/" +
            "______/" +
            "______/" +
            "__________________/" +
        "__________________/"
        
        let seats2 = ZSeatSelector()
        seats2.frame = CGRectMake(0, 250, self.view.frame.size.width, 10)
        seats2.setSeatSize(CGSize(width: 20, height: 20))
        seats2.setAvailableImage(   UIImage(named: "A")!,
            andUnavailableImage:    UIImage(named: "U")!,
            andDisabledImage:       UIImage(named: "D")!,
            andSelectedImage:       UIImage(named: "S")!)
        seats2.setMap(map2)
        seats2.seat_price           = 5.0
        seats2.selected_seat_limit  = 5
        seats2.seatSelectorDelegate = self
        seats2.maximumZoomScale         = 5.0
        seats2.minimumZoomScale         = 0.5
        self.view.addSubview(seats2)
        
        
        //ACABOU O QUE NAO PODE TOCAAAAR  ---------------------------------------------
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func seatSelected(seat: ZSeat) {
        // print("Seat at row: \(seat.row) and column: \(seat.column)\n")
    }
    
    
    
    
    // Método que vai ter a contagem das cadeiras selecionadas, precisamos dessa info!!!

    
    func getSelectedSeats(seats: NSMutableArray) {
        var total:Float = 0.0;
        for i in 0..<seats.count {
            let seat:ZSeat  = seats.objectAtIndex(i) as! ZSeat
            print("Seat at row: \(seat.row) and column: \(seat.column)\n")
            total += seat.price
        }
        print("----- Total -----\n")
        print("----- \(total) -----\n")
        
        // seats.count tem o número de cadeiras selecionadas. O método selecionar cadeira tenho mínima idéia como funciona.
        
        print("----\(seats.count)----\n")
        
    }
}
