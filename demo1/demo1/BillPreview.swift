import SwiftUI

struct BillPreview: View {

    let totalBill: Int
    let selectedPeople: Int

    var yourShare: Int {
        totalBill / selectedPeople
    }

    var body: some View {

        ZStack {

            LinearGradient(
                colors: [
                    Color(red: 0.06, green: 0.10, blue: 0.25),
                    Color.black
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 22) {

                Text("Bill Split Preview")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                VStack(spacing: 16) {

                    HStack {
                        Text("Total Bill")
                        Spacer()
                        Text("₹\(totalBill)")
                    }

                    HStack {
                        Text("Number of Person")
                        Spacer()
                        Text("\(selectedPeople)")
                    }

                    Divider()

                    HStack {
                        Text("Your Share")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("₹\(yourShare)")
                            .font(.system(size: 22, weight: .bold))
                    }

                }
                .foregroundColor(.white)
                .padding(20)
                .background(Color.white.opacity(0.08))
                .cornerRadius(18)

                // ✅ FIXED HERE
                NavigationLink {
                    Payment(
                        amountToPay: yourShare,
                        totalBill: totalBill,
                        selectedPeople: selectedPeople
                    )
                } label: {
                    Text("Continue to Payment")
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .cornerRadius(14)
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Preview")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        BillPreview(totalBill: 1800, selectedPeople: 4)
    }
}
