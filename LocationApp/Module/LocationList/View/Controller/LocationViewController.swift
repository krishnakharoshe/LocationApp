//
//  LocationViewController.swift
//  LocationApp
//
//  Created by krishna kharoshe on 29/08/20.
//

import UIKit

class LocationViewController: UIViewController {

    // IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // Private variable
    
    private var viewModel: LocationViewModel?
    private let router = LocationListRouter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    // private functions

    private func initialSetup() {
        self.viewModel = LocationViewModel()
        self.setupUI()
    }
    
    private func setupUI(){
        guard let viewModel = viewModel else {
            return
        }
        self.title = viewModel.title
        self.tableView.register(UINib(nibName: "LocationTableViewCell", bundle: nil), forCellReuseIdentifier: "reusableIdentifier")
    }
    
    //IBActions
    @IBAction private func addCustomLocation(_ sender: Any) {
        self.router.route(to: .addLocation, from: self, with: nil)
    }
}

extension LocationViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.rowCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reusableIdentifier", for: indexPath) as? LocationTableViewCell,
              let viewModel = self.viewModel else { return UITableViewCell() }
        
        cell.prepareCellFrom(viewModel: viewModel.getLocationCellViewModel(for: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else {
            return
        }
        
        viewModel.openUrlFrom(location: viewModel.dataSource[indexPath.row], result: { [weak self] success, failure in
            
            guard let selfStrong = self  else { return }
            
            switch (success, failure) {
            case (false, .coordinates), (false, .wrongURL):
                selfStrong.router.route(to: .alert, from: selfStrong, with: nil)
                break
            default: break
            }
        })
    }
}
