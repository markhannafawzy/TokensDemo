//
//  SpecialityViewModel.swift
//  TokensTableView
//
//  Created by msaad on 2/14/19.
//  Copyright © 2019 msaad. All rights reserved.
//

import Foundation
class CriteriaViewModel {
    var criteriaDictionary:[RefineRowLabel:[String]] = [:]
    var criteriaItems: [String] {
        return criteriaDictionary.values.first!
    }
    var filteredcriteriaItems: [String] = []
    var chosencriteriaItems: [String] = []
    
    init(criteria: [RefineRowLabel: [String]]) {
        self.criteriaDictionary = criteria
//        specialites.append("internal medicine")
//        specialites.append("general pediatric")
//        specialites.append("pediatric cardiology")
//        specialites.append("Cardiology")
//        specialites.append("senior consultant")
//        specialites.append("Ophthalmologist")
//        specialites.append("zsfsdasf")
//        specialites.append("hjydasf")
//        specialites.append("ioasf")
//        specialites.append("iuludasf")
//        specialites.append("odasf")
    }
    
    func stringForDictionaryKey() -> String {
        var stringRepresentationOfKey: String = ""
        for (key, value) in criteriaDictionary {
            stringRepresentationOfKey = key.rawValue
        }
        return stringRepresentationOfKey
    }
    var criteriaCount: Int{
        return criteriaItems.count
    }
    var filteredCount: Int{
        return filteredcriteriaItems.count
    }
    func filterSearchController(with searchString: String) {
        filteredcriteriaItems = criteriaItems.filter { speciality in
            let isMatchingSearchText = speciality.lowercased().contains(searchString.lowercased()) || searchString.lowercased().count == 0
            return isMatchingSearchText
        }
    }
}
