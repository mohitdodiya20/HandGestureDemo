//
//  AppDelegate.swift
//  FWD
//
//  Created by Vihar Rana on 17/03/21.
//

import UIKit
import GooglePlaces
import GoogleMaps
import IQKeyboardManagerSwift
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window:UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        GMSServices.provideAPIKey("AIzaSyCJswW0bTmfHHo1o2Y5yx3D9bMHHfpEzsE")
        GMSPlacesClient.provideAPIKey("AIzaSyCJswW0bTmfHHo1o2Y5yx3D9bMHHfpEzsE")
        return true
    }



}

