import SwiftUI

// MARK: - MAIN SCREEN
struct ContentView: View {

    @State private var showGroups = false
    @State private var selectedGroup = "Select restaurant group"

    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                LinearGradient(
                    colors: [
                        Color(red: 0.14, green: 0.18, blue: 0.32),
                        Color(red: 0.10, green: 0.13, blue: 0.26)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {

                        Spacer().frame(height: 16)

                        // USER CARD
                        SoftCard {
                            VStack(spacing: 14) {

                                Text("Split")
                                    .font(.system(size: 30, weight: .bold))
                                    .foregroundColor(.white)
                                + Text("Pay")
                                    .font(.system(size: 30, weight: .bold))
                                    .foregroundColor(.orange)

                                Text("Split bills effortlessly with friends")
                                    .foregroundColor(.white.opacity(0.8))

                                SoftField(icon: "person.fill", placeholder: "Your name")
                                SoftField(icon: "phone.fill", placeholder: "Phone number")

                                // DROPDOWN
                                VStack(spacing: 6) {
                                    Button {
                                        showGroups.toggle()
                                    } label: {
                                        HStack {
                                            Image(systemName: "person.3.fill")
                                                .foregroundColor(.purple)

                                            Text(selectedGroup)
                                                .foregroundColor(
                                                    selectedGroup == "Select restaurant group"
                                                    ? .white.opacity(0.7)
                                                    : .white
                                                )

                                            Spacer()

                                            Image(systemName: showGroups ? "chevron.up" : "chevron.down")
                                                .foregroundColor(.white.opacity(0.6))
                                        }
                                        .padding(12)
                                        .background(Color.white.opacity(0.18))
                                        .cornerRadius(14)
                                    }

                                    if showGroups {
                                        VStack(spacing: 0) {
                                            DemoGroupRow(title: "Cafe Demo") {
                                                selectGroup("Cafe Demo")
                                            }
                                            DemoGroupRow(title: "Restaurant A") {
                                                selectGroup("Restaurant A")
                                            }
                                            DemoGroupRow(title: "Restaurant B") {
                                                selectGroup("Restaurant B")
                                            }
                                        }
                                        .background(Color.white.opacity(0.20))
                                        .cornerRadius(14)
                                    }
                                }

                                // 👉 CONTINUE → SCAN QR
                                NavigationLink {
                                    ScanQRView()
                                } label: {
                                    SoftButton(title: "Continue")
                                }
                            }
                        }

                        // MANAGER CARD
                        SoftCard {
                            VStack(spacing: 14) {

                                Image(systemName: "shield.fill")
                                    .font(.system(size: 26))
                                    .foregroundColor(.blue)

                                Text("Manager Access")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.white)

                                Text("Enter manager code")
                                    .foregroundColor(.white.opacity(0.8))

                                SoftField(icon: "lock.fill", placeholder: "Manager code")

                                SoftButton(title: "Verify Access")
                            }
                        }

                        Spacer().frame(height: 20)
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
    }

    func selectGroup(_ name: String) {
        selectedGroup = name
        showGroups = false
    }
}


// MARK: - CARD
struct SoftCard<Content: View>: View {
    let content: Content
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 22)
                    .fill(Color.white.opacity(0.20))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 22)
                    .stroke(Color.white.opacity(0.25))
            )
    }
}

// MARK: - TEXT FIELD
struct SoftField: View {
    var icon: String
    var placeholder: String
    @State private var text = ""

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundColor(.purple)

            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(.white.opacity(0.7))
                }
                TextField("", text: $text)
                    .foregroundColor(.white)
            }
        }
        .padding(12)
        .background(Color.white.opacity(0.18))
        .cornerRadius(14)
    }
}

// MARK: - DROPDOWN ROW
struct DemoGroupRow: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(12)
        }
    }
}

// MARK: - BUTTON
struct SoftButton: View {
    var title: String

    var body: some View {
        Text(title)
            .fontWeight(.semibold)
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .padding(12)
            .background(
                LinearGradient(
                    colors: [
                        Color(red: 1.0, green: 0.75, blue: 0.25),
                        Color(red: 1.0, green: 0.85, blue: 0.45)
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(16)
    }
}

// MARK: - PREVIEW
#Preview {
    ContentView()
}
