//
//  AccountView.swift
//  MyApp
//
//  Created by Nam. Tran Dinh - CMC Global DKR1 on 19/2/25.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var accViewModel = AccountViewModel.shared
    
    var body: some View {
        NavigationView {
            Form {
                Section (
                    header: Text("Personal Info"),
                    content: {
                        TextField("First Name", text: $accViewModel.firstName)
                        TextField("Last Name", text: $accViewModel.lastName)
                        TextField("Email", text: $accViewModel.email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                        DatePicker(
                            "Birthday",
                            selection: $accViewModel.birthday,
                            displayedComponents: .date
                        ).accentColor(Color("brandColor"))
                        
                        Button {
                            accViewModel.saveChanges()
                        } label: {
                            Text("Save Changes")
                        }
                    }
                )
                
                Section (
                    header: Text("Request"),
                    content: {
                        Toggle("Extra Napkins", isOn: $accViewModel.extraNapkins)
                        Toggle("Frequent Refills", isOn: $accViewModel.frequentRefills)
                    }
                )
                .toggleStyle(SwitchToggleStyle(tint: Color("brandColor")))
            }
            .navigationTitle("🧑‍💼 Account")
        }
        .alert(item: $accViewModel.alertMessage) { alert in
            Alert(
                title: Text(alert.title),
                message: Text(alert.message),
                dismissButton: alert.dissmissButton
            )
        }
    }
}

#Preview {
    AccountView()
}
