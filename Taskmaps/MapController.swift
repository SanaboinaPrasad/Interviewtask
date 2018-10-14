//
//  MapsVC.swift
//  Taskmaps
//
//  Created by Sriram Prasad on 12/10/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//
//Apple donot have direction in india

import UIKit
import MapKit
import CoreLocation

class MapController: UIViewController,MKMapViewDelegate {
    
    
    var sourcelat:Double?
        var sourceLong:Double?
        var destinationlat:Double?
        var destinationlong:Double?
        var sourcename:String?
        var destinationname:String?
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Locations VC"
        self.navigationController?.navigationBar.barTintColor = UIColor.red
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        guard let slat = sourcelat,let slong = sourceLong,let dlat =  destinationlat,let dlong = destinationlong,let sname = sourcename,let dNmae = destinationname else {
            return
        }
        
        
        let sourceLatitude = slat
        let sourcelongitiude = slong
        let destinatiolatitude = dlat
        let destinationlongitude = dlong
        let sourceName = sname
        let destinationName = dNmae
        
        
        mapView.delegate = self as MKMapViewDelegate
        let sourceLocation = CLLocationCoordinate2D(latitude: sourceLatitude, longitude: sourcelongitiude)
        let destinationLocation = CLLocationCoordinate2D(latitude: destinatiolatitude, longitude: destinationlongitude)
        
        let sourcePin = CustomPin(pinTitle: sourceName, pinSubtitle: "", location: sourceLocation)
        let destinationpin = CustomPin(pinTitle: destinationName, pinSubtitle: "", location: destinationLocation)
        self.mapView.addAnnotation(sourcePin)
        self.mapView.addAnnotation(destinationpin)
        
        
        let sourcePlacemarker = MKPlacemark(coordinate: sourceLocation)
        let DestinationPlacemarker = MKPlacemark(coordinate: destinationLocation)
        
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = MKMapItem(placemark: sourcePlacemarker)
        directionRequest.destination = MKMapItem(placemark: DestinationPlacemarker)
        directionRequest.transportType = .automobile
        let directions = MKDirections(request: directionRequest)
        directions.calculate { (response, error) in
            
            guard let directionResponse = response else {
                if let error = error {
                    print("error we have\(error.localizedDescription)")
                    self.alert(message: "\(error.localizedDescription)in INDIA", title: " NO Direction ")
                }
                
                return
            }
            
            let route = directionResponse.routes[0]
            self.mapView.addOverlay(route.polyline, level: .aboveRoads)
            let rect = route.polyline.boundingMapRect
            self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
        }
    }
    
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let render = MKPolylineRenderer(overlay: overlay)
        render.strokeColor = UIColor.blue
        render.lineWidth = 4.0
        return render
    }
  
    func alert(message: String ,title: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}




