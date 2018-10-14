//
//  CityVC.swift
//  Taskmaps
//
//  Created by Sriram Prasad on 12/10/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//

import UIKit

class CityVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
let citynames = ["Hyderabad- Banglore","Fance - Paris","Milan - Rome","Malsiya- Singapore","Poland-Vatican City"]
    let imageArray = [UIImage(named: "Hyderabad"),UIImage(named: "France"),UIImage(named: "Rome"),UIImage(named: "Malsiya"),UIImage(named: "Poland"),]
 var citesArray = [RouteDataModel]()
    @IBOutlet weak var cityTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Cities VC"
        self.navigationController?.navigationBar.barTintColor = UIColor.red
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        cityTableView.delegate = self
        cityTableView.dataSource = self
        data()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cityTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!CitytableViewCell
        cell.cityLabel.text = citynames[indexPath.row]
        cell.photosImgv.image = imageArray[indexPath.row]
        return cell
        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellno = indexPath.row
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let secondVC  = storyboard.instantiateViewController(withIdentifier:"mapVC") as! MapController
            let  destination = secondVC 
            destination.destinationlat = citesArray[cellno].destinationlat
            destination.destinationlong = citesArray[cellno].destinationlongt
            destination.sourcelat = citesArray[cellno].sourcelat
            destination.sourceLong = citesArray[cellno].sourcelong
            destination.sourcename = citesArray[cellno].sourceName
            destination.destinationname = citesArray[cellno].destinationName


            navigationController?.pushViewController(secondVC, animated: true)

        
    }
    
    
    
    
    
    
    
    
    
    func data(){
        
        
        let hydtoBglr = RouteDataModel(sourcelat: 17.385044, sourcelong: 78.486671, destinationlat: 12.971599, destinationlongt:   77.594566, sourceName: "Hyderabad", destinationName: "Banglore")
        
        let FrtoParis = RouteDataModel(sourcelat: 46.227638, sourcelong: 2.213749, destinationlat: 48.856613, destinationlongt: 2.352222, sourceName: "Fance" , destinationName:"paris" )
        
        
        let Milantorome = RouteDataModel(sourcelat: 45.464203, sourcelong: 9.189982, destinationlat: 41.902782, destinationlongt: 12.496365, sourceName: "Milan", destinationName: "Rome")
        
        
        let newyorktoCanada = RouteDataModel(sourcelat: 4.210484, sourcelong: 101.975769, destinationlat: 1.352083, destinationlongt: 103.819839, sourceName: "Malyasia", destinationName: "Singapore")
        
        
        let germanytobritan = RouteDataModel(sourcelat: 51.919437, sourcelong: 19.145136, destinationlat: 41.902230, destinationlongt: 12.458100, sourceName:"Poland", destinationName: "Vatican City")
        
        citesArray.append(hydtoBglr)
        citesArray.append(FrtoParis)
        citesArray.append(Milantorome)
        citesArray.append(newyorktoCanada)
        citesArray.append(germanytobritan)
    }

}
