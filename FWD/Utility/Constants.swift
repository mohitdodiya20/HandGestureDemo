//
//  Utility.swift
import UIKit

struct Constants {
    static func  setLabelImage(text : String , bgColor: UIColor ) -> UIImage  {
        let lblNameInitialize = UILabel()
        lblNameInitialize.frame.size = CGSize(width: 70.0, height: 70.0)
        lblNameInitialize.font = UIFont(name:"ProximaNova-Semibold", size:25)
        lblNameInitialize.textColor = UIColor.white
        lblNameInitialize.textAlignment = NSTextAlignment.center
        lblNameInitialize.text = text
        lblNameInitialize.backgroundColor  = bgColor
        lblNameInitialize.layer.cornerRadius = 35.0
        UIGraphicsBeginImageContext(lblNameInitialize.frame.size)
        lblNameInitialize.layer.render(in: UIGraphicsGetCurrentContext()!)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result!
    }
    static let AppObj = UIApplication.shared.delegate as! AppDelegate
    
    static func getFullNameString(firstName : String , lastName : String) -> String {
        var fullName = ""
        if lastName == ""{
            fullName = String(firstName.prefix(2)).uppercased()
        }else{
            
            fullName =   String(firstName.first!).uppercased() + String(lastName.first!).uppercased()
        }
        
        return fullName
    }
    
