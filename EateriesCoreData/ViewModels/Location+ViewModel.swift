//
//  Location+ViewModel.swift
//  EateriesCoreData
//
//  Created by Ben Li on 25/5/21.
//

import Foundation
import CoreData
import CoreLocation
import MapKit
private var isGeocoding = false
private var updateCount = 0



extension Restaurant: MKMapViewDelegate {


    var locationNameString: String{
        get { locationName ?? ""}
        set { locationName = newValue}
    }
    
    var locationLatitudeString: String {
        get { String(latitude) }
        set { latitude = Double(newValue) ?? 0.0}
    }
    
    var locationLongitudeString: String {
        get { String(longitude) }
        set { longitude = Double(newValue) ?? 0.0}
    }
    
    var location:CLLocation {
        get { CLLocation(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude)) }
        set {
            latitude = newValue.coordinate.latitude
            longitude = newValue.coordinate.longitude
        }
    }
    
    var coordinates: CLLocationCoordinate2D{
        get { CLLocationCoordinate2D(latitude: latitude, longitude: longitude)}
        set {
            latitude = newValue.latitude
            longitude = newValue.longitude
        }
    }

    //-------------------------------------------------MapKit------------------------------------------------------------------
    var coordinateSpan: MKCoordinateSpan{

        get { MKCoordinateSpan(latitudeDelta: CLLocationDegrees(latitudeSpan), longitudeDelta: CLLocationDegrees(longitudeSpan))}
        set {
            latitudeSpan = Float(newValue.latitudeDelta)
            longitudeSpan = Float(newValue.latitudeDelta)
        }
    }
 
    var region: MKCoordinateRegion {
        get {MKCoordinateRegion( center: coordinates, span: coordinateSpan) }
        set{ coordinateSpan = newValue.span }
    
    }
    
    @objc public func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        let centre = mapView.centerCoordinate
        updateCount += 1
        // wait for 250 millsecond
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(50)) {
            updateCount -= 1
            guard updateCount == 0 else {return}
            self.coordinates = centre
        }
    }
    
    //------------------------------------------Function under this line----------------------------------------------------------
    
    
    func lookupName() {
        let geoCoder = CLGeocoder() //<- this is a class
        guard !isGeocoding else { return }
        isGeocoding = true
        
        geoCoder.reverseGeocodeLocation(location){
            isGeocoding = false
            guard let placeMarks = $0, let placeMark = placeMarks.first else {
               // print("Error Looking up location \(String(describing: $1))")
                if let error = $1{
                   // print("ERR#1")
                    print("Error looking up location (A): \(error.localizedDescription)")
                }else{
                   // print("ERR#2")
                    print("Error looking up location (B): \(String(describing: $1))")
                }
                return
            }
            //
            //print("error lookup location(C)" )
            //If we get a placemark
            self.locationNameString = /*placeMark.name ??*/ placeMark.locality ?? placeMark.subLocality ?? placeMark.administrativeArea ?? placeMark.country ?? "< not found >"
            
        }
        
    }
    
    
    func lookupPosition() {
        let geoCoder = CLGeocoder() //<- this is a class
        guard !isGeocoding else {return}
        isGeocoding = true

        geoCoder.geocodeAddressString(locationNameString) {
            isGeocoding = false

            guard let placeMarks = $0, let placeMark = placeMarks.first,
                  let coordinates = placeMark.location?.coordinate else {
               // print("Error Looking up location \(String(describing: $1))")
                if let error = $1{
                   // print("ERR#1")
                    print("Error looking up location (D): \(error.localizedDescription)")
                }else{
                   // print("ERR#2")
                    print("Error looking up location (E): \(String(describing: $1))")
                }
                return
            }
            self.latitude = coordinates.latitude
            self.longitude = coordinates.longitude

        }
    }
    
}
