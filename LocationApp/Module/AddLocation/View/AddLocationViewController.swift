//
//  AddLocationViewController.swift
//  LocationApp
//
//  Created by krishna kharoshe on 01/09/20.
//

import UIKit

class AddLocationViewController: UIViewController {

    var viewModel: AddLocationViewModel!
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
        
        self.title = self.viewModel.title
        self.locationNameTextfield.placeholder = self.viewModel.namePlaceholder
        self.latitudeTextfield.keyboardType = .alphabet
        self.latitudeTextfield.placeholder = self.viewModel.latitudePlaceholder
        self.latitudeTextfield.keyboardType = .decimalPad
        self.longitudeTextfield.placeholder = self.viewModel.longitudePlaceholder
        self.longitudeTextfield.keyboardType = .decimalPad
        self.saveButton.setTitle(self.viewModel.buttonTitle, for: .normal)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func clearTextfields() {
        self.locationNameTextfield.text = ""
        self.latitudeTextfield.text = ""
        self.longitudeTextfield.text = ""
    }
    
    @IBAction private func saveLocation_TouchUpInside() {
            
        guard let locationName = self.locationNameTextfield.text,
              let latitudeString = self.latitudeTextfield.text,
              let latitude = Double(latitudeString),
              let longitudeString = self.longitudeTextfield.text,
              let longitude = Double(longitudeString) else {

            self.clearTextfields()
            self.viewModel.showAlert(controller: self)
            return
        }
        
        self.viewModel.addLocation(name: locationName,
                              latitude: latitude,
                              longitude: longitude)
        
        self.navigationController?.popViewController(animated: true)
    }
}
