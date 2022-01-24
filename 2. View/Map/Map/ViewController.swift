//
//  ViewController.swift
//  Map
//
//  Created by 탁제원 on 2022/01/24.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var locationInfoLabel1: UILabel!
    @IBOutlet weak var locationInfoLabel2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationInfoLabel1.text = ""
        locationInfoLabel2.text = ""
        
        locationManager.delegate = self
        
        //정확도를 최고로 설정
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        //위치 데이터 추적을 위해 사용자에게 승인을 요구
        locationManager.requestWhenInUseAuthorization()
        
        //위치 업데이트 시작
        locationManager.startUpdatingLocation()
        
        //위치보기 값 true
        myMap.showsUserLocation = true
    }
    
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D {
        //위도 경도값을 매개변수로 CLLocationCoordinate2DMake 함수 호출
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        
        //범위 값을 매개변수로 MKCoordinateSpan 함수 호출
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        
        return pLocation
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //위치가 업데이트 되면 먼저 마지막 위치 값을 찾아냅니다.
        let pLocation = locations.last
        
        //마지막 위치로 goLocation 함수 불러냄
        //delta값이 작을수록 확대되는 효과
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            
            let pm = placemarks!.first
            let country = pm!.country
            
            var address:String = country!
            
            //지역값
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            
            //도로값
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.locationInfoLabel1.text = "현재 위치"
            self.locationInfoLabel2.text = address
        })
        
        //업데이트 멈춤
        locationManager.stopUpdatingLocation()
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double, title strTitle: String, subtitle strSubtitle: String){
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }

    @IBAction func changeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.locationInfoLabel1.text = ""
            self.locationInfoLabel2.text = ""
            locationManager.startUpdatingLocation()
            
        } else if sender.selectedSegmentIndex == 1 {
            setAnnotation(latitudeValue: 37.52452795023943, longitudeValue: 126.96419775608905, delta: 0.01, title: "HYBE 본사", subtitle: "서울특별시 용산구 한강로3가 한강대로 42")
            self.locationInfoLabel1.text = "보고 계신 위치"
            self.locationInfoLabel2.text = "HYBE 본사"
        } else if sender.selectedSegmentIndex == 2 {
            
            setAnnotation(latitudeValue: 35.02703452768462, longitudeValue: 135.7771051380998, delta: 0.01, title: "Marikouji", subtitle: "일본 〒606-8301 Kyoto, Sakyo Ward, Yoshidaizumidonocho, 6-2 京都工芸繊維大学国際交流会館まりこうじ会館")
            self.locationInfoLabel1.text = "보고 계신 위치"
            self.locationInfoLabel2.text = "京都工芸繊維大学国際交流会館まりこうじ会館"
        }
    }
    
}

