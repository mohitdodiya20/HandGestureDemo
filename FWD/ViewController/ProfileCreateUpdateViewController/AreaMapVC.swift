//
//  AreaMapVC.swift
//  FWD
//
//  Created by 360 technosoft on 3/23/21.
//

import UIKit
import GoogleMaps
import GooglePlaces

class AreaMapVC: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var customMapView: UIView!
    
    // MARK: - Variable Declaration
    var lat : Double = 0.0;
    var long : Double = 0.0;
    var address : String = "";
    var placeName : String = "";
    var postalCode : String = ""
    var mapView = GMSMapView()
    var isObserving = false
    var isFromEdit = false
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialValues()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    //MARK:- Custom Function
    func setInitialValues() {
        self.loadMapView()
  
    }
    func loadMapView() {
        DispatchQueue.main.async {
            let camera = GMSCameraPosition.camera(withLatitude: 31.9454, longitude:35.9284,
                                                  zoom: 15)
            self.mapView = GMSMapView.map(withFrame: self.customMapView.bounds, camera: camera)
            //            self.mapView.mapType = kGMSTypeNormal;
            self.mapView.isMyLocationEnabled = true;
            self.mapView.camera = camera;
            self.mapView.delegate = self
            self.mapView.tintColor = kThemeColor1;
            self.mapView.addObserver(self, forKeyPath: "myLocation", options: NSKeyValueObservingOptions.new, context: nil)
            self.isObserving = true
            //            self.mapView.padding = UIEdgeInsets(top: 0, left: 0, bottom: (self.viewGradient.frame.size.height + 20), right: 0)
            
            do {
                // Set the map style by passing the URL of the local file. Make sure style.json is present in your project
                if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
                    self.mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
                } else {
                    print("Unable to find style.json")
                }
            } catch {
                print("The style definition could not be loaded: \(error)")
            }
            self.mapView.removeFromSuperview();
            self.customMapView.addSubview(self.mapView)
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        guard let update = change, let myLocation = update[NSKeyValueChangeKey.newKey] as? CLLocation else {
            return
        }
        
        self.mapView.animate(toLocation: myLocation.coordinate);
//        self.lat = myLocation.coordinate.latitude
//        self.long = myLocation.coordinate.longitude
        
        self.mapView.removeObserver(self, forKeyPath: "myLocation")
        self.isObserving = false
    }
    
    
    // MARK: - Button Action Event
    
    
    @IBAction func btnActionCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

//MARK:- GMSAutocomplete 
extension AreaMapVC : GMSAutocompleteViewControllerDelegate {
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
    
        DispatchQueue.main.async {
            self.mapView.tag = 1
            self.mapView.animate(toLocation: place.coordinate);
            self.address = place.formattedAddress ?? ""
            self.placeName = place.name!
            if place.addressComponents != nil {
                if (place.addressComponents?.count)! > 0 {
                    //him
                    if place.addressComponents?.last?.types == ["postal_code"] {
                        self.postalCode = (place.addressComponents?.last?.name)!
                    }
                }
            }
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // To handle error
        print(error)
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @nonobjc func didRequestAutocompletePredictions(viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    @nonobjc func didUpdateAutocompletePredictions(viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}

extension AreaMapVC : GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        if self.mapView.tag != 1 {
            self.address = ""
            self.placeName = ""
            self.postalCode = ""
        }else {
            self.mapView.tag = 0
        }
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        self.address = ""
        self.placeName = ""
        self.postalCode = ""
        self.mapView.animate(toLocation: coordinate)
    }
}
