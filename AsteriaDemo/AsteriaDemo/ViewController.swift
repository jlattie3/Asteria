//
//  ViewController.swift
//  AsteriaDemo
//
//  Created by Jacob Lattie on 8/23/22.
//

import UIKit
import Asteria

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Task {
            do {
                let apod = try await Asteria().apodService.getAPOD(with: .random(count: 1))
                print(apod)
            } catch {
                print(error.localizedDescription)
                print(String(describing: error))
            }
        }
    }
}

