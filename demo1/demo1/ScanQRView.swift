import SwiftUI

struct ScanQRView: View {
    var body: some View {

        NavigationStack {   // ✅ REQUIRED
            ZStack {
                // BACKGROUND
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

                    // MAIN CARD
                    VStack(spacing: 18) {

                        Image(systemName: "bolt.fill")
                            .foregroundColor(.orange)
                            .padding(14)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(12)

                        Text("Scan Table QR")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white)

                        Text("Scan the QR code on your table to get started")
                            .font(.system(size: 14))
                            .foregroundColor(.white.opacity(0.7))
                            .multilineTextAlignment(.center)

                        RoundedRectangle(cornerRadius: 22)
                            .stroke(
                                Color.orange,
                                style: StrokeStyle(lineWidth: 2, dash: [6])
                            )
                            .frame(width: 220, height: 220)
                            .overlay(
                                Image(systemName: "qrcode.viewfinder")
                                    .font(.system(size: 42))
                                    .foregroundColor(.white.opacity(0.5))
                            )

                        // PRIMARY BUTTON
                        Button {
                            // Camera later
                        } label: {
                            Text("Start Camera Scan")
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .padding(14)
                                .background(Color.orange)
                                .cornerRadius(16)
                        }

                        // ✅ DEMO → NEXT PAGE
                        NavigationLink {
                            DemoNextPage()
                        } label: {
                            Text("Demo: Simulate Scan")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white.opacity(0.9))
                                .frame(maxWidth: .infinity)
                                .padding(14)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color.white.opacity(0.08))
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.white.opacity(0.18))
                                )
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
}
