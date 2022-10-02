//
//  MapView.swift
//  EateriesCoreData
//
//  Created by Ben Li on 25/5/21.
//

import MapKit
import UIKit
import SwiftUI

struct MapView: UIViewRepresentable {
    @ObservedObject var viewModel : Restaurant //<- dont forget !


    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = viewModel
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // code to update Map goes here:
        uiView.setRegion(viewModel.region, animated: true)
        
    }
}
