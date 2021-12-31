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
    
    private var data: [City] = []
    
    var presenter: CityPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter?.getCity(completion: { result in
            switch result {
            case .success(let cities):
                self.data = cities
                DispatchQueue.main.sync {
                    self.tableView.reloadData()
                }
            case .failure:
                print("ERROR")
            }
        })
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension ListCityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = data[indexPath.row].name
        return cell
    }
}
