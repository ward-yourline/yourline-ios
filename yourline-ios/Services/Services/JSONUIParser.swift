//
//  JSONParserWorker.swift
//  CheckOut
//
//  Created by Warrd Adlani on 24/04/2020.
//  Copyright © 2020 Warrd Adlani. All rights reserved.
//

import Foundation
import Domain

public struct InjectedProperties {
    
    var sections: [Row]
}

public class JSONUIParser {
    
    static func parseJSON(with name: String?, injectableSections: [Rows]?, completion: ((Application?, Error?)->())?) {
        
        guard let name = name, let completion = completion else { return }
        
        ApplicationLoader.parseConfiguration(with: name) { application, error  in
            
            let newApplication = updateForInjection(with: application, injectableSections: injectableSections)
            
            DispatchQueue.main.async {
                
                if let error = error {
                    completion(nil, error)
                } else {
                    completion(newApplication ?? application, nil)
                }
            }
        }
    }
    
    private static func updateForInjection(with application: Application?, injectableSections: [Rows]?) -> Application? {
        
        guard let application = application,
            let injectableSections = injectableSections,
            let screens = application.screens else { return nil }
        
        var updatedScreens = [Screen]()
        
        for screen in screens {
            
            guard let sections = screen.sections else { continue }
            
            var updatedSections = [Rows].init(sections)
            
            let sectionsCount = sections.count > 1 ? sections.count - 1 : sections.count
            
            for i in stride(from: sectionsCount, through: 0, by: -1) {
                
                let section = sections[i]
                
                if let sectionGroup = injectableSections.filter({ $0.groupKey == section.groupKey }).first {
                    
                    updatedSections[i] = sectionGroup
                }
            }
            
            let updatedScreen = screen.updateSections(updatedSections)
            
            updatedScreens.append(updatedScreen)
        }
        
        let newApplication = application.updateValues(screens: updatedScreens)
        
        return newApplication
    }
}
