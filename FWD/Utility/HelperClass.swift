//
//  HelperClass.swift
//  Staff Managment
//
//  Created by IOS PC-2 on 16/06/17.
//  Copyright © 2017 Rakesh Gupta. All rights reserved.
//

import Foundation
import UIKit
//import Alamofire

var navigationBarImages : NavigationImages? = NavigationImages()

let helper = HelperClass()

struct NavigationImages {
    var backgroundImage : UIImage?
    var shadowImage : UIImage?
}

struct MediaType {
    static let audio = "audio/m4a"
    static let video = "video/mp4"
    static let image = "image/jpeg"
}


class HelperClass : NSObject {
    
  
    
    class func isValidEmail(testStr:String) -> Bool {
        
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
 
 
    class func showPopupAlertController(sender : Any?, message : String) -> Void {
        
        let alert = UIAlertController(title: Bundle.main.infoDictionary!["CFBundleName"] as? String,
                                      message: message as String,
                                      preferredStyle: UIAlertController.Style.alert)

        let OKAction = UIAlertAction(title: "OK",
                                     style: .default, handler: nil)
        
        alert.addAction(OKAction)
        
        if (UIApplication.shared.keyWindow?.rootViewController! .isKind(of: UINavigationController.self))!{
        
            (sender as! UIViewController).present(alert, animated: true, completion: nil)
        }else {
           UIApplication.shared.keyWindow?.rootViewController!.present(alert, animated: true,completion: nil)
        }
       
        
    }
    

    class func isAlphabaticName(_ name: String) -> Bool{
        let regex: String = "^[a-zA-Z]+$"
        let userNameTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return userNameTest.evaluate(with: name)
    }
    
    class func createCustomTitle(text: String, vc:UIViewController)
    {
        let lblTitle : UILabel = UILabel()
        lblTitle.textAlignment = NSTextAlignment.center
        lblTitle.text = text
//        lblTitle.textColor = kAPP_DEFAULT_PINK_COLOR
//        lblTitle.font = UIFont(name: kAPPFontBold, size: 18)
        lblTitle.sizeToFit()
        vc.navigationItem.titleView = lblTitle
    }
    

    
 
    // MARK: Validation Methods
    
    class func isValidFirstName(_ FirstName : String) -> Bool {
        let regex: String = "^[a-z0-9_-]{2,15}$"
        let userNameTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return userNameTest.evaluate(with: FirstName)
    }
    
    class func isValidLastName(_ LastName : String) -> Bool {
        let regex: String = "^[a-z0-9_-]{2,15}$"
        let userNameTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return userNameTest.evaluate(with: LastName)
    }
    
    class func isValidMobileNumber(_ number : String) -> Bool {
        
        let stripped = number.trimmingCharacters(in: .whitespacesAndNewlines)
        if (stripped.count ) < 5 || (stripped.count ) > 17 {
            return false
        }
        let Regex: String = "^([0-9]*)$"
        //NSString *phoneRegex = @"^((\\+)|(00))[0-9]{6,10}$";
        let mobileTest = NSPredicate(format: "SELF MATCHES %@", Regex)
        return mobileTest.evaluate(with: stripped)
    }
    
    class func isValidPassword(_ password : String) -> Bool {
    //    let regex: String = "^(?=.*[0-9])(?=.*[A-Za-z]).{6,20}$"
        let regex: String = "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z])(?!.*[ ])[A-Za-z0-9-!@?._]{6,20}$"
        let userNameTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return userNameTest.evaluate(with: password)
    }
    
    func isAlphaNumericName(_ name: String) -> Bool{
        let stripped = name.trimmingCharacters(in: .whitespacesAndNewlines)
        if (stripped.count ) < 5 || (stripped.count ) > 30 {
            return false
        }
        let Regex: String = "^(?=.*[a-z])(?=.*[0-9])[A-Za-z0-9-!$@#%^&*()_+|~=`{}:;'<>?,.]{6,}$"
        //NSString *phoneRegex = @"^((\\+)|(00))[0-9]{6,10}$";
        let mobileTest = NSPredicate(format: "SELF MATCHES %@", Regex)
        return mobileTest.evaluate(with: stripped)
        
    }
    
    class func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    
    class func isValidEmailId(_ email: String) -> Bool {
        //    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        //    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
        //
        //    return [emailTest evaluateWithObject:email];
//        let stricterFilter: Bool = false
        // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
//        let stricterFilterString: String = "[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}"
        let laxString: String = ".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*"
        let emailRegex: String =  laxString
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
    

        
  
      
}
