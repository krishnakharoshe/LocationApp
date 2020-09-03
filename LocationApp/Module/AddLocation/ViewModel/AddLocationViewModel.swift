//
//  AddLocationViewModel.swift
//  LocationApp
//
//  Created by krishna kharoshe on 01/09/20.
//

import UIKit

class AddLocationViewModel: NSObject {

    // MARK: - Constants
    enum Constants {
        static let namePlaceholder = "Enter location name (optional)"
        static let latitudePlaceholder = "Enter latitude"
        static let longitudePlaceholder = "Enter longitude"
        static let buttonTitle = "Open"
        static let title = "Add Location"
        static let wrongDetails = "Enter correct details"
    }
    
    // MARK: - Private variable
    private let sharedInstance = AppData.sharedData

    // MARK: - Public variables
    var title: String {
        return Constants.title
    }
    
    var namePlaceholder: String {
        return Constants.namePlaceholder
    }
    
    var latitudePlaceholder: String {
        return Constants.latitudePlaceholder
    }
    
    var longitudePlaceholder: String {
        return Constants.longitudePlaceholder
    }
    
    var buttonTitle: String {
        return Constants.buttonTitle
    }
    
    var errorMessage: String {
        return Constants.wrongDetails
    }
    
    // MARK: - Instance methods    
    func saveAndOpen(name: String, latitude: Double, longitude: Double, controller: UIViewController, completionBlock: ((Bool) -> ())? = nil) {
        
        let newLocation = Location(name: name, latitude: latitude, longitude: longitude)
        self.sharedInstance.openUrlFrom(location: newLocation,
                                        result: { [weak self] result in
                                            
                                            guard let self = self else { return }
                                            switch (result) {
                                            case .success(let flag):
                                                completionBlock?(flag)
                                            case .failure(.coordinates), .failure(.wrongURL):
                                                self.showAlert(controller: controller,
                                                               message: "Invalid coordinates or url")
                                                completionBlock?(false)
                                                break
                                            }})
        
    }
    
    func showAlert(controller: UIViewController, message: String) {
        
        let alert = UIAlertController(title: "Alert",
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
}
