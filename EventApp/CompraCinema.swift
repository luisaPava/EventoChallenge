import UIKit

class CompraCinema: UIViewController , ZSeatSelectorDelegate {
    
    let seats = ZSeatSelector()
    
    
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
        seats.selected_seat_limit = conta()
        
        
        let map:String =    "\nAAAAA_AAAAA/" +
            "UAAAA_AAAAA/" +
            "UUUUU_AAAAA/" +
            "UAAAA_AAAAA/" +
        "AAADD_DDAAA/";
        
        
        
        
        // 200 desse proximo comando muda a altura do frame (caixa), resto não sei
        
        
        seats.frame = CGRectMake(0, 300, self.view.frame.size.width, 120)
        // width e height muda o tamanho da cadeira
        
        
        seats.setSeatSize(CGSize(width: 20, height: 20))
        seats.setAvailableImage(UIImage(named: "A")!,
            andUnavailableImage:UIImage(named: "U")!,
            andDisabledImage:   UIImage(named: "D")!,
            andSelectedImage:   UIImage(named: "S")!)
        seats.setMap(map)
        seats.seat_price = 10.0
        
        seats.seatSelectorDelegate = self
        self.view.addSubview(seats)
        
    }
    
    
    @IBAction func increaseDecreaseInteira(sender: AnyObject) {
        contagemInteira.text = String(Int(stepperInteira.value))
        calculaTotal()
        seats.selected_seat_limit = conta()
        
        
        let map:String =    "\nAAAAA_AAAAA/" +
            "UAAAA_AAAAA/" +
            "UUUUU_AAAAA/" +
            "UAAAA_AAAAA/" +
        "AAADD_DDAAA/";
        
        
        
        
        // 200 desse proximo comando muda a altura do frame (caixa), resto não sei
        
        
        seats.frame = CGRectMake(0, 300, self.view.frame.size.width, 120)
        // width e height muda o tamanho da cadeira
        
        
        seats.setSeatSize(CGSize(width: 20, height: 20))
        seats.setAvailableImage(UIImage(named: "A")!,
            andUnavailableImage:UIImage(named: "U")!,
            andDisabledImage:   UIImage(named: "D")!,
            andSelectedImage:   UIImage(named: "S")!)
        seats.setMap(map)
        seats.seat_price = 10.0
        
        seats.seatSelectorDelegate = self
        self.view.addSubview(seats)
        
        
        
        
        
    }
    
    func calculaTotal () {
        totalInteira = Int(stepperInteira.value) * 50
        totalMeia = Int(stepperMeia.value) * 25
        
        let soma: Int = totalInteira + totalMeia
        
        valorTotal.text = String(soma.description)
    }
    
    func conta ()-> Int {
        let meia = Int(stepperMeia.value)
        let inteira = Int(stepperInteira.value)
        let soma = meia + inteira
        
        return (soma)
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
        
        
        
        
        
        
        
        
        
        
        
        
        
        let map:String =    "\nAAAAA_AAAAA/" +
            "UAAAA_AAAAA/" +
            "UUUUU_AAAAA/" +
            "UAAAA_AAAAA/" +
        "AAADD_DDAAA/";
        
        
        
        
        // 200 desse proximo comando muda a altura do frame (caixa), resto não sei
        
        
        seats.frame = CGRectMake(0, 300, self.view.frame.size.width, 120)
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
    
    
    
    
    // Método que vai ter a contagem das cadeiras selecionadas, precisamos dessa info!!!!!!!!!
    
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
    
    
    
    
    
    @IBAction func confirmaLugares(sender: AnyObject) {
        
        
        print(seats.selected_seats.count)
        
        if Int(stepperMeia.value) == 0 && Int(stepperInteira.value) == 0{
            
            let alertController = UIAlertController(title: "Atenção", message:
                "Você não comprou nenhum ingresso.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
            
        else{
            
            
            
            if
                
            seats.selected_seats.count == 0 {
            
                
                let alertController = UIAlertController(title: "Atenção", message:
                    "Você não selecionou nenhuma cadeira.", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
            
            }
            
            
            // inserir identifier dos textfields da compra
            else{
                
                if seats.selected_seats.count != seats.selected_seat_limit{
                    
                    let alertController = UIAlertController(title: "Atenção", message:
                        "Você não selecionou todas cadeiras.", preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                    
                    self.presentViewController(alertController, animated: true, completion: nil)
                    
                }

                
                //else{performSegueWithIdentifier("", sender: self)}}
            }
        
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pa}ss the selected object to the new view controller.
    }
    */
}
}
