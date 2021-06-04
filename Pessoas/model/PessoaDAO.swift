//
//  PessoaDAO.swift
//  Pessoas
//
//  Created by IFPB on 04/06/21.
//  Copyright © 2021 IFPB. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class PessoaDAO {
    var delegate: AppDelegate
    
    init() {
        self.delegate = (UIApplication.shared.delegate as! AppDelegate)
    }
    func add(nome: String, idade: Int16) {
        let pessoa = Pessoa(context: self.delegate.persistentContainer.viewContext)
        pessoa.nome = nome
        pessoa.idade = idade
        self.delegate.saveContext()
        
    }
    func get() -> Array<Pessoa>{
        let requisicao: NSFetchRequest<Pessoa> = Pessoa.fetchRequest()
        do {
            let pessoas = try self.delegate.persistentContainer.viewContext.fetch(requisicao)
            return pessoas
        } catch {
            return Array<Pessoa>()
        }
    }
    func filter(nome: String) -> Array<Pessoa> {
        let requisicao: NSFetchRequest<Pessoa> = Pessoa.fetchRequest()
        requisicao.predicate = NSPredicate(format: "nome CONTAINS %@", nome)
        do {
            let pessoas = try self.delegate.persistentContainer.viewContext.fetch(requisicao)
            return pessoas
        } catch {
            return Array<Pessoa>()
        }
    }
    func del(pessoa: Pessoa) {
        self.delegate.persistentContainer.viewContext.delete(pessoa)
        self.delegate.saveContext()
        
    }
    func update() {
        self.delegate.saveContext()
        
    }
}
        
