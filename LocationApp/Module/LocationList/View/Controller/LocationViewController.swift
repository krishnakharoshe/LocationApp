//
//  LocationViewController.swift
//  LocationApp
//
//  Created by krishna kharoshe on 29/08/20.
//

import UIKit

class LocationViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: LocationViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LocationViewModel()
        self.title = viewModel.title
        self.tableView.register(UINib(nibName: "LocationTableViewCell", bundle: nil), forCellReuseIdentifier: "reusableIdentifier")
    }
}

extension LocationViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reusableIdentifier", for: indexPath) as? LocationTableViewCell else { return UITableViewCell() }
        cell.prepareCellFrom(viewModel: viewModel.getLocationCellViewModel(for: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        //20.593684    78.96288    India
        let appURLScheme = "wikipedia://places?lat=20.593684&long=78.96288&WMFArticleURL=India"

        guard let appURL = URL(string: appURLScheme) else {
            return
        }

        if UIApplication.shared.canOpenURL(appURL) {

            if #available(iOS 10.0, *) {
                UIApplication.shared.open(appURL)
            }
            else {
                UIApplication.shared.openURL(appURL)
            }
        }
        else {
            // Here you can handle the case when your other application cannot be opened for any reason.
        }
    }
}
