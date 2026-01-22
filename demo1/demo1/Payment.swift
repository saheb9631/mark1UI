import SwiftUI

struct Payment: View {

    // ✅ DATA COMES FROM BillPreview
    let amountToPay: Int
    let totalBill: Int
    let selectedPeople: Int

    var body: some View {

        ZStack {

            LinearGradient(
                colors: [
                    Color(red: 0.05, green: 0.10, blue: 0.25),
                    Color(red: 0.02, green: 0.05, blue: 0.15)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack {
                Spacer()

                VStack(spacing: 20) {

                    Image(systemName: "creditcard.fill")
                        .foregroundColor(.cyan)
                        .padding(14)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(12)

                    Text("Confirm Payment")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.white)

                    Text("Do you want to pay your share now?")
                        .foregroundColor(.white.opacity(0.7))

                    // AMOUNT
                    VStack {
                        HStack {
                            Text("Amount to Pay")
                            Spacer()
                            Text("₹\(amountToPay)")
                                .font(.system(size: 22, weight: .bold))
                        }
                        .foregroundColor(.white)
                    }
                    .padding(16)
                    .background(Color.white.opacity(0.08))
                    .cornerRadius(16)

                    // ✅ PASS ALL DATA FORWARD
                    NavigationLink {
                        PaymentSuccess(
                            amountPaid: amountToPay,
                            totalBill: totalBill,
                            selectedPeople: selectedPeople
                        )
                    } label: {
                        Text("✓ Pay Now")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding(14)
                            .background(Color.orange)
                            .cornerRadius(16)
                    }

                    Text("You can pay anytime before the bill closes")
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.5))
                }
                .padding(28)
                .background(Color.white.opacity(0.08))
                .cornerRadius(28)

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        Payment(
            amountToPay: 225,
            totalBill: 900,
            selectedPeople: 4
        )
    }
}

