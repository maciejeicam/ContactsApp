//
//  NetworkManager.swift
//  ContactsApp
//
//  Created by Maciej Michalik on 05/04/2023.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseURL = "https://api.randomuser.me/?results=500&key=0A4F-FC2E-5C76-5678&seed=rekrutacja2022"
    
    private init() {}
    
    func getContacts(completed: @escaping (Result<[Contacts], CntError>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
   
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(ContactsRespose.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
        
        
    }
}
