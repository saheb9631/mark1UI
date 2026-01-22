import SwiftUI

struct DemoNextPage: View {

    @State private var showPeople = false
    @State private var selectedPeople = 4
    @State private var totalBill = Int.random(in: 1000...3000)

    var body: some View {

        ZStack {

            LinearGradient(
                colors: [
                    Color(red: 0.05, green: 0.10, blue: 0.22),
                    Color(red: 0.02, green: 0.05, blue: 0.15)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack {
                Spacer()

                VStack(spacing: 18) {

                    Image(systemName: "person.2.fill")
                        .foregroundColor(.purple)
                        .padding(14)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(12)

                    Text("How Many Person?")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.white)

                    Text("Select the number of person splitting the bill")
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.7))
                        .multilineTextAlignment(.center)

                    // DROPDOWN
                    VStack(spacing: 6) {

                        Button {
                            showPeople.toggle()
                        } label: {
                            HStack {
                                Text("\(selectedPeople) person")
                                    .foregroundColor(.white)

                                Spacer()

                                Image(systemName: showPeople ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.orange)
                            }
                            .padding(14)
                            .background(Color.white.opacity(0.08))
                            .cornerRadius(14)
                        }

                        if showPeople {
                            VStack(spacing: 0) {
                                ForEach(2...6, id: \.self) { count in
                                    Button {
                                        selectedPeople = count
                                        showPeople = false
                                    } label: {
                                        HStack {
                                            Text("\(count) person")
                                                .foregroundColor(.white)
                                            Spacer()
                                        }
                                        .padding(12)
                                    }
                                }
                            }
                            .background(Color.white.opacity(0.10))
                            .cornerRadius(14)
                        }
                    }

                    // BILL SUMMARY
                    VStack(spacing: 14) {

                        HStack {
                            Text("Total Bill")
                            Spacer()
                            Text("₹\(totalBill)")
                        }

                        HStack {
                            Text("Split Between")
                            Spacer()
                            Text("\(selectedPeople) person")
                        }

                        Divider()

                        HStack {
                            Text("Your Share")
                                .fontWeight(.semibold)
                            Spacer()
                            Text("₹\(totalBill / selectedPeople)")
                                .font(.title3)
                                .fontWeight(.bold)
                        }

                    }
                    .foregroundColor(.white)
                    .padding(16)
                    .background(Color.white.opacity(0.08))
                    .cornerRadius(16)

                    // ✅ CONFIRM SPLIT → BILL PREVIEW
                    NavigationLink {
                        BillPreview(
                            totalBill: totalBill,
                            selectedPeople: selectedPeople
                        )
                    } label: {
                        Text("Confirm Split")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding(14)
                            .background(Color.orange)
                            .cornerRadius(16)
                    }

                }
                .padding(28)
                .background(Color.white.opacity(0.08))
                .cornerRadius(28)

                Spacer()
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        DemoNextPage()
    }
}
