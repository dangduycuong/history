//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import RswiftResources
import UIKit

private class BundleFinder {}
let R = _R(bundle: Bundle(for: BundleFinder.self))

struct _R {
  let bundle: Foundation.Bundle
  var color: color { .init(bundle: bundle) }
  var image: image { .init(bundle: bundle) }
  var info: info { .init(bundle: bundle) }
  var file: file { .init(bundle: bundle) }
  var nib: nib { .init(bundle: bundle) }
  var storyboard: storyboard { .init(bundle: bundle) }

  func color(bundle: Foundation.Bundle) -> color {
    .init(bundle: bundle)
  }
  func image(bundle: Foundation.Bundle) -> image {
    .init(bundle: bundle)
  }
  func info(bundle: Foundation.Bundle) -> info {
    .init(bundle: bundle)
  }
  func file(bundle: Foundation.Bundle) -> file {
    .init(bundle: bundle)
  }
  func nib(bundle: Foundation.Bundle) -> nib {
    .init(bundle: bundle)
  }
  func storyboard(bundle: Foundation.Bundle) -> storyboard {
    .init(bundle: bundle)
  }
  func validate() throws {
    try self.nib.validate()
    try self.storyboard.validate()
  }

  struct project {
    let developmentRegion = "en"
  }

  /// This `_R.color` struct is generated, and contains static references to 1 colors.
  struct color {
    let bundle: Foundation.Bundle

    /// Color `AccentColor`.
    var accentColor: RswiftResources.ColorResource { .init(name: "AccentColor", path: [], bundle: bundle) }
  }

  /// This `_R.image` struct is generated, and contains static references to 10 images.
  struct image {
    let bundle: Foundation.Bundle

