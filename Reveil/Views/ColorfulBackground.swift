//
//  ColorfulBackground.swift
//  Reveil
//
//  Created by 秋星桥 on 2023/12/30.
//

import ColorfulX
import SwiftUI


struct ColorfulBackground: View {
    @Environment(\.colorScheme) var colorScheme

    var isAnimatedBackgroundEnabled: Bool {
        StandardUserDefaults.shared.isAnimatedBackgroundEnabled && !ProcessInfo.processInfo.isLowPowerModeEnabled
    }

    var isLowFrameRateEnabled: Bool = StandardUserDefaults.shared.isLowFrameRateEnabled

    var colorfulView: some View {
        if colorScheme == .light {
            ColorfulView(
                color: .constant(ColorfulPreset.winter.colors),
                speed: isAnimatedBackgroundEnabled ? .constant(0.5) : .constant(0),
                frameLimit: isLowFrameRateEnabled ? 30 : 60
            )
            .opacity(0.5)
        } else {
            ColorfulView(
                color: .constant(ColorfulPreset.aurora.colors),
                speed: isAnimatedBackgroundEnabled ? .constant(0.5) : .constant(0),
                frameLimit: isLowFrameRateEnabled ? 30 : 60
            )
            .opacity(0.25)
        }
    }

    var body: some View {
        Group {
            self.colorfulView
        }
        .background(Color(PlatformColor.systemBackground))
        .ignoresSafeArea()
    }
}
