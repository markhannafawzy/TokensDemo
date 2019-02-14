//
//  SpecialityViewModel.swift
//  TokensTableView
//
//  Created by msaad on 2/14/19.
//  Copyright © 2019 msaad. All rights reserved.
//

import Foundation
class SpecialityViewModel {
    var specialites:[String] = []
    var filteredSpecialites: [String] = []
    var chosenSpecialities: [String] = []
    
    init() {
        specialites.append("internal medicine")
        specialites.append("general pediatric")
        specialites.append("pediatric cardiology")
        specialites.append("Cardiology")
        specialites.append("senior consultant")
        specialites.append("Ophthalmologist")
        specialites.append("zsfsdasf")
        specialites.append("hjydasf")
        specialites.append("ioasf")
        specialites.append("iuludasf")
        specialites.append("odasf")
    }
    
    var specialityCount: Int{
        return specialites.count
    }
    var filteredCount: Int{
        return filteredSpecialites.count
    }
    func filterSearchController(with searchString: String) {
        filteredSpecialites = specialites.filter { speciality in
            let isMatchingSearchText = speciality.lowercased().contains(searchString.lowercased()) || searchString.lowercased().count == 0
            return isMatchingSearchText
        }
    }
}
