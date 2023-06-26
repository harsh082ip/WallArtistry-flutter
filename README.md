# Wall Artistry

Welcome to Wall Artistry, the ultimate wallpaper app that brings creativity and inspiration to your digital devices!

  


https://github.com/harsh082ip/WallArtistry-flutter/assets/109286547/21dc7618-cf9a-4b06-88fd-8024bd1cb82c








## Screenshots



## Features

- **Diverse Wallpaper Collection:** Explore a vast library of high-quality wallpapers meticulously curated to cater to a wide range of tastes and preferences. From breathtaking landscapes and captivating cityscapes to mesmerizing abstract art and adorable pets, Wall Artistry offers something for everyone.

- **Seamless Download and Set-Up:** Downloading and setting up your desired wallpaper is a breeze with Wall Artistry. Simply browse through the collection, find the perfect image, and with a single tap, download and apply it as your wallpaper. Instantly revitalize your device with a fresh and captivating look.

- **Categories and Search:** To make your search for the perfect wallpaper effortless, Wall Artistry provides easy-to-navigate categories, ensuring you can quickly find wallpapers that match your interests. Additionally, utilize the powerful search feature to discover wallpapers by specific themes, colors, or keywords.

- **Daily Wallpaper Refresh:** Never run out of fresh wallpapers to adorn your screen. Wall Artistry automatically updates its collection with new and exciting wallpapers on a daily basis. Start each day with a delightful surprise, showcasing beautiful imagery that complements your mood.

- **Favorites and History:** Found a wallpaper you absolutely love? Mark it as a favorite for easy access later. Wall Artistry also keeps track of your wallpaper history, allowing you to revisit and reapply your previously used wallpapers with just a few taps.

- **Optimized Performance:** Wall Artistry is designed to provide a seamless user experience. It ensures smooth browsing, quick downloads, and efficient storage management, optimizing your device's performance while enhancing your visual experience.

## Installation

1. Clone the repository: `git clone https://github.com/your-username/wall-artistry.git`
2. Navigate to the project directory: `cd wall-artistry`
3. Set `compileSdkVersion` in `android/app/build.gradle` to 33.
4. Install dependencies: `flutter pub get`
5. Run the app: `flutter run`

## Configuration

To run the app successfully, you need to obtain an API key from [Pexels](https://www.pexels.com/api/). Follow the steps below to integrate the Pexels API:

1. Visit the [Pexels API website](https://www.pexels.com/api/) and sign up for an account.
2. Once logged in, go to the "API Settings" page to obtain your API key.
3. Open the project in your preferred code editor.
4. Navigate to the file `lib/utils/api_key.dart`.
5. Replace `YOUR_API_KEY` with your actual Pexels API key in `api.dart`.

```dart
headers: {
    'Authorization':
        '[YOUR API KEY]'
  },
```
6. Save the file.

## Contributions

Contributions are welcome! If you'd like to contribute to Wall Artistry, please follow these steps:

1. Fork the repository.
2. Create a new branch: `git checkout -b my-feature-branch`
3. Make your changes and commit them: `git commit -m 'Add new feature`
4. Push the branch to your forked repository: `git push origin my-feature-branch`
5. Create a pull request detailing your changes.

## Contact

If you have any questions or feedback, feel free to reach me at harshhvstech1975@gmail.com

I am constantly working on improving Wall Artistry and would love to hear from you. Share your suggestions, report any issues you encounter, or simply reach out to connect.

Happy wallpapering! 🖼️✨
