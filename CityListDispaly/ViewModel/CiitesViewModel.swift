//
//  CiitesViewModel.swift
//  CityListDispaly
//
//  Created by Richa Agrawal on 23/02/25.
//
import Foundation

class CitiesViewModel: ObservableObject {
    @Published var citiesList: [CitiesModel] = []
    @Published var listArray: [ListModel] = []
    
    func getCity() {
        if let path = Bundle.main.path(forResource: "au_cities", ofType: "json"){
            let url = URL(fileURLWithPath: path)
            
            do {
                let jsondata = try Data(contentsOf: url)
                let cities = try JSONDecoder().decode([CitiesModel].self, from: jsondata)
                citiesList = cities
                citiesList.sort(by: { $0.city < $1.city })
                filteCitiesList(isReversed: false)
                
            } catch {
                print("error")
            }
            
        } else {
            print("file not found")
        }
    }
    func filteCitiesList(isReversed: Bool) {
        if !isReversed {
            var listdict = ListModel()
            let groupBycategory = Dictionary(grouping: citiesList) {$0.admin_name }
            for item in groupBycategory {
                listdict.stateName = item.key
                listdict.items = item.value
                listdict.isExpand = false
                listdict.index = 0
                listArray.append(listdict)
            }
            listArray.sort(by: { $0.stateName < $1.stateName })
        } else {
            listArray.reverse()
        }
        var cnt = 0
        var dict = ListModel()
        var modifiedArray: [ListModel] = []
        for item in listArray {
            if cnt == 0  {
                dict.index = 0
            }else {
                dict.index = cnt
            }
            cnt = cnt + 1
            dict.stateName = item.stateName
            dict.isExpand = item.isExpand
            dict.items = item.items
            modifiedArray.append(dict)
            
        }
        listArray.removeAll()
        listArray = modifiedArray
    }
    
    func expandSection(index: Int) {
        let flag  = listArray[index].isExpand
        listArray[index].isExpand = !(flag)
    }
}

