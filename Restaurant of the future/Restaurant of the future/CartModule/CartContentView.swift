//
//  CartContentView.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 31.05.2024.
//

import SwiftUI
import UIKit

struct CartContentView: View {
    var body: some View {
        VStack {
            Text("Пример использования UIKit компонентов, надеюсь не пригодиться :)")
                .padding()
                .font(.title)
            CartViewRepresentable(model: ModelTest(name: "Вот это вот все:", price: "100$"))
        }
    }
}

#Preview {
    CartContentView()
}

struct CartViewRepresentable: UIViewRepresentable {
    
    public let model: ModelTest
    
    public init(model: ModelTest) {
        self.model = model
    }
    
    public func makeUIView(context: Context) -> CartView {
        return CartView()
    }
    
    public func updateUIView(_ uiView: CartView, context: Context) {
        uiView.configure(model: model)
    }
}

class CartView: UIView {
    private let nameLabel = UILabel(frame: .zero)
    private let priceLabel = UILabel(frame: .zero)
    
    func configure(model: ModelTest) {
        setupUI()
        
        nameLabel.text = model.name
        nameLabel.font = .boldSystemFont(ofSize: 16)
        priceLabel.text = model.price
        priceLabel.textColor = .red
    }
    
    private func setupUI() {
        addSubview(nameLabel)

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 120).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
        
        addSubview(priceLabel)

        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 120).isActive = true
        priceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        priceLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
    }
}

struct ModelTest {
    let name: String
    let price: String
}

