//
//  FetchImageViewModel.swift
//  PreOnboarding
//
//  Created by 이지석 on 2023/03/01.
//

import Foundation
import UIKit

final class FetchImageViewModel {
    
    func fetchImage(
        _ url: URL,
        _ completion: @escaping (UIImage?) -> Void
    ) -> URLSessionDataTask {
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            
            guard let data = data else {
                completion(UIImage(named: "xmark"))
                return
            }
            
            let image = UIImage(data: data)
            completion(image)
        }
        task.resume()
        return task
    }
}
