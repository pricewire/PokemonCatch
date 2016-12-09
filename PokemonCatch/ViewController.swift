//
//  ViewController.swift
//  PokemonCatch
//
//  Created by Mark Langlois on 12/7/16.
//  Copyright © 2016 Mark Langlois. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var manager = CLLocationManager()
    
    var updateCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager.delegate = self
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            print("Ready to go!")
            mapView.showsUserLocation = true
            manager.startUpdatingLocation()
            
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { (timer) in
                //Spwan a Pokemon
                
                if let coord = self.manager.location?.coordinate {
                let anno = MKPointAnnotation()
                anno.coordinate = coord
                let randoLat = (Double(arc4random_uniform(200)) - 100.0) / 50000.0
                let randoLong = (Double(arc4random_uniform(200)) - 100.0) / 50000.0
                anno.coordinate.latitude += randoLat
                anno.coordinate.longitude += randoLong
                    self.mapView.addAnnotation(anno)
            }
            })

        } else {
            manager.requestWhenInUseAuthorization()
            
        }
        }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if updateCount < 3 {
        
        let region = MKCoordinateRegionMakeWithDistance(manager.location!.coordinate, 400, 400)
        mapView.setRegion(region, animated: false)
        updateCount += 1
        } else {
            manager.stopUpdatingLocation()
        }
        
    }


    @IBAction func centerTapped(_ sender: AnyObject) {
        if let coord = manager.location?.coordinate {
        let region = MKCoordinateRegionMakeWithDistance(manager.location!.coordinate, 400, 400)
        mapView.setRegion(region, animated: true)
    }

}

}
