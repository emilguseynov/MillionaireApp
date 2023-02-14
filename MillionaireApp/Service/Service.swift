//
//  Service.swift
//  MillionaireApp
//
//  Created by Emil Guseynov on 06.02.2023.
//

import Foundation

protocol DataFetch {
    
    func getQuestions(completion: @escaping(Questions) -> Void)
}

class Service: DataFetch {
    
    let decoder = JSONDecoder()
    
    func getQuestions(completion: @escaping (Questions) -> Void) {
        let file = "questions.json"
        
        guard let url = Bundle.main.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        guard let questionArray = try? decoder.decode([Question].self, from: data) else {
            print("failed to decode data")
            return
            
        }
        completion(questionArray)
    }
}
