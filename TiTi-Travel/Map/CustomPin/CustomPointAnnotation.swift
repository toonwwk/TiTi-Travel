//
//  CustomPin.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 15/4/2564 BE.
//

import Foundation
import MapKit

class CustomPointAnnotation: MKPointAnnotation {
    
    let viewModel: CustomPointAnnotationViewModel

    init(with viewModel: CustomPointAnnotationViewModel) {
        self.viewModel = viewModel
    }

}
