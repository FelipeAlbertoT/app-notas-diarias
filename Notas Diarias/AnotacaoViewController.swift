//
//  ViewController.swift
//  Notas Diarias
//
//  Created by 5A Nucleo Desenvolvimento on 07/03/2018.
//  Copyright © 2018 Felipe Alberto Treichel. All rights reserved.
//

import UIKit
import CoreData

class AnotacaoViewController: UIViewController {

    
    @IBOutlet weak var texto: UITextView!
    var context: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configurações iniciais
        self.texto.becomeFirstResponder()
        self.texto.text = ""
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
    }


    @IBAction func salvar(_ sender: Any) {
        self.salvarAnotacao()
        
        // Retorna para tela principal
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func salvarAnotacao() {
        let anotacao = NSEntityDescription.insertNewObject(forEntityName: "Anotacao", into: context)
        
        anotacao.setValue(self.texto.text, forKey: "texto")
        anotacao.setValue(Date(), forKey: "data")
        
        do {
            try context.save()
            print("Sucesso ao salvar anotação!")
        } catch {
            print("Erro ao salvar anotação")
        }
    }
    
}

