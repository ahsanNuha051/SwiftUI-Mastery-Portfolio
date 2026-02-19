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
    private var session = LanguageModelSession()
    
    @State private var response: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            switch largeLanguageModel.availability {
            case .available:
                if response.isEmpty{
                    Text("Tap the button to get a fun response.")
                        .foregroundStyle(.tertiary)
                        .multilineTextAlignment(.center)
                        .font(.title)
                }
                else {
                    Text(response)
                        .multilineTextAlignment(.center)
                        .font(.largeTitle)
                        .bold()
                }
            case .unavailable(.deviceNotEligible):
                Text("Your device isn't eligible for Apple Intelligence.")
            case .unavailable(.appleIntelligenceNotEnabled):
                Text("Apple Intelligence isn't enabled, Please enable it in Settings.")
            case .unavailable(.modelNotReady):
                Text("AI Model not ready.")
            case .unavailable(_):
                Text("AI feature is unavailable for unknown reason.")
            }
            Spacer()
            
            Button {
                // Action
                Task{
                    let prompt = "Hello, how can I help you today?"
                    do {
                        let replay = try await session.respond(to: prompt)
                        response = replay.content
                    } catch {
                        response = "Failed to get response: \(error.localizedDescription)"
                    }
                }
            } label: {
                Text("Welcome")
                    .font(.largeTitle)
                    .padding()
            }
            .buttonStyle(.borderedProminent)
            .buttonSizing(.flexible)
            .glassEffect(.regular.interactive())
            
            
        }
        .padding()
        .tint(.purple)
    }
}

#Preview {
    ContentView()
}
