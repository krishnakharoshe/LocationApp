//
//  AddLocationViewController.swift
//  LocationApp
//
//  Created by krishna kharoshe on 01/09/20.
//

import UIKit

class AddLocationViewController: UIViewController {

    // MARK: - Private variables
    var viewModel: AddLocationViewModel?
    @IBOutlet weak var locationNameTextfield: UITextField!
    @IBOutlet weak var latitudeTextfield: UITextField!
    @IBOutlet weak var longitudeTextfield: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    // MARK: - Initialization
    static func instantiate() -> AddLocationViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! AddLocationViewController
        return viewController
    }
    
    // MARK: - Viewcontroller Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    // MARK: - Private functions
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
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func clearTextfields() {
        self.locationNameTextfield.text = ""
        self.latitudeTextfield.text = ""
        self.longitudeTextfield.text = ""
    }
    
    // MARK: - IBAction functions
    @IBAction private func saveLocation_TouchUpInside() {
        guard let viewModel = self.viewModel else {
            return
        }
        
        guard let locationName = self.locationNameTextfield.text,
              let latitudeString = self.latitudeTextfield.text,
              let latitude = Double(latitudeString),
              let longitudeString = self.longitudeTextfield.text,
              let longitude = Double(longitudeString) else {

            self.clearTextfields()
            viewModel.showAlert(controller: self)
            return
        }
        
        viewModel.addLocation(name: locationName,
                              latitude: latitude,
                              longitude: longitude)
        
        self.navigationController?.popViewController(animated: true)
    }
}
