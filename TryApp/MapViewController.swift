//
//  MapViewController.swift
//  TryApp
//
//  Created by RealityFamily on 25/09/2019.
//  Copyright © 2019 RealityFamily. All rights reserved.
//

import Foundation
import YandexMapKit
import UIKit

class MapViewController: UIViewController, YMKUserLocationObjectListener{
    
    @IBOutlet var mapView: YMKMapView!
    
    let Target_Location = YMKPoint(latitude: 59.945933, longitude: 30.320045)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.mapWindow.map.move(
            with: YMKCameraPosition(target: Target_Location, zoom: 15, azimuth: 0, tilt: 0),
            animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 5),
            cameraCallback: nil)
        
        let scale = UIScreen.main.scale
        let mapKit = YMKMapKit.sharedInstance()!
        let userLocationLayer = mapKit.createUserLocationLayer(with: mapView.mapWindow)

        userLocationLayer.setVisibleWithOn(true)
        userLocationLayer.isHeadingEnabled = true
        userLocationLayer.setAnchorWithAnchorNormal(
            CGPoint(x: 0.5 * mapView.frame.size.width * scale, y: 0.5 * mapView.frame.size.height * scale),
            anchorCourse: CGPoint(x: 0.5 * mapView.frame.size.width * scale, y: 0.83 * mapView.frame.size.height * scale))
        userLocationLayer.setObjectListenerWith(self)
    }
    
    func onObjectAdded(with view: YMKUserLocationView) {}
    
    func onObjectRemoved(with view: YMKUserLocationView) {}
    
    func onObjectUpdated(with view: YMKUserLocationView, event: YMKObjectEvent) {}
}
