//
//  MainReducer.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 30.05.2024.
//

import Foundation
import Combine

public typealias Reducer<State, Action, Environment> = (inout State, Action, Environment) -> AnyPublisher<Action, Never>?

final public class ReduxStore<State, Action, Environment>: ObservableObject {
    @Published public private(set) var state: State
    
    private let environment: Environment
    private let reducer: Reducer<State, Action, Environment>
    private var effectCancellables: Set<AnyCancellable> = []
    
    public init(initialState: State, reducer: @escaping Reducer<State, Action, Environment>, environment: Environment) {
        self.state = initialState
        self.reducer = reducer
        self.environment = environment
    }
    
    public func send(_ action: Action) {
        guard let effect = reducer(&state, action, environment) else { return }
        
        effect.receive(on: DispatchQueue.main)
            .sink(receiveValue: send)
            .store(in: &effectCancellables)
    }
}
