import SwiftUI

struct PaymentSuccess: View {

    let amountPaid: Int
    let totalBill: Int
    let selectedPeople: Int

    let userId: String = "U29"

    var body: some View {

        ZStack {

            LinearGradient(
                colors: [
                    Color(red: 0.04, green: 0.07, blue: 0.18),
                    Color(red: 0.01, green: 0.03, blue: 0.10)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack {
                Spacer()

                VStack(spacing: 22) {

                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 44))
                        .foregroundColor(.green)
                        .padding(14)
                        .background(Color.white.opacity(0.08))
                        .cornerRadius(14)

                    Text("Payment Successful!")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.white)

                    Text("Thanks! Your payment has been processed.")
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.6))
                        .multilineTextAlignment(.center)

                    Text("• PAID")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.green)

                    VStack(spacing: 14) {

                        HStack {
                            Text("Amount")
                                .foregroundColor(.white.opacity(0.6))
                            Spacer()
                            Text("₹\(amountPaid)")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }

                        HStack {
                            Text("User ID")
                                .foregroundColor(.white.opacity(0.6))
                            Spacer()
                            Text(userId)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }

                    }
                    .padding(18)
                    .background(Color.white.opacity(0.08))
                    .cornerRadius(16)

                    // ✅ FIXED NAVIGATION
                    NavigationLink {
                        GroupStatus(
                            totalBill: totalBill,
                            totalPeople: selectedPeople,
                            paidUserIDs: [userId]
                        )
                    } label: {
                        Text("View Group Status →")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding(14)
                            .background(Color.orange)
                            .cornerRadius(16)
                    }

                }
                .padding(28)
                .background(
                    RoundedRectangle(cornerRadius: 28)
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color.white.opacity(0.12),
                                    Color.white.opacity(0.05)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 28)
                        .stroke(Color.white.opacity(0.15))
                )

                Spacer()
            }
            .padding()
        }
    }
}
