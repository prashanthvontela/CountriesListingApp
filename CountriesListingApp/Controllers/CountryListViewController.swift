import Foundation
import UIKit

class CountryListViewController: UITableViewController, UISearchBarDelegate {
    
    private let vm = CountryListViewModel()
    
    lazy var searchBar:UISearchBar = UISearchBar()
    
    private var countryList:[CountryViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        Task {
            await getCountries()
        }
    }
    
    private func configureUI() {
        // Adding search bar
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Search country ..."
        searchBar.isTranslucent = false
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        // registering table cell
        tableView.register(CountryCell.self, forCellReuseIdentifier: "CountryCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countryList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as? CountryCell else {
            fatalError("Country cell not defined")
        }
        let country = countryList[indexPath.row]
        cell.configure(country)
        return cell
    }
    
    private func getCountries() async {
        await vm.fetchCountries(url: Constants.Urls.allCountries)
        countryList = vm.countries
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        countryList = vm.getSearchResults(searchText)
        tableView.reloadData()
    }
}
