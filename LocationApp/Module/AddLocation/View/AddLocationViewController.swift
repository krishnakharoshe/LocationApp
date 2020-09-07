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
    @IBOutlet private(set) weak var locationNameTextfield: UITextField!
    @IBOutlet private(set) weak var latitudeTextfield: UITextField!
    @IBOutlet private(set) weak var longitudeTextfield: UITextField!
    @IBOutlet private(set) weak var saveButton: UIButton!
    
    // MARK: - Initialization
    static func instantiate() -> AddLocationViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as? AddLocationViewController else {
            fatalError("Failed to load AddLocationViewController from storyboard.")
        }
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
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Cancel",
            style: .done,
            target: self,
            action: #selector(self.cancel_TouchUpInside)
        )
    }
    
    private func clearTextfields() {
        self.locationNameTextfield.text = ""
        self.latitudeTextfield.text = ""
        self.longitudeTextfield.text = ""
    }
    
    @objc private func cancel_TouchUpInside() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - IBAction functions
    @IBAction private func saveLocation_TouchUpInside() {
        guard let viewModel = self.viewModel else {
            return
        }
        
        guard let latitudeString = self.latitudeTextfield.text,
              let latitude = Double(latitudeString),
              let longitudeString = self.longitudeTextfield.text,
              let longitude = Double(longitudeString) else {
            self.clearTextfields()
            viewModel.showAlert(controller: self, message: "Enter ")
            return
        }
        
        viewModel.saveAndOpen(name: self.locationNameTextfield.text ?? "Unknown",
                              latitude: latitude,
                              longitude: longitude,
                              controller: self)
        
        self.dismiss(animated: true, completion: nil)
    }

}
