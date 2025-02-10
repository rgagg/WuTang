//
//  ContentView.swift
//  WuTang
//
//  Created by Richard Gagg on 10/2/2025.
//

import SwiftUI

struct ContentView: View {
  
  @State private var enteredName: String = ""
  @State private var staticCoderNameIs: String = ""
  @State private var wuTangName: String = ""
  @State private var imageName: String = "wu-tang"
  
  @FocusState private var textFieldIsFocused
  
  private let firstColumn: [String] = [
    "Algorithmic",
    "Byte",
    "Cache",
    "Debug",
    "Echo",
    "Function",
    "Git",
    "Hex",
    "Infinite",
    "Java",
    "Kernel",
    "Logic",
    "Module",
    "Node",
    "Object",
    "Pixel",
    "Query",
    "Runtime",
    "Script",
    "Token",
    "Undefined",
    "Virtual",
    "Web",
    "Xcode",
    "Yota",
    "Zero"]
  
  private let secondColumn: [String] = [
    "$tack",
    "Processor",
    "Cipher",
    "Daemon",
    "EndPoint",
    "Framework",
    "Gateway",
    "Hub",
    "Interrupt",
    "Crash",
    "Loop",
    "Module",
    "Nexus",
    "Optimizer",
    "Protocol",
    "Queue",
    "Router",
    "Stack",
    "Thread",
    "Update",
    "Variable",
    "Widget",
    "Terminal",
    "Yield",
    "Zen",
    "Ace",
    "Breakpoint",
    "Root",
    "Instance",
    "Access",
    "Archive",
    "Control",
    "Justice"]
  
  var body: some View {
    VStack {
      Text("Wu-Tang\nCoder Name Generator")
        .font(.title)
        .fontWeight(.black)
        .foregroundStyle(.yellow)
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity)
        .padding(.bottom)
        .background(.black)
      
      Spacer()
      
      TextField("Enter name here", text: $enteredName)
        .font(.title2)
        .multilineTextAlignment(.center)

        .textFieldStyle(.roundedBorder)
        .overlay {
          RoundedRectangle(cornerRadius: 12)
            .stroke(.gray, lineWidth: 2)
        }
        .keyboardType(.asciiCapable)
        .submitLabel(.continue)
        .disableAutocorrection(true)
        .textInputAutocapitalization(.words)
        .onSubmit {
          guard !enteredName.isEmpty else {
            textFieldIsFocused = false
            return
          }
          wuTangName = getWutangName(name: enteredName)
        }
        .onChange(of: textFieldIsFocused) { newValue in
          if textFieldIsFocused == true {
            imageName = ""
            staticCoderNameIs = ""
            wuTangName = ""
          } else {
            imageName = "wu-tang"
          }
        }
        .focused($textFieldIsFocused)
        .padding()
      
      Button {
        wuTangName = getWutangName(name: enteredName)
        
      } label: {
        Image("wu-tang-button")
        Text("Get It!")
      }
      .buttonStyle(.borderedProminent)
      .tint(.black)
      .font(.title2)
      .fontWeight(.bold)
      .foregroundStyle(.yellow)
      .overlay {
        RoundedRectangle(cornerRadius: 12)
          .stroke(.yellow, lineWidth: 2)
      }
      .disabled(enteredName.isEmpty)
      
      VStack {
        Text(staticCoderNameIs)
          .multilineTextAlignment(.leading)
        
        Text(wuTangName)
          .fontWeight(.black)
          .multilineTextAlignment(.center)
      }
      .font(.largeTitle)
      .foregroundStyle(.black)
      .frame(height: 130)
      
      Spacer()
      
      Image(imageName)
        .resizable()
        .scaledToFit()
        .animation(.easeIn(duration: 0.3), value: imageName)
    }
  }
  
  func getWutangName(name: String) -> String {
    staticCoderNameIs =  "Your Wu-Tang Coder Name Is:"
    enteredName = ""
    imageName = "wu-tang"
    textFieldIsFocused = false
    
    var firstName = name
    var firstColunmIndex = 0
    let FirstLetter = firstName.removeFirst()
    
    for i in 0..<firstColumn.count {
      if firstColumn[i].first == FirstLetter {
        firstColunmIndex = (i == 0 ? 25 : i - 1)
      }
    }
    
    firstName = firstColumn[firstColunmIndex]
    let secondName = secondColumn.randomElement() ?? "Clan"
    
    let fullName = "\(firstName) \(secondName)"
        
    return fullName
  }
}

#Preview {
  ContentView()
}
