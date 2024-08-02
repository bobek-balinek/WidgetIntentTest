//
//  AppIntent.swift
//  Widgets
//
//  Created by Przemyslaw Bobak on 17/07/2024.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

    // An example configurable parameter.
    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
}

struct LaunchAppIntent: AppIntent {
	static var title: LocalizedStringResource = "ASDF"
	static var description = IntentDescription("This is an example widget.")

	@Parameter(title: "Favorite Emoji", default: "😃")
	var favoriteEmoji: String

	init() {
		
	}

	init(favoriteEmoji: String) {
		self.favoriteEmoji = favoriteEmoji
	}

	static var openAppWhenRun: Bool = true

	func perform() async throws -> some IntentResult {
		return .result()
	}
}
