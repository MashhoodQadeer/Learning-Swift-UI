//  ViewController.swift
//  TableViewComplexities
//  Created by Mashhood Qadeer on 20/06/2021.

import UIKit

class ViewController: UIViewController,   UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var tableView: UITableView!
    var cardsList: [Card] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillDummyData()
        self.setupTableView()
    }
    
    func fillDummyData(){
        for i in 0...100 {
            var card: Card = Card(title: "Card Title\(i)", cardFilters: [])
            for j in 0...200 {
                card.cardFilters.append(CardFilter( cardFilter: "Card Filter no \(j)"))
            }
            self.cardsList.append(card)
        }
    }
    
    func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorColor = .clear
        self.tableView.register(UINib(nibName: String( describing : CardCell.self ), bundle: nil), forCellReuseIdentifier: String( describing : CardCell.self ) )
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cardsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
        var cardCell: CardCell = tableView.dequeueReusableCell(withIdentifier: String( describing : CardCell.self )) as! CardCell
        cardCell.configureCell(card: self.cardsList[indexPath.row])
        cardCell.notifyTableView = self.refreshTableView
        cardCell.isVisible = tableView.isCellVisible(indexPath: indexPath)
        
        return cardCell
    }
    
    func refreshTableView(){
        self.tableView.reloadData()
    }
    
}

extension UITableView {
    
    func isCellVisible(indexPath: IndexPath) -> Bool {
        guard let indexes = self.indexPathsForVisibleRows else {
            return false
        }
        return indexes.contains(indexPath)
    }
}