    //MARK:- GetRandom colors
    static   func generateRandomColor() -> UIColor {
        let redValue = CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        let blueValue = CGFloat(drand48())
        
        let randomColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        
        return randomColor
    }
    static func UIColorFromHex(_ rgbValue: UInt) -> UIColor
    {
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1)
        )
    }
    
    static func  hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
    //MARK: - device type
    enum UIUserInterfaceIdiom : Int{
        case Unspecified
        case Phone
        case Pad
    }
    
    struct ScreenSize {
        static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
        static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
        static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    }
    
    struct DeviceType
    {
        static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
        static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
        static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
        static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
        static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    }
    
    // MARK: - Global Utility
    struct GlobalConstants {
        static let appName    = Bundle.main.infoDictionary!["CFBundleName"] as! String
        static let iPhoneStoryboard = UIStoryboard(name: "Main", bundle: nil)
        static let appDelegate = UIApplication.shared.delegate as! AppDelegate
        static let googleMapsKey = "AIzaSyB--GrtgEZBjjAk9eIt_iuXA0457OeZZTk"//"AIzaSyByq48jGOKEB8i5WMXBOsTVI2EDs7NQf4k"
    }
    
    struct UserDefaults{
        static let subscription_flag = "subscription_flag"
        static let user_id = "user_id"
        static let deviceID = "deviceID"
        static let token = "user_token"
        static let email = "email"
        static let name = "name"
        static let exptime = "exptime"
        static let devicetoken = "devicetoken"
        static let UserInfoDict = "UserInfoDict"
        static let IsLogin = "IsLogin"
        static let IsForSkipUser = "IsForSkipUser"
        static let openScanner = "openScanner"
        static let orderID = "orderID"
        static let scanID = "scanID"
        static let qr_id = "qr_id"
        static let restaurant_id = "restaurant_id"
        
        static let total_amountForNotification = "total_amount"
        static let typeForNotification = "type"
        static let order_idForNotification = "order_id"
        static let notificationIsComing = "notificationIsComing"
        static let play_flag = "pay_flag"
        
        static let TutorialScreen = "TutorialScreen"
        static let order_status = "order_status"
        static let verify_flag = "verify_flag"
        static var socialFlag =  "socialFlag"
        static var online_payment_flag = "online_payment_flag"
        static var previous_order_place_flag = "previous_order_place_flag"
        
    }
    
    struct WebServiceUrl {
        
        //Local URL
        static let mainURL = "https://qwikdine.io/backpanel/apiv2/"
        static let mainURLv2 = "https://qwikdine.io/backpanel/apiv2/"
        
        
        //       https://qwikdine.io/backpanel/table_booking/Auth/initPayment/
        
        //     "http://52.66.190.14/table_booking/apiv2/"
        //       http://52.66.190.14/table_booking/Auth/initPayment/
        
        static let changepassword    =  "User/changepassword"
        static let applyCoupon    =  "Restaurant/applyCoupon"
        static let discartCart = "Restaurant/discartCart"
        static let contactus    =  "User/contactus"
        static let resetpassword = "User/resetpassword"
        static let forgotpassword    =  "User/foregotpassword"
        static let register = "User/signup"
        static let check_email = "User/checkmail"
        static let login = "User/login"
        static let scanQRCode = "Restaurant/scanQRCode"
        static let updateProfilePicture = "User/updateProfilePicture"
        static let addCart = "Restaurant/addCart"
        static let getCart = "Restaurant/getCart"
        static let orderplace = "Restaurant/orderplace"
        static let updateCartQty = "Restaurant/updateCartQty"
        static let deleteItem = "Restaurant/deleteItem"
        static let CheckUserCart = "Restaurant/CheckUserCart"
        static let orderDetail = "Restaurant/orderDetail"
        static let orderHistory = "Restaurant/orderHistory"
        static let restaurantCoupon = "Restaurant/restaurantCoupon"
        static let makeFullPayment = "Restaurant/makeFullPayment"
        static let logout = "User/logout"
        static let getsociallogin =  "User/getsociallogin"
        static let finishOrder = "Restaurant/finishOrder"
        static let saveOrderTipAndDiscount = "Restaurant/saveOrderTipAndDiscount"
        static let SelectUserForPayment = "Restaurant/SelectUserForPayment"
        static let makeSplitpayment = "Restaurant/makeSplitpayment"
        static let processToPayment = "Restaurant/processToPayment"
        static let restaurantDetail = "Restaurant/restaurantDetail"
        static let countryList = "User/countryList"
        static let paymentDetail = "Restaurant/paymentDetail"
        static let  verifyPhone = "User/verifyPhone"
        static let  initPayment = "Auth/initPayment"
        static let editProfile = "User/editProfile"
        static let updateProfile = "User/updateProfile"
        
        
        
        
    }
    
    // MARK: - StoryBoard Identifier's
    struct StoryBoardID{
        static let kLoginVC = "LoginVC"
        static let kHomeTabbar = "HomeTabbar"
        static let kContactUsScreenVC = "ContactUsScreenVC"
        static let kAboutUsScreenVC = "AboutUsScreenVC"
    }
    
    // MARK: - Message's
    struct AlertMessage {
        static let EmptyFirstName = "First Name is required"
        static let EmptyEmail = "Email is required"
        static let EmptyLastName = "Last Name is required"
        public static let enterconform = "Password and Retype password does not match."
        public static let enterRepass = "Please Retype Password."
        public static let selectCountry = "Please select country"
        
        public static let Phonenumber = "Please add Phonenumber"
        
        
        
        static let NetworkConnection  = "You are not connected to internet. Please connect and try again"
        static let DealsSaved  = "Deals saved successfully!"
        //Login And Registration Alert message's
        
        static let InValidFirstName = "Enter valid first name"
        static let InvalidFirstNameRange = "Please enter first name between 2 to 20 characters!"
        static let InValidLastName = "Enter valid last name"
        static let InvalidLastNameRange = "Please enter last name between 2 to 20 characters!"
        static let InValidEmail = "Enter valid email id"
        static let EmptyPassword = "Password is required"
        static let NewPassword = "New Password is required"
        static let InvalidPassword = "Enter valid password"
        static let InvalidPasswordRange = "Please enter password between 6 To 15 characters!"
        static let EmptyConfirmPassword = "Confirm password is required"
        static let SamePassword = "Enter same password"
        //FeedBack Alert message's
        static let heartRate = "Heart rate is required"
        static let BodyTemp = "Body temp is required"
        static let InvalidHeartRate = "Enter valid heart rate"
        static let InvalidHeartRateRange = "Please enter heart rate between 10 To 300"
        static let InvalidBodyTemp = "Enter valid body temp"
        static let InvalidBodyTempRange = "Please enter body temp between 90 To 110"
        //Contact Us Alert message's
        static let EmptyName = "Name is required"
        static let InValidName = "Enter valid name"
        static let InvalidNameRange = "Please enter name between 2 To 40 characters!"
        static let EmptyPhoneNumber = "Phone number is required"
        static let InvalidPhoneNumber = "Enter valid phone number"
        static let EmptyComment = "Comment is required"
        static let InvalidCommentRange = "Please enter comment minimum 20 characters!"
        
        
        
    }
    // MARK: - ApiConstants
    
    struct ApiConstants {
      
        static let online_payment_flag = "online_payment_flag"
        static let user_discount_amt = "user_discount_amt"
        static let user_order_amount = "user_order_amount"
        static let phone = "phone"
        static let country = "country"
        static let country_code = "country_code"
        static let country_id = "country_id"
        static let country_name = "country_name"
        static let iso = "iso"
        static let final_amount = "final_amount"
        static let tip = "tip"
        static let image = "image"
        static let order_status = "order_status"
        static let total_user = "total_user"
        static let coupon_id = "coupon_id"
        static let coupon = "coupon"
        static let discount_amount = "discount_amount"
        static let tip_amount = "tip_amount"
        static let total_amount = "total_amount"
        static let sub_total = "sub_total"
        static let main_user_id = "main_user_id"
        static let split_flag = "split_flag"
        static let order_detail = "order_detail"
        static let total_item = "total_item"
        static let  menu_name = "menu_name"
        static let total = "total"
        static let display_total = "display_total"
        static let user = "user"
        static let order_id = "order_id"
        static let restaurant_id = "restaurant_id"
        static let qr_id = "qr_id"
        static let menu_id = "menu_id"
        static let qty = "qty"
        static let food_group = "food_group"
        static let previous_order_place_flag = "previous_order_place_flag"
        
        static let category_id = "category_id"
        static let menu = "menu"
        static let qrcode_value = "qrcode_value"
        static let device_token = "device_token"
        static let device_type = "device_type"
        static let device_id = "device_id"
        static let logo_image = "logo_image"
        static let category = "category"
        
        static let first_name = "first_name"
        
        
        static let food_subcategory = "food_subcategory"
        static let gender = "gender"
        static let data = "data"
        static let name = "name"
        static let social_id = "social_id"
        static let fullname = "fullname"
        static let last_name = "last_name"
        static let   social_email = "social_email"
        static let email = "email"
        static let mobile = "mobile"
        static let social_flag = "social_flag"
        static let password = "password"
        static let confirm_password = "confirm_password"
        
        static let token = "token"
        static let id = "id"
        
        
        static let language_id = "language_id"
        static let user_token = "user_token"
        static let user_id = "user_id"
        
        static let payment_type = "payment_type"
        static let order_amount = "order_amount"
        static let coupon_code = "coupon_code"
        
        
        static let oldpassword = "oldpassword"
        
        
        static let newpassword = "newpassword"
        static let instruction = "instruction"
        
        static let subject = "subject"
        
        static let message = "message"
        static let start = "start"
    }
    
    
}



