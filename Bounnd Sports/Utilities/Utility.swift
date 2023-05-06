

import UIKit
import Reachability
import ProgressHUD
import CoreLocation
import UserNotifications
import MOLH
import StoreKit

class Utility: NSObject {
    
    enum dateFormat: String {
        case ddMMyyyyWithTimePretty = "dd-MM-yyyy HH:mm:ss"
        
        case ddMMyyyyWithTime = "yyyy-MM-dd'T'HH:mm:ss"
                   //          2023/03/15 8:00:00
        case ddMMyyyyHHmm = "yyyy/MM/dd HH:mm:ss"
        case yyyyMMddHHmm = "yyyy-MM-dd HH:mm"
        case yyyyMMddHHmmss = "yyyy-MM-dd HH:mm:ss"  // 2023-04-30 16:00:00
        case ddMMyyyyWithTimeZone = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        case ddMMyyyyTimeZone = "yyyy-MM-dd HH:mm:ss.SSSZ"   // 2023-05-05 17:50:00.000
        case ddMMMyyyy = "dd-MMM-yyyy"
        case ddMMyyyy = "dd-MM-yyyy"
        case yyyyMMdd = "yyyy-MM-dd"
        case dd = "dd"
        case MMM = "MMM"
        case hhmma = "hh:mm a"
        case yyyy = "yyyy"
        case eeee = "EEEE"
        case eee = "EEE"
        case hhmm = "H.mm"
        case hhmm2 = "HH:mm"
        case hhmmxm = "HH:MM XM"
        case eddmmm = "E, d MMM"
        case edmmmHHmm = "E, d MMM HH:mm"
        case ddsmmmsyyyy = "dd MMM yyyy"
    }
    
    class func returnIndicatorForFollowing(key:String,list:[Indicators]) -> Indicators?{
        for indicator in list{
            if indicator.key == key
            {
               
                return indicator
            }
        }
        return nil
            
        
    }
    
    class func getSettingsDateDiff() -> Int{
            let launchDate = AppPreferences.getLaunchDate()
            if launchDate.count > 0{
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = Utility.dateFormat.ddMMyyyy.rawValue
                let dt1 = dateFormatter.date(from: launchDate) ?? Date()
               return Calendar.current.dateComponents([.day], from: dt1, to: Date()).day ?? 0
            }
            return 0
        }
  
    
    class func getPlaceHolder()-> UIImage?
    {
        return UIImage.init(named: "Goal")
    }
    
    class func getDeviceWidth()-> CGFloat
    {
        return getDeviceSize().width
    }
    
    class func getDeviceHeight()-> CGFloat
    {
        return getDeviceSize().height
    }
    
    class func getDeviceSize()-> CGSize
    {
        return UIScreen.main.bounds.size
    }
    
    class func setCustomNavBar(navBar: UINavigationBar, navigationItem : UINavigationItem,tintColor : UIColor, backgroundColor : UIColor){
        let yourBackImage = UIImage(named: "back")?.withTintColor(.white)
        let appearance = UINavigationBarAppearance()
        appearance.setBackIndicatorImage(yourBackImage, transitionMaskImage: yourBackImage)
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = backgroundColor
        appearance.titleTextAttributes = [.foregroundColor: tintColor]
        appearance.shadowColor = backgroundColor
        navBar.tintColor = tintColor
        navBar.backgroundColor = .clear
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
    }
    
    class func setWhiteNavBar(navigationController : UINavigationController){
        let yourBackImage = UIImage(named: "back")?.withTintColor(.black)
        navigationController.removeBottomLine()
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.setBackIndicatorImage(yourBackImage, transitionMaskImage: yourBackImage)
        navBarAppearance.shadowImage = UIImage()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navBarAppearance.backgroundColor = .white
        navBarAppearance.shadowImage = UIImage()
        navBarAppearance.shadowColor = .clear
        navigationController.navigationBar.tintColor = .black
        navigationController.navigationBar.standardAppearance = navBarAppearance
        navigationController.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.layoutIfNeeded()
    }
    
