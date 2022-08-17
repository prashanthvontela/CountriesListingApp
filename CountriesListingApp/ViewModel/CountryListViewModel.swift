
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

