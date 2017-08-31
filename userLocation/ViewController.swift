//
//  ViewController.swift
//  userLocation
//
//  Created by Ushna Shah on 8/30/17.
//  Copyright © 2017 CodeGirl. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController , CLLocationManagerDelegate{

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var latText: UILabel!
    
    
    @IBOutlet weak var longText: UILabel!
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let userLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(userLocation, span)
        mapView.setRegion(region, animated: true)
        print(location.altitude)
        print(location.speed)
        print(location.coordinate.latitude)
        print(location.coordinate.longitude)
        latText.text = "Latitude: \(location.coordinate.latitude)"
        longText.text = "Longitude: \(location.coordinate.longitude)"
        self.mapView.showsUserLocation = true
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

