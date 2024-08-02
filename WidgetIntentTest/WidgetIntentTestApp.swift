//
//  WidgetIntentTestApp.swift
//  WidgetIntentTest
//
//  Created by Przemyslaw Bobak on 17/07/2024.
//

import AppIntents
import SwiftUI

// Project Overview
//
// 1. I used the Xcode's default `File > New` to create a new project
// 2. I have used `Add Target > Widgets` and checked "configurable" checkbox to arrive at this example widget implementation
// 3. Described bug is specific to cold-start of the iOS application.
//
// IMPORTANT NOTES FOR CORRECTLY REPLICATING THE ISSUE
//
// 1. Select `AutomaticLaunch` scheme to launch the app and hit Run.
// 2. Create a widget on the home screen
// 3. Tap the widget while the application is running in the background.
// 4. Observe expected result: Emoji presented on the widget appears in the application's content view
// 5. Stop the application and select the "WaitForLaunch" scheme
// 6. Run the application (Notice the "Waiting to launch […]" message
// 7. Tap the widget present on the home screen
// 8. Observe the bug: Application crashed at the Line 51.

@main
struct WidgetIntentTestApp: App {

		/// `favouriteEmoji` is coming from the `ConfigurationAppIntent` managed by home screen widgets.
    @State private var favouriteEmoji: String?

		/// Name of the user activity matching the app intent
		private let intentActivityName = String(describing: ConfigurationAppIntent.self)

		var body: some Scene {
				WindowGroup {
						ContentView(favouriteEmoji: favouriteEmoji)
								.onContinueUserActivity(intentActivityName) { userActivity in
										guard let intent = userActivity.widgetConfigurationIntent(of: ConfigurationAppIntent.self) else {
													/// Intent is `nil` when the user activity `launches the app for the first time`.
													/// I would have expected this to work given the user activity's name clearly matches the Intent's name
													fatalError("Expected intent but received `nil` - this should not have happened.")
										}

										favouriteEmoji = intent.favoriteEmoji
								}
				}
		}

//        WindowGroup {
//						/// Emoji is passed down for presentation purposes.
//            ContentView(favouriteEmoji: favouriteEmoji)
//
//                // As per documentation's recommendation we use `onContinueUserActivity` to handle the intent activity.
//                // REF: https://developer.apple.com/documentation/widgetkit/making-a-configurable-widget#Access-customized-values-in-your-app
//								.onContinueUserActivity(intentActivityName) { userActivity in
//
//									/// We use the `widgetConfigurationIntent` to get intent's configuration to fetch widget's configuration data for use in the app.
//									///
//									/// ```
//									/// In your app’s code that handles the user activity, such as onContinueUserActivity(_:perform:) for a SwiftUI app or scene(_:continue:) for a UIKit app, use the widgetConfigurationIntent(of:) method to access the widget’s intent.
//									/// ```
//									///
//									///
//									guard let intent = userActivity.widgetConfigurationIntent(of: ConfigurationAppIntent.self) else {
//												/// Intent is `nil` when the user activity `launches the app for the first time`.
//												/// I would have expected this to work given the user activity's name clearly matches the Intent's name
//                        fatalError("Expected intent but received `nil` - this should not have happened.")
//                    }
//
//										/// Intent has been successfully retrieved `when the app is running in the background`.
//                    favouriteEmoji = intent.favoriteEmoji
//                }
//        }
//
//
//
//    }
}
