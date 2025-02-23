//
//  ContentView.swift
//  CityListDispaly
//
//  Created by Richa Agrawal on 23/02/25.
//

import SwiftUI

struct CityRow: View {
    var cityName: String =  ""
    var body: some View {
        Text(cityName)
    }
}

struct ContentView: View {
    @StateObject var viewModel = CitiesViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(viewModel.listArray, id: \.items) { item in
                    Section(header: Text(item.stateName)
                        .font(.title) ){
                            if item.isExpand {
                                ForEach(item.items, id: \.city){ cities in
                                    CityRow(cityName: cities.city)
                                    
                                }
                            }
                        }.onTapGesture {
                            viewModel.expandSection(index: item.index)
                        }
                }
                
            }.listStyle(.grouped)
                .navigationTitle("Australian Cities")
                .toolbar {
                    Button {
                        // action
                        viewModel.filteCitiesList(isReversed: true)
                    } label: {
                        Text("Reverse")
                    }
                   
                }
        }.onAppear(perform:{viewModel.getCity()})
            .background(colorScheme == .dark ? Color.black : Color.white)
    }
}



#Preview {
    ContentView(viewModel: CitiesViewModel())
}
