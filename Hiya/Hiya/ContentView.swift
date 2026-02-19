//
//  ContentView.swift
//  Hiya
//
//  Created by Ahsan Rizvi on 13/02/2026.
//

import SwiftUI
import FoundationModels

struct ContentView: View {
    private var largeLanguageModel = SystemLanguageModel.default
       
    @State private var response: String = ""
    
    var body: some View {
        VStack {
            switch largeLanguageModel.availability {
            case .available:
                Text(response)
            case .unavailable(.deviceNotEligible):
              Text("Your device isn't eligible for Apple Intelligence.")
            case .unavailable(.appleIntelligenceNotEnabled):
        Text("Apple Intelligence isn't enabled, Please enable it in Settings.")
            case .unavailable(.modelNotReady):
                Text("AI Model not ready.")
            case .unavailable(_):
                Text("AI feature is unavailable for unknown reason.")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