    /// Image `add_to_photos_24px`.
    var add_to_photos_24px: RswiftResources.ImageResource { .init(name: "add_to_photos_24px", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `bia_cat_tong`.
    var bia_cat_tong: RswiftResources.ImageResource { .init(name: "bia_cat_tong", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `dynasty`.
    var dynasty: RswiftResources.ImageResource { .init(name: "dynasty", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `icons8-back`.
    var icons8Back: RswiftResources.ImageResource { .init(name: "icons8-back", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `icons8-facebook`.
    var icons8Facebook: RswiftResources.ImageResource { .init(name: "icons8-facebook", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `icons8-search`.
    var icons8Search: RswiftResources.ImageResource { .init(name: "icons8-search", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `king`.
    var king: RswiftResources.ImageResource { .init(name: "king", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `story`.
    var story: RswiftResources.ImageResource { .init(name: "story", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `territory`.
    var territory: RswiftResources.ImageResource { .init(name: "territory", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `timeline`.
    var timeline: RswiftResources.ImageResource { .init(name: "timeline", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }
  }

  /// This `_R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    let bundle: Foundation.Bundle
    var uiApplicationSceneManifest: uiApplicationSceneManifest { .init(bundle: bundle) }

    func uiApplicationSceneManifest(bundle: Foundation.Bundle) -> uiApplicationSceneManifest {
      .init(bundle: bundle)
    }

    struct uiApplicationSceneManifest {
      let bundle: Foundation.Bundle

      let uiApplicationSupportsMultipleScenes: Bool = false

      var _key: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest"], key: "_key") ?? "UIApplicationSceneManifest" }
      var uiSceneConfigurations: uiSceneConfigurations { .init(bundle: bundle) }

      func uiSceneConfigurations(bundle: Foundation.Bundle) -> uiSceneConfigurations {
        .init(bundle: bundle)
      }

      struct uiSceneConfigurations {
        let bundle: Foundation.Bundle
        var _key: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations"], key: "_key") ?? "UISceneConfigurations" }
        var uiWindowSceneSessionRoleApplication: uiWindowSceneSessionRoleApplication { .init(bundle: bundle) }

        func uiWindowSceneSessionRoleApplication(bundle: Foundation.Bundle) -> uiWindowSceneSessionRoleApplication {
          .init(bundle: bundle)
        }

        struct uiWindowSceneSessionRoleApplication {
          let bundle: Foundation.Bundle
          var defaultConfiguration: defaultConfiguration { .init(bundle: bundle) }

          func defaultConfiguration(bundle: Foundation.Bundle) -> defaultConfiguration {
            .init(bundle: bundle)
          }

          struct defaultConfiguration {
            let bundle: Foundation.Bundle
            var uiSceneConfigurationName: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication"], key: "UISceneConfigurationName") ?? "Default Configuration" }
            var uiSceneDelegateClassName: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate" }
            var uiSceneStoryboardFile: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication"], key: "UISceneStoryboardFile") ?? "Main" }
          }
        }
      }
    }
  }

  /// This `_R.file` struct is generated, and contains static references to 6 resource files.
  struct file {
    let bundle: Foundation.Bundle

    /// Resource file `Person.json`.
    var personJson: RswiftResources.FileResource { .init(name: "Person", pathExtension: "json", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Stories.json`.
    var storiesJson: RswiftResources.FileResource { .init(name: "Stories", pathExtension: "json", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `an_duong_vuong.rtf`.
    var an_duong_vuongRtf: RswiftResources.FileResource { .init(name: "an_duong_vuong", pathExtension: "rtf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `animation_loading.json`.
    var animation_loadingJson: RswiftResources.FileResource { .init(name: "animation_loading", pathExtension: "json", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `dinh_tien_hoang.rtf`.
    var dinh_tien_hoangRtf: RswiftResources.FileResource { .init(name: "dinh_tien_hoang", pathExtension: "rtf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `lac_long_quan.rtf`.
    var lac_long_quanRtf: RswiftResources.FileResource { .init(name: "lac_long_quan", pathExtension: "rtf", bundle: bundle, locale: LocaleReference.none) }
  }

  /// This `_R.nib` struct is generated, and contains static references to 1 nibs.
  struct nib {
    let bundle: Foundation.Bundle

    /// Nib `PersonTableViewCell`.
    var personTableViewCell: RswiftResources.NibReference<PersonTableViewCell> { .init(name: "PersonTableViewCell", bundle: bundle) }

    func validate() throws {

    }
  }

  /// This `_R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    let bundle: Foundation.Bundle
    var launchScreen: launchScreen { .init(bundle: bundle) }
    var main: main { .init(bundle: bundle) }

    func launchScreen(bundle: Foundation.Bundle) -> launchScreen {
      .init(bundle: bundle)
    }
    func main(bundle: Foundation.Bundle) -> main {
      .init(bundle: bundle)
    }
    func validate() throws {
      try self.launchScreen.validate()
      try self.main.validate()
    }


    /// Storyboard `LaunchScreen`.
    struct launchScreen: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = UIKit.UIViewController

      let bundle: Foundation.Bundle

      let name = "LaunchScreen"
      func validate() throws {

      }
    }

    /// Storyboard `Main`.
    struct main: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = BaseNavigationController

      let bundle: Foundation.Bundle

      let name = "Main"

      var baseNavigationController: RswiftResources.StoryboardViewControllerIdentifier<BaseNavigationController> { .init(identifier: "BaseNavigationController", storyboard: name, bundle: bundle) }
      var menuTabbarViewController: RswiftResources.StoryboardViewControllerIdentifier<MenuTabbarViewController> { .init(identifier: "MenuTabbarViewController", storyboard: name, bundle: bundle) }

      func validate() throws {
        if baseNavigationController() == nil { throw RswiftResources.ValidationError("[R.swift] ViewController with identifier 'baseNavigationController' could not be loaded from storyboard 'Main' as 'BaseNavigationController'.") }
        if menuTabbarViewController() == nil { throw RswiftResources.ValidationError("[R.swift] ViewController with identifier 'menuTabbarViewController' could not be loaded from storyboard 'Main' as 'MenuTabbarViewController'.") }
      }
    }
  }
}