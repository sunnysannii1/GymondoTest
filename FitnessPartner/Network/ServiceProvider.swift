//
//  ServiceProvider.swift
//  FitnessPartner
//
//  Created by Ahsan Ali on 02/04/2022.
//

import Foundation
import Combine

final class ServiceProvider<T: Service> {
    var urlSession = URLSession.shared

    init() { }

    func load<U>(service: T, decodeType: U.Type) -> AnyPublisher<U, Error> where U: Decodable {
        return urlSession.dataTaskPublisher(for: service.urlRequest)
            .map(\.data)
            .decode(type: U.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        }
    }


