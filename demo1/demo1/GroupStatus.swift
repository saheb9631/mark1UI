import SwiftUI

struct GroupStatus: View {

    // ✅ DATA COMES FROM PREVIOUS SCREEN
    let totalBill: Int
    let totalPeople: Int
    let paidUserIDs: [String]

    // AUTO CALCULATIONS
    var perPerson: Int {
        totalBill / totalPeople
    }

    var collectedAmount: Int {
        perPerson * paidUserIDs.count
    }

    var pendingAmount: Int {
        totalBill - collectedAmount
    }

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

                VStack(spacing: 20) {

                    Image(systemName: "person.3.fill")
                        .foregroundColor(.purple)
                        .padding(14)
                        .background(Color.white.opacity(0.08))
                        .cornerRadius(14)

                    Text("Group Payment Status")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)

                    Text("Table 7–9")
                        .foregroundColor(.white.opacity(0.6))

                    // ✅ COLLECTED / PENDING (NOW REAL)
                    HStack(spacing: 12) {

                        statusBox("Collected", collectedAmount, .green)
                        statusBox("Pending", pendingAmount, .orange)
                    }

                    // USER LIST
                    VStack(spacing: 10) {

                        headerRow()

                        userRow(id: "U01", phone: "98XXXX1234", paid: false)
                        userRow(id: "U02", phone: "98XXXX5678", paid: false)
                        userRow(id: "U03", phone: "98XXXX4321", paid: false)
                        userRow(id: "U49 (You)", phone: "65XXXX5657", paid: true)

                    }
                    .padding(14)
                    .background(Color.white.opacity(0.06))
                    .cornerRadius(16)

                    // PROGRESS
                    VStack(alignment: .leading, spacing: 6) {

                        ProgressView(
                            value: Double(paidUserIDs.count),
                            total: Double(totalPeople)
                        )
                        .tint(.green)

                        Text("\(paidUserIDs.count)/\(totalPeople) paid")
                            .foregroundColor(.white.opacity(0.6))
                            .font(.system(size: 12))
                    }

                }
                .padding(26)
                .background(Color.white.opacity(0.07))
                .cornerRadius(28)

                Spacer()
            }
            .padding()
        }
    }

    // MARK: UI COMPONENTS

    func statusBox(_ title: String, _ amount: Int, _ color: Color) -> some View {
        VStack(spacing: 6) {
            Text(title)
                .font(.system(size: 12))
                .foregroundColor(.white.opacity(0.6))
            Text("₹\(amount)")
                .fontWeight(.semibold)
                .foregroundColor(color)
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .background(Color.white.opacity(0.05))
        .cornerRadius(14)
    }

    func headerRow() -> some View {
        HStack {
            Text("User ID")
            Spacer()
            Text("Phone")
            Spacer()
            Text("Amount")
            Spacer()
            Text("Status")
        }
        .font(.system(size: 12))
        .foregroundColor(.white.opacity(0.5))
    }

    func userRow(id: String, phone: String, paid: Bool) -> some View {
        HStack {
            Text(id)
                .foregroundColor(paid ? .yellow : .white)
            Spacer()
            Text(phone)
                .foregroundColor(.white.opacity(0.7))
            Spacer()
            Text("₹\(perPerson)")   // ✅ ALWAYS CORRECT
            Spacer()
            Text(paid ? "✔ Paid" : "✘ Unpaid")
                .foregroundColor(paid ? .green : .red)
        }
        .font(.system(size: 13))
    }
}
