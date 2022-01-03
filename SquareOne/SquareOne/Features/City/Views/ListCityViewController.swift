//
//  ListCityViewController.swift
//  SquareOne
//
//  Created by David Garcia on 31/12/21.
//

import UIKit

class ListCityViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    private var data: [City] = [] {
        didSet {
            DispatchQueue.main.sync {
                self.tableView.reloadData()
            }
        }
    }
    private var filter: String = ""
    
    var presenter: CityPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        setupSearchBar()
        setupTableView()
        presenter?.getCity(completion: { result in
            self.setCities(result: result)
        })
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func setupSearchBar() {
        searchBar.delegate = self
    }
    
    private func setupButton() {
        mapButton.setTitle("", for: .normal)
    }
    
    private func setCities(result: Result<[City], Error>) {
        switch result {
        case .success(let cities):
            self.data = cities
        case .failure:
            print("ERROR")
        }
    }
    
    @IBAction func tapMapButton(_ sender: UIButton) {
        presenter?.goToMap(cities: data)
    }
    
}

extension ListCityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = data[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        if indexPath.row >= data.count - 3 {
            presenter?.getCity(filter: self.filter,
                               completion: { result in
                self.setCities(result: result)
            })
        }
    }
}

extension ListCityViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filter = searchText
        presenter?.resetPagination()
        presenter?.getCity(filter: searchText,
                           forceUpdate: true,
                           completion: { result in
            self.setCities(result: result)
        })
    }
}
