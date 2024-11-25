//
//  MyTableViewCell.swift
//  TableViewCollectionView(Movies Collection)
//
//  Created by Elexoft on 25/11/2024.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: K.NibNames.collectionCellNibName, bundle: nil), forCellWithReuseIdentifier: K.Identifiers.collectionViewCellIdentifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension MyTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eData[collectionView.tag].imageGallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.Identifiers.collectionViewCellIdentifier, for: indexPath) as! MyCollectionViewCell
        
        cell.myImage.image = UIImage(named: eData[collectionView.tag].imageGallery[indexPath.row])
        
        return cell
        
    }
}

extension MyTableViewCell: UICollectionViewDelegate {
    
}
