
# Vox UI Kit

A modular UI kit for the **Vox App**, providing reusable and styled UI components for Flutter applications.

## Features

- 📦 Pre-designed buttons with consistent styling  
- 🎨 Customizable UI elements with theme support  
- 🔗 Easy integration into existing projects

## Installation

To install and use the **Vox UI Kit** in your Flutter project, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  vox_ui_kit:
    git:
      url: https://voxfordogs.gitlab.yandexcloud.net/frontend/mobile/ui_kit.git
      ref: dev
```

## Components

Below is the list of available and upcoming components with preview images:

### Links

- [Buttons](#buttons)
- [Fields](#fields)
- [Usage](#usage)

## Buttons

| Component Name              | Status   |  Example Preview      |
|-----------------------------|----------|-----------------------|
| **PrimaryFilledButton**     | ✅ Ready |![PrimaryFilledButton](https://i.imgur.com/f91gVeU.png) |
| **SecondaryFilledButton**   | ✅ Ready |![SecondaryFilledButton](https://i.imgur.com/prIR80L.png) |
| **PrimaryElevatedButton**   | ✅ Ready |![PrimaryElevatedButton](https://i.imgur.com/b77nqsf.png) |
| **SecondaryElevatedButton** | ✅ Ready |![SecondaryElevatedButton](https://i.imgur.com/GFyFwpy.png) |
| **IconTextButton**          | ✅ Ready |![IconTextButton](https://i.imgur.com/w5VphNX.png) |
| **RadioButton**             | ✅ Ready |![RadioButton](https://i.imgur.com/sGXjby3.png) |

## Fields

| Component Name              | Status   |  Example Preview      |
|-----------------------------|----------|-----------------------|
| **PrimaryTextField**     | ✅ Ready |![PrimaryTextField](https://i.imgur.com/yNiOToc.jpeg) |
| **PrimaryDatePickerField**     | ✅ Ready |![PrimaryDatePickerField](https://i.imgur.com/Vz332cZ.jpeg) |
| **PrimaryDropdownField**     | ✅ Ready |![PrimaryDropdownField](https://i.imgur.com/GSRPsJH.jpeg) |
| **PrimarySelectField**     | ✅ Ready |![PrimarySelectField](https://i.imgur.com/TNSbPWh.png) |

[//]: <> (🚧 In progress)

## Usage

To style text using `ThemeStyles`:

```dart
  Text(
    "Example",
    style: ThemeStyles.s14h500(Colors.white), // Color is optional
  )
```

To set color using `ThemeColors`:

```dart
  Container(
    color: ThemeColors.black900,
  )
```
