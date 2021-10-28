//
//  ViewController.swift
//  lesson 3.1
//
//  Created by Тарас Евченко on 28.10.2021.
//

import UIKit


struct Dog {
    let breed: String
    let name: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var dogs = [
        Dog(breed: "Дворняжка", name: "Шарик"),
        Dog(breed: "Овчарка", name: "Дружок"),
        Dog(breed: "Шарпей", name: "Булочка"),
        Dog(breed: "Дворняжка", name: "Булька")
    ]
    
    private var selectedDog: Dog?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confugureTableView()
    }
    
    private func confugureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: .main), forCellReuseIdentifier: "myCell")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destVC = segue.destination as? DogsViewController,
           let dog = selectedDog {
            destVC.breed = dog.breed
            destVC.name = dog.name
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dogs.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as? TableViewCell {
            cell.configure(title: dogs[indexPath.row].breed, text: dogs[indexPath.row].name)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedDog = dogs[indexPath.row]
        performSegue(withIdentifier: "dogsSegue", sender: self)
    }
    
}
