//
//  NetworkManager.swift
//  LittleLemonRestaurantApp
//
//  Created by Lucinda Flores on 23/04/2025.
//

import Foundation

class NetworkManager  {
    
    static let shared = NetworkManager()
    
    /// OPTION FOR MANAGING NETWORKING:
    /// ASYNC/AWAIT, iOS15+
    func getMenuData() async throws -> [MenuItem] {
        guard let url = URL(string: urlBase) else {
            print(NetworkError.invalidURL.localizedDescription)
            throw NetworkError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            if let httpResponse = response as? HTTPURLResponse,
               !(200...299).contains(httpResponse.statusCode) {
                print(NetworkError.badStatusCode(httpResponse.statusCode).localizedDescription)
                throw NetworkError.badStatusCode(httpResponse.statusCode)
            }

            do {
                let decoded = try JSONDecoder().decode(Menu.self, from: data)
                return decoded.menu
            } catch {
                print(NetworkError.decodingFailure(error).localizedDescription)
                throw NetworkError.decodingFailure(error)
            }

        } catch {
            print(NetworkError.networkFailure(error).localizedDescription)
            throw NetworkError.networkFailure(error)
        }
    }
}
    

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case networkFailure(Error)
    case badStatusCode(Int)
    case decodingFailure(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL for the menu data."
        case .networkFailure(let error):
            return "Network error occurred: \(error.localizedDescription)"
        case .badStatusCode(let code):
            return "Server responded with status code \(code)."
        case .decodingFailure(let error):
            return "Failed to decode the menu: \(error.localizedDescription)"
        }
    }
}


    /// OPTION FOR MANAGING NETWORKING:
    /// Using a completion handler, this is for iOS14+
//    func getMenuData(completion: @escaping ([MenuItem]) -> Void)  {//}-> Menu {
//        
//        guard let url = URL(string: urlBase) else {
//            print("Invalid URL.")
//            completion([])
//            return
//        }
//
//        let request = URLRequest(url: url)
//        
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data else {
//                print("No data: \(error?.localizedDescription ?? "Unknown error")")
//                completion([])
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let menuList = try decoder.decode(Menu.self, from: data)
//                DispatchQueue.main.async {
//                    completion(menuList.menu)
//                }
//            } catch {
//                print("Decoding failed: \(error.localizedDescription)")
//                completion([])
//            }
//        }.resume()
//    }
// }
    
    
    

