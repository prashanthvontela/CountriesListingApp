
import Foundation

class CountryListViewModel {
    
    private(set) var countries: [CountryViewModel] = []
    
    func fetchCountries(url: URL) async {
        do {
            let countryList = try await WebService().getCountries(url: url)
            self.countries = countryList.map(CountryViewModel.init)
        } catch  {
            print(error)
        }
    }
    
    func getSearchResults(_ searchText: String) -> [CountryViewModel] {
        if (searchText.isEmpty) {
            return countries
        } else {
            return countries.filter({$0.name.lowercased().contains(searchText.lowercased())})
        }
    }
}


struct CountryViewModel {
    
    private let country: Country
    
    init(country: Country) {
        self.country = country
    }
    
    var name: String {
        country.name
    }
    
    var region: String {
        country.region
    }
    var code: String {
        country.code
    }
    var capital: String {
        country.capital
    }
}

