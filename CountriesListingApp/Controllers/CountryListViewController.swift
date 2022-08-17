import Foundation
import UIKit

class CountryListViewController: UITableViewController {
    
    private let vm = CountryListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            await displayStocks()
        }
    }
    
    private func displayStocks() async {
        await vm.fetchCountries(url: Constants.Urls.allCountries)
        print(vm.countries)
    }
    
}
