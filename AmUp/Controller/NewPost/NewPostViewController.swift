//
//  NewPostViewController.swift
//  AmUp
//
//  Created by 𝐻𝑜𝑠𝑒𝑖𝑛 𝑅𝑒𝑧𝑎𝑧𝑎𝑑𝑒ℎ  on 5/12/21.
//

import UIKit
import GoogleMaps

class NewPostViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    var mapView: GMSMapView!
    var marker = GMSMarker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GMSServices.provideAPIKey("AIzaSyDdchM7apzEter6yaWfyQG-dF6AORh34MA")
        let camera = GMSCameraPosition.camera(withLatitude: 33.2, longitude: 33.2, zoom: 6.0)
        mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        mapView.delegate = self
        self.view.addSubview(mapView)
        lblNavBar("New Post")
        
    }
    
    func setbuttonItem() {
        let button1 = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(self.action))
        button1.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "FONTSPRINGDEMO-BlueVinylRegular", size: 20.0)!], for: .normal)
        self.navigationItem.rightBarButtonItem  = button1
    }
    
    //action next button
    @objc func action() {
        let vc = UIStoryboard.init(name: "singelViewSt", bundle: Bundle.main).instantiateViewController(withIdentifier: "detailsNewPostViewController") as? detailsNewPostViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
//MARK:-mapView Delegate (GoogleMap)
extension NewPostViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        print(coordinate)
        marker.position = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        marker.title = "Hosein Rezazadeh"
        marker.snippet = "sube Titel"
        marker.map = mapView
        setbuttonItem()
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        self.navigationItem.rightBarButtonItem?.isEnabled = true
    }
}
