//
//  LocationListRouter.swift
//  LocationApp
//
//  Created by krishna kharoshe on 01/09/20.
//

import UIKit

enum Segue: String {
    case addLocation
    case alert
}


class LocationListRouter: Router {
    func route(to segue: Segue, from controller: UIViewController, with data: Any?) {
        switch segue {
        case .addLocation:
            controller.navigationController?.pushViewController(self.loadAddCustomLocation(), animated: true)
            break
        
        case .alert:
            controller.present(self.getAlertViewControler(), animated: true, completion: nil)
            break
        }
    }
}

private extension LocationListRouter {
    func loadAddCustomLocation() -> AddLocationViewController {
        let addLocationViewController = AddLocationViewController.instantiate()
        addLocationViewController.viewModel = AddLocationViewModel()
        return addLocationViewController
    }
    
    func getAlertViewControler() -> UIAlertController {
        let alert = UIAlertController(title: "Alert", message: "Invalid coordinates or URL !!!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        return alert
    }
}
