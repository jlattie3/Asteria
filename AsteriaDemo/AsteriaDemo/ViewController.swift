//
//  ViewController.swift
//  AsteriaDemo
//
//  Created by Jacob Lattie on 8/23/22.
//

import UIKit
import Asteria

class ViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    private var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Loading..."
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Asteria"
        navigationItem.rightBarButtonItem = .init(image: .init(systemName: "flame"), style: .plain, target: self, action: #selector(fetchAPOD))

        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true

        scrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        stackView.addArrangedSubview(label)
        fetchAPOD()
    }

    @objc
    private func fetchAPOD() {
        Task {
            do {
                let apod = try await Asteria().apodService.getAPOD(with: .random(count: 1))
                label.text = "\(apod)"
                print(apod)
            } catch {
                print(error.localizedDescription)
                print(String(describing: error))
            }
        }
    }
}