    class func formatDate(date: Date?, with outputFormat: dateFormat)-> String
    {
        if date == nil
        {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = outputFormat.rawValue
        dateFormatter.locale = Locale(identifier: "en")
        return dateFormatter.string(from: date!)
    }
    
    
    class func changeNameOfDay(name_of_day:String)-> String
    {
        var name_of_day_after_change:String = "nil"
        
        switch name_of_day {
                case "Sat" :
                    name_of_day_after_change = "Sa"
                case "Sun" :
                    name_of_day_after_change = "Su"
                case "Mon" :
                    name_of_day_after_change = "M"
                case "Tue" :
                    name_of_day_after_change = "Tu"
                case "Wed" :
                    name_of_day_after_change = "W"
                case "Thu" :
                    name_of_day_after_change = "Tu"
                case "Fri" :
                    name_of_day_after_change = "F"
                default:
                    name_of_day_after_change = "S"
                }
        
        return name_of_day_after_change
    }
    
   
    
    class func timeStampToDateString(timeStamp: Double, with outputFormat: dateFormat)-> String
    {
        let date = Date(timeIntervalSince1970: timeStamp/1000)
       
        return formatDate(date: date, with: outputFormat)
    }
    
    class func timeStampToRelativeTime(timeStamp: Double) -> String{
        
        let date = Date(timeIntervalSince1970: timeStamp/1000)

        // ask for the full relative date
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full

        // get exampleDate relative to the current date
        var relativeDate = formatter.localizedString(for: date, relativeTo: Date())

        // print it out
        print("Relative date is: \(relativeDate)")
        if relativeDate == "in 0 seconds"{
            relativeDate = "Just now"
        }
        return relativeDate
    }
    
    class func getCurrentTimeStamp()-> String
    {
        return "\(Int(Date().timeIntervalSince1970 * 1000))"
    }
    
    class func isNetworkConnected() -> Bool
    {
        let reachability = try! Reachability()
        return reachability.connection != .unavailable
    }
    
    class func showSuccessSnackView(message: String, iconName: String)
    {
        SnackView().showSuccessSnackView(withMessage: message, iconName: iconName)
    }
    
    class func showSuccessSnackViewWithCompletion(message: String, iconName: String,callback:@escaping(()->Void))
    {
        SnackView().showSuccessSnackViewWithCompletion(withMessage: message, iconName: iconName, dissmiss: callback)
    }
    
    class func showErrorSnackView(message: String)
    {
        SnackView().showErrorSnackView(withMessage: message)
    }
    
    class func showProgress() {
        DispatchQueue.main.async {
            ProgressHUD.colorBackground = UIColor.black.withAlphaComponent(0.2)
            ProgressHUD.colorHUD = Colors.accentColor()
            ProgressHUD.colorHUD = .systemGray
            ProgressHUD.colorAnimation = UIColor(named: "GrayTextColor")!
            ProgressHUD.show("Loading...", interaction: false)
        }
    }
    
    class func showProgress(progress: Float) {
        DispatchQueue.main.async {
            ProgressHUD.colorBackground = UIColor.black.withAlphaComponent(0.2)
            ProgressHUD.colorHUD = Colors.accentColor()
            ProgressHUD.colorAnimation = Colors.accentColor()
            ProgressHUD.colorProgress = Colors.accentColor()
            ProgressHUD.showProgress(CGFloat(progress), interaction: false)
        }
    }
    
    class func dismissProgress() {
        DispatchQueue.main.async {
            ProgressHUD.dismiss()
        }
    }
    
//    class func isUserLoggedIn()-> Bool
//    {
//        return AppPreferences.getToken() != ""
//    }
    
