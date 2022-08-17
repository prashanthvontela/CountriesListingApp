
import Foundation

enum CountriesError: Error {
    case invalidResponse
}

class WebService {
    func getCountries(url: URL) async throws -> [Country] {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
                  throw CountriesError.invalidResponse
              }
        return try JSONDecoder().decode([Country].self, from: data)
    }
}

