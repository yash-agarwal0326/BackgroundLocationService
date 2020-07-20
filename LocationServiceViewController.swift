//
//  LocationServiceViewController.swift
//  LocationServiceDemo
//
//  Created by Yash Agarwal on 07/07/20.
//  Copyright © 2020 Yash Agarwal. All rights reserved.
//

import UIKit
import CoreLocation

class LocationServiceViewController: UIViewController {
    
    // MARK: - Instance Properties
    
    private lazy var locationManager: CLLocationManager = {
      let manager = CLLocationManager()
      manager.desiredAccuracy = kCLLocationAccuracyBest
      manager.delegate = self
      manager.requestAlwaysAuthorization()
      manager.allowsBackgroundLocationUpdates = true
      return manager
    }()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Will start updating location in the background
        locationManager.startUpdatingLocation()
        
        //Will stop updating location in the background
        //locationManager.stopUpdatingLocation()
        
        //Set the accuracy to 10 meter
        locationManager.desiredAccuracy = 10.0
    }
}

// MARK: - CLLocationManagerDelegate

extension LocationServiceViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      guard let mostRecentLocation = locations.last else {
        return
      }
      
        // print the las location of the user
        print("Location: \(mostRecentLocation)")
    }
}
