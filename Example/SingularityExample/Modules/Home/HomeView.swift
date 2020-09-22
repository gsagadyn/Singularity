//
//  HomeView.swift
//  SingularityExample
//
//  Created by Grzegorz Sagadyn on 20/09/2020.
//

import SwiftUI
import Singularity

internal struct HomeView: View {
    // MARK: - Private Properties
    
    @Inject(.shared) private var service: HomeService
    
    // MARK: - Body Definition
    
    internal var body: some View {
        Text("\(service.echo(text: "Hello")), \(service.echo(text: "world"))!")
    }
}

// -----------------------------------------------------------------------------
// MARK: - Preview
// -----------------------------------------------------------------------------

internal struct HomeView_Previews: PreviewProvider {
    internal static var previews: some View {
        HomeView()
    }
}
