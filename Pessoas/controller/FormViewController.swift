//
//  ViewController.swift
//  Pessoas
//
//  Created by IFPB on 04/06/21.
//  Copyright © 2021 IFPB. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet weak var tfNome: UITextField!
    @IBOutlet weak var tfIdade: UITextField!
    var pessoaEditavel: Pessoa!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if (self.pessoaEditavel != nil){
            self.tfNome.text = self.pessoaEditavel.nome
            self.tfIdade.text = String(self.pessoaEditavel.idade)
        }
    }
    @IBAction func salvar(_ sender: Any) {
        let nome = self.tfNome.text
        let idade = Int16(self.tfIdade.text!)
        
        if (self.pessoaEditavel != nil) {
            self.pessoaEditavel.nome = nome
            self.pessoaEditavel.idade = idade!
            PessoaDAO().update()
        } else{
            PessoaDAO().add(nome: nome!, idade: idade!)
        }
        self.navigationController?.popViewController(animated: true)
    }
}

