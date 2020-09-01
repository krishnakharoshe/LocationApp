//
//  Router.swift
//  LocationApp
//
//  Created by krishna kharoshe on 01/09/20.
//

import UIKit

protocol Router {
    func route(to segue: Segue,
               from controller: UIViewController,
               with data: Any?)
}
