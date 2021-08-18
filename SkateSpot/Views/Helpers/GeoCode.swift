// reference:
//  https://dev.classmethod.jp/articles/geocoding-use-mapkit/

import Foundation
import MapKit

func GeoCode(adress: String) -> (CLLocationDegrees, CLLocationDegrees) {
    var latitude: CLLocationDegrees = 0
    var longtitude: CLLocationDegrees = 0
    
    CLGeocoder().geocodeAddressString(adress) { placemarks, error in
        if let lat = placemarks?.first?.location?.coordinate.latitude {
            latitude  = lat
        }
        if let lng = placemarks?.first?.location?.coordinate.longitude {
            longtitude = lng
        }
    }
    
    return (latitude, longtitude)
}

func ReverseGeoCode(latitude: CLLocationDegrees, longtitude: CLLocationDegrees) -> String {
    let location = CLLocation(latitude: latitude, longitude: longtitude)
    var placemark = ""
    
    CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
        placemark = (placemarks?.first!.description)!
    }
    return placemark
}
