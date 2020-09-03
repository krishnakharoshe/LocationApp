//
//  LocationViewController.swift
//  LocationApp
//
//  Created by krishna kharoshe on 29/08/20.
//

import UIKit

class LocationViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Private variables
    private var viewModel: LocationViewModel!
    private let router = LocationListRouter()
    
    // MARK: - Viewcontroller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel.reloadTableViewIfRequired()
    }
    
    // MARK: - Private functions
    private func initialSetup() {
        self.viewModel = LocationViewModel()
        self.bindViewModel()
        self.setupUI()
    }
    
    private func bindViewModel() {
        self.viewModel.action = { [weak self] action in
            guard let self = self else { return }
            switch action {
            case .reload:
                self.tableView.reloadData()
                break
            }
        }
    }
    
    private func setupUI(){
        self.title = self.viewModel.title
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - IBAction function
    @IBAction private func addCustomLocation(_ sender: Any) {
        self.router.route(to: .addLocation, from: self, with: nil)
    }
}

    // MARK: - Table View datasource and delegate
extension LocationViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier") as? LocationTableViewCell else { return UITableViewCell() }
        
        cell.prepareCellFrom(viewModel: self.viewModel.getLocationCellViewModel(for: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.viewModel.openUrlFrom(location: self.viewModel.dataSource[indexPath.row],
                                   result: { [weak self] result in
                                    
                                    guard let self = self else { return }
                                    
                                    switch (result) {
                                    case .failure(.coordinates), .failure(.wrongURL):
                                        self.router.route(to: .alert,
                                                          from: self,
                                                          with: nil)
                                        break
                                        
                                    default: break
                                    }
                                   })
    }
}
