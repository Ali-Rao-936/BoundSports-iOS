
import UIKit

class BaseUrl{
    public static let environment = Environment.Production
    public static let imgBaseURL = "https://Img.tysondata.com"
    
    private static let testBaseUrl = "http://199.241.1.88/ffapi/"
    private static let stagingBaseUrl = "http://199.241.1.88/ffapi/"
    private static let productionBaseUrl = "http://199.241.1.88/ffapi/"
    
    private static let testBaseUrl775 = "https://www.77577.live/api/"
    private static let stagingBaseUrl775 = "https://www.77577.live/api/"
    private static let productionBaseUrl775 = "https://www.77577.live/api/"
    
    private static let testBaseUrl775tj = "https://tj.77577.com/"
    private static let stagingBaseUrl775tj = "https://tj.77577.com/"
    private static let productionBaseUrl775tj = "https://tj.77577.com/"
    
    private static let testBaseUrlZEYU = "http://107.151.150.20:9092/v1/"
    private static let stagingBaseUrlZEYU = "http://107.151.150.20:9092/v1/"
    private static let productionBaseUrlZEYU = "http://107.151.150.20:9092/v1/"
    
    private static let testBaseUrlDB = "https://app.8com.cloud/api/v1/sportscore/data/"
    private static let stagingBaseUrlDB = "https://app.8com.cloud/api/v1/sportscore/data/"
    private static let productionBaseUrlDB = "https://app.8com.cloud/api/v1/sportscore/data/"
        
    private static let testBaseUrlBBS = "https://bbs.77577.live/api/v1/"
    private static let stagingBaseUrlBBS = "https://bbs.77577.live/api/v1/"
    private static let productionBaseUrlBBS = "https://bbs.77577.live/api/v1/"
    
    private static let testBaseUrlProduct = "https://xn--8868-3m6f282x.com/"
    private static let stagingBaseUrlProduct = "https://xn--8868-3m6f282x.com/"
    private static let productionBaseUrlProduct = "https://xn--8868-3m6f282x.com/"
    
    class func getBaseUrl(apiType:ApiType) -> String
    {
        switch apiType{
        case .API775:
            switch environment {
                case .Test:
                    return testBaseUrl775
                case .Staging:
                    return stagingBaseUrl775
                case .Production:
                    return productionBaseUrl775
            }
        
        case .APIDB:
            switch environment {
            case .Test:
                return testBaseUrlDB
            case .Staging:
                return stagingBaseUrlDB
            case .Production:
                return productionBaseUrlDB
            }
            
           
            
        case .OTHER:
            switch environment {
                case .Test:
                    return testBaseUrl
                case .Staging:
                    return stagingBaseUrl
                case .Production:
                    return productionBaseUrl
            }
        
        case .API775TJ:
            switch environment {
                case .Test:
                    return productionBaseUrl775tj
                case .Staging:
                    return productionBaseUrl775tj
                case .Production:
                    return productionBaseUrl775tj
            }
        case .API775BBS:
            switch environment {
                case .Test:
                    return testBaseUrlBBS
                case .Staging:
                    return stagingBaseUrlBBS
                case .Production:
                    return productionBaseUrlBBS
            }
        case .APIPRODUCTS:
            switch environment {
                case .Test:
                    return testBaseUrlProduct
                case .Staging:
                    return stagingBaseUrlProduct
                case .Production:
                    return productionBaseUrlProduct
            }
        case .APIZEYU:
            switch environment {
                case .Test:
                    return testBaseUrlZEYU
                case .Staging:
                    return stagingBaseUrlZEYU
                case .Production:
                    return productionBaseUrlZEYU
            }
        }
       
    }
}


enum ApiType{
    case API775,APIDB,OTHER,API775TJ,API775BBS,APIPRODUCTS,APIZEYU
}
