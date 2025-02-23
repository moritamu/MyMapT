//
//  MapView.swift
//  MyMapT
//
//  Created by MsMacM on 2025/02/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    let searchKey: String
    @State var targetCoordinate = CLLocationCoordinate2D()
    @State var cameraPosition: MapCameraPosition = .automatic

    var body: some View {
        Map(position: $cameraPosition) {
            Marker(searchKey, coordinate: targetCoordinate)
        }
        .onChange(of: searchKey, initial: true) { oldValue,newValue in
            print("検索キーワード：\(newValue)")

            let request = MKLocalSearch.Request()
            request.naturalLanguageQuery = newValue

            let search = MKLocalSearch(request: request)
            search.start { response, error in
                if let mapItem = response?.mapItems,
                   let mapItem = mapItem.first {
                    targetCoordinate = mapItem.placemark.coordinate
                    print("軽度・緯度：\(targetCoordinate)")
                    cameraPosition = .region(MKCoordinateRegion(
                        center: targetCoordinate,
                        latitudinalMeters: 400.0,
                        longitudinalMeters: 500.0
                    ))
                }
            }
        }
    }
}

#Preview {
    MapView(searchKey: "桶川市役所")
}
