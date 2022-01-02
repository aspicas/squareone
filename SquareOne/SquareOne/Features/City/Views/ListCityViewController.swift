//
//  ListCityViewController.swift
//  SquareOne
//
//  Created by David Garcia on 31/12/21.
//

import UIKit

class ListCityViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
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
        setupSearchBar()
        setupTableView()
        presenter?.getCity(completion: { result in
            switch result {
            case .success(let cities):
                self.data = cities
            case .failure:
                print("ERROR")
            }
        })
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func setupSearchBar() {
        searchBar.delegate = self
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
                switch result {
                case .success(let cities):
                    self.data.append(contentsOf: cities)
                case .failure:
                    print("ERROR")
                }
            })
        }
    }
}

extension ListCityViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filter = searchText
        presenter?.resetPagination()
        presenter?.getCity(filter: searchText, completion: { result in
            switch result {
            case .success(let cities):
                self.data = cities
            case .failure:
                print("ERROR")
            }
        })
    }
}
