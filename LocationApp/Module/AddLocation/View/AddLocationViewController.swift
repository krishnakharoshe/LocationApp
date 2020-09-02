//
//  AddLocationViewController.swift
//  LocationApp
//
//  Created by krishna kharoshe on 01/09/20.
//

import UIKit

class AddLocationViewController: UIViewController {

    var viewModel: AddLocationViewModel?
    @IBOutlet weak var locationNameTextfield: UITextField!
    @IBOutlet weak var latitudeTextfield: UITextField!
    @IBOutlet weak var longitudeTextfield: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    static func instantiate() -> AddLocationViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! AddLocationViewController
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    // private functions
    
    private func initialSetup() {
        self.setupUI()
    }
    
    private func setupUI() {
        guard let viewModel = self.viewModel else {
            return
        }
        self.title = viewModel.title
        self.locationNameTextfield.placeholder = viewModel.namePlaceholder
        self.latitudeTextfield.keyboardType = .alphabet
        self.latitudeTextfield.placeholder = viewModel.latitudePlaceholder
        self.latitudeTextfield.keyboardType = .decimalPad
        self.longitudeTextfield.placeholder = viewModel.longitudePlaceholder
        self.longitudeTextfield.keyboardType = .decimalPad
        self.saveButton.setTitle(viewModel.buttonTitle, for: .normal)
    }
    
    
    @IBAction private func saveLocation_TouchUpInside() {
        
        guard let viewModel = self.viewModel,
              let locationName = self.locationNameTextfield.text,
              let latitudeString = self.latitudeTextfield.text,
              let latitude = Double(latitudeString),
              let longitudeString = self.longitudeTextfield.text,
              let longitude = Double(longitudeString) else {
            return
        }
        
        viewModel.addLocation(name: locationName,
                              latitude: latitude,
                              longitude: longitude)
        
        self.navigationController?.popViewController(animated: true)
    }
}