    class func gotoSettings()
    {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                print("Settings opened: \(success)")
            })
        }
    }
    
    class func openUrl(url: URL)
    {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, completionHandler: { (success) in
                print("Settings opened: \(success)")
            })
        }
    }
    

   
    
    
    class func formatPrice(price: Float?, currency: String?)-> String
    {
        return String(format: "%.2f \(currency ?? "AED")", price ?? 0)
    }
    
    class func formatPrice(price: Float?)-> String
    {
        return String(format: "%.2f", price ?? 0)
    }
    
    class func getJson(obj:Any)->String{
            let jsonData = try! JSONSerialization.data(withJSONObject: obj)
        let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)
                            print(jsonString ?? "")
            return String(jsonString ?? "")
    }
    
   
    
    class func getFormattedDateTime(dateTime : String) -> String{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"

        if let date = dateFormatterGet.date(from: dateTime) {
            return dateFormatterPrint.string(from: date)
            print(dateFormatterPrint.string(from: date))
        } else {
            return ""
           print("There was an error decoding the string")
        }
    }
    
    class func getCurrentLang() -> String
    {
        var lang = MOLHLanguage.currentAppleLanguage()
        if lang == "zh"{
            lang = "cn"
        }
       
        return lang
    }
    
    class func getSystemTimeZoneTime(dateString:String)->Date{
       let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
       guard let date = dateFormatter.date(from: dateString) else{return Date()}
            let source_timezone = NSTimeZone(abbreviation: "GMT+08")
       let local_timezone = NSTimeZone.system
       let source_EDT_offset = source_timezone?.secondsFromGMT(for: date)
            let destination_EDT_offset = local_timezone.secondsFromGMT(for: date)
       let time_interval : TimeInterval = Double(destination_EDT_offset - source_EDT_offset!)
       let convertedDate = NSDate(timeInterval: time_interval, since: date)
        return convertedDate as Date
    }
    
    class func secondsToHoursMinutesSeconds(_ seconds: Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    class func scheduleLocalNotification(date:Date,subTitle:String,body:String,success:(()->Void)?,failed:(()->Void)?) {
        // Create Notification Content
        let notificationContent = UNMutableNotificationContent()

        // Configure Notification Content
        notificationContent.title = "Reminder"
        notificationContent.subtitle = subTitle
        notificationContent.body = body

        // Add Trigger
        //let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 10.0, repeats: false)
        
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.year,.day,.month,.hour,.minute,.second], from: date)
        print(components)
        //components.year = 2022
        let trg2 = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)

        // Create Notification Request
        let notificationRequest = UNNotificationRequest(identifier: UUID().uuidString, content: notificationContent, trigger: trg2)

        // Add Request to User Notification Center
        UNUserNotificationCenter.current().add(notificationRequest) { (error) in
            if let error = error {
                print("Unable to Add Notification Request (\(error), \(error.localizedDescription))")
                failed?()
            }
            success?()
        }
    }
    
    
    class func scheduleLocalNotificationNow(time:Double,title:String,subTitle:String,body:String,data:[String:Any],repeats:Bool) {
        // Create Notification Content
        let notificationContent = UNMutableNotificationContent()

        // Configure Notification Content
        notificationContent.title = title
        notificationContent.subtitle = subTitle
        notificationContent.body = body
        notificationContent.userInfo = data

        // Add Trigger
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: repeats)
       
        // Create Notification Request
        let notificationRequest = UNNotificationRequest(identifier: UUID().uuidString, content: notificationContent, trigger: notificationTrigger)

        // Add Request to User Notification Center
        UNUserNotificationCenter.current().add(notificationRequest) { (error) in
            if let error = error {
                print("Unable to Add Notification Request (\(error), \(error.localizedDescription))")
//                DispatchQueue.main.async {
//                Utility.showErrorSnackView(message: "Unable to Add Reminder")
//                }
            }
            print("Notificatoion set")
//            DispatchQueue.main.async {
//                Utility.showSuccessSnackView(message: "Reminder saved successfully", iconName: "")
//
//            }
            
        }
    }
    
   class func checkPendings(){
        let calendar = Calendar(identifier: .gregorian)
        UNUserNotificationCenter.current().getPendingNotificationRequests(){ requests in
            for request in requests {
                guard let trigger = request.trigger as? UNCalendarNotificationTrigger else {return}
                if let dt = trigger.nextTriggerDate(){
                print(calendar.dateComponents([.year,.day,.month,.hour,.minute,.second], from: dt))
                }
            }
        }
   }
    
    class func gotoHome(){
        let homeNav = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeTab")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = homeNav
    }
    
    class func shareAction(text:String?,url:NSURL?,image:UIImage?,vc:UIViewController){
        
        var items = [Any]()
        if text != nil{
            items.append(text!)
        }
        if url != nil{
            items.append(url!)
        }
        if image != nil{
            items.append(image!)
        }
        
           let activityViewController : UIActivityViewController = UIActivityViewController(
               activityItems: items, applicationActivities: nil)
           
          
           
           // Pre-configuring activity items
           activityViewController.activityItemsConfiguration = [
           UIActivity.ActivityType.message
           ] as? UIActivityItemsConfigurationReading
           
           // Anything you want to exclude
           activityViewController.excludedActivityTypes = [
               UIActivity.ActivityType.postToWeibo,
               UIActivity.ActivityType.print,
               UIActivity.ActivityType.assignToContact,
               UIActivity.ActivityType.saveToCameraRoll,
               UIActivity.ActivityType.addToReadingList,
               UIActivity.ActivityType.postToFlickr,
               UIActivity.ActivityType.postToVimeo,
               UIActivity.ActivityType.postToTencentWeibo,
               UIActivity.ActivityType.postToFacebook
           ]
           
           activityViewController.isModalInPresentation = true
           vc.present(activityViewController, animated: true, completion: nil)
    }
    
   class func rateApp(id : String) {
        guard let url = URL(string : "itms-apps://itunes.apple.com/app/id\(id)?mt=8&action=write-review") else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    class func callURlDetailsAPI(){
//        HomeAPI().getUrlInfo { response in
//            HomeViewController.urlDetails = response
//            let appDelegate = UIApplication.shared.delegate as? AppDelegate
//            if let tabVC = appDelegate?.window?.rootViewController as? UITabBarController{
//                let homeNav =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ScoresNav")
//
//                if HomeViewController.urlDetails?.map?.count ?? 0 > 0{
//
//                    let newsNav =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewsNav")
//                    tabVC.viewControllers = [homeNav,newsNav]
//                }
//                else{
//                    tabVC.viewControllers = [homeNav]
//                }
//            }
            
          //  HomeViewController.showPopup()
//        } failed: { _ in
//
//        }
        
        HomeAPI().getUrlInfo { response in
            DispatchQueue.main.async {
     //       HomeViewController.urlDetails = response
        //  HomeViewController.showPopup()
            }
        } failed: { _ in
        }

    }
    
   class func getPhoneLanguage() -> String{
        var locale = NSLocale.current.languageCode!
        let countryCode = (Locale.current as NSLocale).object(forKey: .countryCode) as? String ?? ""
        if countryCode == "CN"{
            locale = "zh"
        }
        return locale
                
    }

    
    class func getStatus(state:Int)->String{
            var value = ""
            switch state{
            case 0:
                value = "SOON".localized
            case 1:
                value = "FH"
            case 2:
                value = "HT"
            case 3:
                value = "SH"
            case 4:
                value = "OT"
            case 5:
                value = "PT"
            case -1:
                value = "FT"
            case -10:
                value = "C"
            case -11:
                value = "TBD"
            case -12:
                value = "CIH"
            case -13:
                value = "INT"
            case -14:
                value = "DEL"
                
            default:
                break
            }
            return value
        }
    
    
    
    static func timeInMins(startDate: String) -> Double{
        if(startDate == ""){
            return 0.0
        }
        else{
            let date = Date().localDate()
            
            let dateFormatter = DateFormatter()
            let dateFormatter1 = DateFormatter()
            
            dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
            dateFormatter1.dateFormat = "yyyy-MM-dd HH:mm:ss"
            
            // let CDate = dateFormatter1.date(from: date)!
            let SDate = dateFormatter.date(from: startDate)!
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
            let timeInterval = date.timeIntervalSince(SDate)
            var hours = timeInterval / 3600
            // print("Hours: \(hours)")
            let hoursDouble = Double(hours)
            hours = hoursDouble.round(to:2)
            
            // return hours
            // print("HoursAfter: \(hours)")
            var minutes = hours * 60//(timeInterval - hours * 3600) / 60
            minutes = minutes.round(to: 0)
            
            return minutes
        }
    }
    
    
}
