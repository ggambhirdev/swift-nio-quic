//===----------------------------------------------------------------------===//
//
// This source file is part of the SwiftNIO open source project
//
// Copyright (c) 2026 Apple Inc. and the SwiftNIO project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of SwiftNIO project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

/// A snapshot of the current QUIC path's transport state.
///
/// RTT values preserve the underlying estimates, including initial values before
/// measurement. In particular, the unmeasured minimum is `UInt32.max` seconds.
/// A snapshot is a copy and can be used independently of the connection's event loop.
@available(anyAppleOS 26, *)
struct InternalQUICConnectionMetrics: Sendable, Equatable {
    /// The latest ACK-delay-adjusted RTT.
    let currentRTT: Duration
    let minimumRTT: Duration
    let smoothedRTT: Duration
    let rttVariance: Duration
    let congestionWindowInBytes: UInt64
}
