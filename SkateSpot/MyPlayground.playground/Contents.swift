import CoreLocation

let geocoder = CLGeocoder()
// 千葉駅
let location = CLLocation(latitude: CLLocationDegrees(35.563122), longitude: CLLocationDegrees(139.714779))
    geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
    if let placemarks = placemarks {
        if let pm = placemarks.first {
            print("name: \(pm.name ?? "")")
            print("country: \(pm.country ?? "")")
            print("administrativeArea: \(pm.administrativeArea ?? "")")
            print("locality: \(pm.locality ?? "")")
            print("subLocality: \(pm.subLocality ?? "")")
            print("thoroughfare: \(pm.thoroughfare ?? "")")
            print("subThoroughfare: \(pm.subThoroughfare ?? "")")
            if let region = pm.region {
                print("region: \(region)")
            }
            if let timeZone = pm.timeZone {
                print("timeZone: \(timeZone)")
            }
            print("inlandWater: \(pm.inlandWater ?? "")")
            print("ocean: \(pm.ocean ?? "")")
            if let areasOfInterest = pm.areasOfInterest {
                print("areasOfInterest: \(areasOfInterest)")
            }
        }
    }
}
