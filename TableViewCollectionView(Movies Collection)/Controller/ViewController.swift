//
//  ViewController.swift
//  TableViewCollectionView(Movies Collection)
//
//  Created by Elexoft on 25/11/2024.
//

import UIKit

var eData = [
    EntertainmentApp(sectionType: K.SectionNames.bollywoodMovies, imageGallery: [
        K.imagesNames.BollywoodMoviesNames.image1,
        K.imagesNames.BollywoodMoviesNames.image2,
        K.imagesNames.BollywoodMoviesNames.image3,
        K.imagesNames.BollywoodMoviesNames.image4,
        K.imagesNames.BollywoodMoviesNames.image5
    ]),
    
    EntertainmentApp(sectionType: K.SectionNames.punjabiMovies, imageGallery: [
        K.imagesNames.PunjabiMoviesNames.image1,
        K.imagesNames.PunjabiMoviesNames.image2,
        K.imagesNames.PunjabiMoviesNames.image3,
        K.imagesNames.PunjabiMoviesNames.image4,
        K.imagesNames.PunjabiMoviesNames.image5
    ]),
    
    EntertainmentApp(sectionType: K.SectionNames.webSeries, imageGallery: [
        K.imagesNames.WebSeriesNames.image1,
        K.imagesNames.WebSeriesNames.image2,
        K.imagesNames.WebSeriesNames.image3,
        K.imagesNames.WebSeriesNames.image4,
        K.imagesNames.WebSeriesNames.image5,
    ]),
]

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: K.NibNames.tableViewCellNibName, bundle: nil), forCellReuseIdentifier: K.Identifiers.tableViewCellIdentifier)
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return eData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Identifiers.tableViewCellIdentifier, for: indexPath) as! MyTableViewCell
        
        cell.collectionView.tag = indexPath.section
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return eData[section].sectionType
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        return view.tintColor = .yellow
    }
}
