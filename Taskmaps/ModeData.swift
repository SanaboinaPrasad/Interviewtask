//
//  ModeData.swift
//  Taskmaps
//
//  Created by Sriram Prasad on 13/10/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

    class CustomPin:NSObject,MKAnnotation{
        var coordinate: CLLocationCoordinate2D
        var title : String?
        var subtitle: String?
        
        init(pinTitle: String,pinSubtitle: String,location: CLLocationCoordinate2D) {
            self.title = pinTitle
            self.subtitle = pinSubtitle
            self.coordinate = location
        }
        
}

struct RouteDataModel {
            var sourcelat: Double
            var sourcelong: Double
            var destinationlat: Double
            var destinationlongt: Double
            var sourceName: String
            var destinationName: String
            init(sourcelat:Double,sourcelong:Double,destinationlat:Double,destinationlongt:Double, sourceName:String,destinationName:String) {
                self.sourcelat = sourcelat
                self.sourcelong = sourcelong
                self.destinationlat = destinationlat
                self.destinationlongt = destinationlongt
                self.sourceName = sourceName
                self.destinationName =  destinationName
            }
            
}
//class CitiyDetails {
//  var citesArray = [RouteDataModel]()
//static let sharedInstance = CitiyDetails()
//func citiesdata(data:RouteDataModel) {
//let hydtoBglr = RouteDataModel(sourcelat: 17.385044, sourcelong: 78.486671, destinationlat: 12.971599, destinationlongt:   77.594566, sourceName: "Hyderabad", destinationName: "Banglore")
//
//let FrtoParis = RouteDataModel(sourcelat: 46.227638, sourcelong: 2.213749, destinationlat: 48.856613, destinationlongt: 2.352222, sourceName: "Fance" , destinationName:"paris" )
//
//
//let Milantorome = RouteDataModel(sourcelat: 45.464203, sourcelong: 9.189982, destinationlat: 41.902782, destinationlongt: 12.496365, sourceName: "Milan", destinationName: "Rome")
//
//
//let newyorktoCanada = RouteDataModel(sourcelat: 10.966320, sourcelong: 76.978447, destinationlat: 56.130367, destinationlongt: -106.346771, sourceName: "Newyork", destinationName: "Canada")
//
//
//let germanytobritan = RouteDataModel(sourcelat: 52.523430, sourcelong: 13.411440, destinationlat: 28.607680, destinationlongt: -81.461420, sourceName:"Germany", destinationName: "Britan")
//
//   citesArray.append(hydtoBglr)
//    citesArray.append(FrtoParis)
//    citesArray.append(Milantorome)
//    citesArray.append(newyorktoCanada)
//    citesArray.append(germanytobritan)
//    return
//}
//}
