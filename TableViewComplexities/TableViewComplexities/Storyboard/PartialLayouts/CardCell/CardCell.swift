//  CardCell.swift
//  TableViewComplexities
//  Created by Mashhood Qadeer on 20/06/2021.

import UIKit

class CardCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var filterLayoutHeight: NSLayoutConstraint!
    @IBOutlet weak var cardTitle: UILabel!
    @IBOutlet weak var filtterName: UITextField!
    var card: Card?
    @IBOutlet weak var collectionView: CustomCollectionView!
    var notifyTableView: ( () -> Void )?
    var isVisible: Bool = false
    override func awakeFromNib() {
        super.awakeFromNib()
    }
     
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func addFilter(_ sender: Any) {
          if( self.card  != nil ){
              self.card?.cardFilters.append(  CardFilter( cardFilter: self.filtterName.text as? String ?? "") )
          }
    }
    
    func configureCell(card : Card){
         self.card = card
         self.fillLayout()
    }
    
    func fillLayout(){
         self.cardTitle.text = self.card!.title
         self.setupCollectionView()
    }
    
    func setupCollectionView(){
        
        var flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
         self.collectionView.collectionViewLayout =  flowLayout
         flowLayout.scrollDirection = .vertical
         flowLayout.estimatedItemSize = CGSize( width: collectionView.frame.width , height: 30 )
         self.collectionView.delegate = self
         self.collectionView.dataSource = self
         self.collectionView.register( UINib.init(nibName: String ( describing: CardFilterView.self ) , bundle: nil), forCellWithReuseIdentifier: String ( describing: CardFilterView.self ))
        if(self.isVisible){
         self.collectionView.reloadData()
        }
        
    }

    //Collection View Methods
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        var collectionViewCell: CardFilterView = collectionView.dequeueReusableCell(withReuseIdentifier: String ( describing: CardFilterView.self ) , for: indexPath) as! CardFilterView
        collectionViewCell.cardFilterText.text = self.card!.cardFilters[indexPath.row].cardFilter
        collectionViewCell.widthAnchor_.constant = collectionView.frame.width
        return collectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if( indexPath.row  > 1){
            
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
         return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.card!.cardFilters.count
    }

}
