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
   
    
    //arrays em que entrarão as imagens wide para a tela de informações sobre o filme
    var moviesWide = ["1wide.jpg","2wide.jpg", "3wide.jpg", "4wide.jpg", "5wide.jpg", "6wide.jpg"]
    var showsWide = ["7wide.jpg","8wide.jpg", "9wide.jpg", "10wide.jpg", "11wide.jpg", "12wide.jpg"]

    var dadosTitulo1 = ["Deadpool", "O Regresso", "O quarto de Jack", "Civil War", "Batman vs Superman", "Perdido em marte"]
    var dadosTitulo2 = ["Aerosmith", "Paul McCartney", "Maroon 5", "Rock in Rio", "David Guetta", "Coldplay"]
    
    var dadosDescritos1 = ["LEGENDADO. \nEx-militar e mercenário, Wade Wilson (Ryan Reynolds) é diagnosticado com câncer em estado terminal, porém encontra uma possibilidade de cura em uma sinistra experiência científica. Recuperado, com poderes e um incomum senso de humor, ele torna-se Deadpool e busca vingança contra o homem que destruiu sua vida.", "LEGENDADO. \n1822. Hugh Glass (Leonardo DiCaprio) parte para o oeste americano disposto a ganhar dinheiro caçando. Atacado por um urso, fica seriamente ferido e é abandonado à própria sorte pelo parceiro John Fitzgerald (Tom Hardy), que ainda rouba seus pertences. Entretanto, mesmo com toda adversidade, Glass consegue sobreviver e inicia uma árdua jornada em busca de vingança.", "DUBLADO. \nJoy (Brie Larson) e seu filho Jack (Jacob Tremblay) vivem isolados em um quarto. O único contato que ambos têm com o mundo exterior é a visita periódica do Velho Nick (Sean Bridgers), que os mantém em cativeiro. Joy faz o possível para tornar suportável a vida no local, mas não vê a hora de deixá-lo. Para tanto, elabora um plano em que, com a ajuda do filho, poderá enganar Nick e retornar à realidade", "LEGENDADO. \nSteve Rogers (Chris Evans) é o atual líder dos Vingadores, super-grupo de heróis formado por Viúva Negra (Scarlett Johansson), Feiticeira Escarlate (Elizabeth Olsen), Visão (Paul Bettany), Falcão (Anthony Mackie) e Máquina de Combate (Don Cheadle). O ataque de Ultron fez com que os políticos buscassem algum meio de controlar os super-heróis, já que seus atos afetam toda a humanidade. Tal decisão coloca o Capitão América em rota de colisão com Tony Stark (Robert Downey Jr.), o Homem de Ferro.", "DUBLADO. \nApós os eventos de O Homem de Aço, Superman (Henry Cavill) divide a opinião da população mundial. Enquanto muitos contam com ele como herói e principal salvador, vários outros não concordam com sua permanência no planeta. Bruce Wayne (Ben Affleck) está do lado dos inimigos de Clark Kent e decide usar sua força de Batman para enfrentá-lo. Enquanto os dois brigam, porém, uma nova ameaça ganha força.", "LEGENDADO. \nO astronauta Mark Watney (Matt Damon) é enviado a uma missão em Marte. Após uma severa tempestade ele é dado como morto, abandonado pelos colegas e acorda sozinho no misterioso planeta com escassos suprimentos, sem saber como reencontrar os companheiros ou retornar à Terra."]
    
    var dadosDescritos2 = ["Aerosmith no Brasil 2016 em 3 cidades: São Paulo, Rio de Janeiro e Porto Alegre.", "Paul McCartney no Brasil 2016 em 3 cidades: São Paulo, Rio de Janeiro e Porto Alegre.", "Maroon 5 no Brasil 2016 em 3 cidades: São Paulo, Rio de Janeiro e Porto Alegre.", "Rock in Rio no Brasil 2016 em 3 cidades: São Paulo, Rio de Janeiro e Porto Alegre.", "David Gueta no Brasil 2016 em 3 cidades: São Paulo, Rio de Janeiro e Porto Alegre.", "Coldplay no Brasil 2016 em 3 cidades: São Paulo, Rio de Janeiro e Porto Alegre."]
    
    var vetorUrl = ["http://www.imdb.com/title/tt1431045/?ref_=nv_sr_1","http://www.imdb.com/title/tt1663202/?ref_=fn_al_tt_1", "http://www.imdb.com/title/tt3170832/?ref_=fn_al_tt_1", "http://www.imdb.com/title/tt3498820/", "http://www.imdb.com/title/tt2975590/?ref_=nv_sr_1", "http://www.imdb.com/title/tt3659388/"]

    
    

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
    

                destinationVC.destinoImagemCinema = UIImage(named: moviesWide[numeroSelecionado])
               destinationVC.destinoTextCinema = dadosTitulo1[numeroSelecionado]
               destinationVC.destinoDescricaoCinema = dadosDescritos1[numeroSelecionado]
                
                destinationVC.urlFilme = vetorUrl[numeroSelecionado]
                
            }
        }
        
        if segue.identifier == "segueDoShow"
        {
            if let destinationVC = segue.destinationViewController as? SelectedEvent {
                
                destinationVC.destinoImagem = UIImage(named: showsWide[numeroSelecionado])
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