extension UIView {
    
    func addDashedBorder() {
        //Create a CAShapeLayer
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9647058824, alpha: 1)
        shapeLayer.lineWidth = 2
        shapeLayer.lineDashPattern = [2,3]
        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: 0, y: 0),
                                CGPoint(x: self.frame.width, y: 0)])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
    
    
    
    
    func layerGradient() {
        let layer : CAGradientLayer = CAGradientLayer()
        layer.frame.size = self.frame.size
        layer.frame.origin = CGPoint(x: 0, y: 0)
        // layer.cornerRadius = CGFloat(frame.width / 20)
        
        let color0 = UIColor(red:250.0/255, green:250.0/255, blue:250.0/255, alpha:0.5).cgColor
        let color1 = UIColor(red:200.0/255, green:200.0/255, blue: 200.0/255, alpha:0.1).cgColor
        let color2 = UIColor(red:150.0/255, green:150.0/255, blue: 150.0/255, alpha:0.1).cgColor
        let color3 = UIColor(red:100.0/255, green:100.0/255, blue: 100.0/255, alpha:0.1).cgColor
        let color4 = UIColor(red:50.0/255, green:50.0/255, blue:50.0/255, alpha:0.1).cgColor
        let color5 = UIColor(red:0.0/255, green:0.0/255, blue:0.0/255, alpha:0.1).cgColor
        let color6 = UIColor(red:150.0/255, green:150.0/255, blue:150.0/255, alpha:0.1).cgColor
        
        layer.colors = [color0,color1,color2,color3,color4,color5,color6]
        self.layer.insertSublayer(layer, at: 0)
    }
}

extension UIView {
    
    enum AnimationKeyPath: String {
        case opacity = "opacity"
    }
    
    func flash(animation: AnimationKeyPath ,withDuration duration: TimeInterval = 0.5, repeatCount: Float = 1){
        let flash = CABasicAnimation(keyPath: AnimationKeyPath.opacity.rawValue)
        flash.duration = duration
        flash.fromValue = 1 // alpha
        flash.toValue = 0 // alpha
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = repeatCount
        
        layer.add(flash, forKey: nil)
    }
}

public extension UIDevice {
    
    /// pares the deveice name as the standard name
    var modelName: String {
        
        #if targetEnvironment(simulator)
        let identifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"]!
        #else
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8 , value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        #endif
        
        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
        case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
        case "iPhone10,3", "iPhone10,6":                return "iPhone X"
        case "iPhone11,2":                              return "iPhone XS"
        case "iPhone11,4", "iPhone11,6":                return "iPhone XS Max"
        case "iPhone11,8":                              return "iPhone XR"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad6,11", "iPad6,12":                    return "iPad 5"
        case "iPad7,5", "iPad7,6":                      return "iPad 6"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,3", "iPad6,4":                      return "iPad Pro 9.7 Inch"
        case "iPad6,7", "iPad6,8":                      return "iPad Pro 12.9 Inch"
        case "iPad7,1", "iPad7,2":                      return "iPad Pro (12.9-inch) (2nd generation)"
        case "iPad7,3", "iPad7,4":                      return "iPad Pro (10.5-inch)"
        case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":return "iPad Pro (11-inch)"
        case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":return "iPad Pro (12.9-inch) (3rd generation)"
        case "AppleTV5,3":                              return "Apple TV"
        case "AppleTV6,2":                              return "Apple TV 4K"
        case "AudioAccessory1,1":                       return "HomePod"
        default:                                        return identifier
        }
    }
    
}
class DateHeaderLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        textColor = .white
        textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false // enables auto layout
        font = UIFont.boldSystemFont(ofSize: 14)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        let originalContentSize = super.intrinsicContentSize
        let height = originalContentSize.height + 12
        layer.cornerRadius = height / 2
        layer.masksToBounds = true
        return CGSize(width: originalContentSize.width + 20, height: height)
    }
    
}
