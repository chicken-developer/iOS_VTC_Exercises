//
//  ViewController.swift
//  LocationAndMapView
//
//  Created by Nguyen Manh Quynh on 1/8/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

//10.773719, 106.702777
//10.773314, 106.703401
//10.771949, 106.704597
//10.771469, 106.702457
//10.772488, 106.700653


class ViewController: UIViewController {
    let locationManager = CLLocationManager()
    let places = [
        CLLocationCoordinate2D(latitude: 10.773719, longitude: 106.702777),
        CLLocationCoordinate2D(latitude: 10.773314, longitude: 106.703401),
        CLLocationCoordinate2D(latitude: 10.771949, longitude: 106.704597),
        CLLocationCoordinate2D(latitude: 10.771469, longitude: 106.702457),
        CLLocationCoordinate2D(latitude: 10.772488, longitude: 106.700653)]
    
    @IBOutlet weak var myMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myMapView.delegate = self
        getLocationFromString()
        getCurrentLocation()
        self.perform(#selector(addPinToMap), with: nil, afterDelay: 2)
        
        
        
    }
    func getCurrentLocation(){
        
        //Set default value for Location
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 20 //Update location when move range > 20 meter
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
        locationManager.startUpdatingLocation()
            
        }
    }
    
    func showCurrentLocation(location : CLLocationCoordinate2D){
        let myRegion = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        myMapView.setRegion(myRegion, animated: true)
        myMapView.showsUserLocation = true // Add a blue point to show user know now location
    }
    
    @objc func addPinToMap(){
        for place in places {
            let mkPointLocation = MKPointAnnotation()
            mkPointLocation.coordinate = place
            mkPointLocation.title = "Some example text"
            myMapView.addAnnotation(mkPointLocation)
            
        }
    }
    func getLocationFromString(locationName : String = "Thành phố Hồ Chí Minh, quận 1"){
        let clGeoCoder = CLGeocoder()
        clGeoCoder.geocodeAddressString(locationName) { (myPlaceMark, error) in
            guard let place = myPlaceMark?.first else {return}
            let location = place.location?.coordinate
            print(location?.latitude)
            print(location?.longitude)
            self.showCurrentLocation(location: location!)
            
        }
    }
}

extension ViewController : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let userLocation = locations.first else {
            return
        }
        print("User location latitude is: " , userLocation.coordinate.latitude)
        print("User location longitude is: ", userLocation.coordinate.longitude)
        showCurrentLocation(location: userLocation.coordinate)
        
        //  addPinToMap()
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Have error when get location: ", error.localizedDescription)
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationView.DragState, fromOldState oldState: MKAnnotationView.DragState) {
        if newState == .ending{
            let newLocation = myMapView.convert(view.center, toCoordinateFrom: view.superview)
            showCurrentLocation(location: newLocation)
            
        }
    }
}
extension ViewController : MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? MKPointAnnotation{
            let pinAnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "myindetifier")
            pinAnotationView.pinTintColor = .black
           // pinAnotationView.animatesDrop = true
            pinAnotationView.isDraggable = true
            pinAnotationView.image = UIImage(named: "pinIcon.png")
            
            return pinAnotationView
        }
        return nil
    }
}
