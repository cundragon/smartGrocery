# Smart Grocery App

## Project Description
The Smart Grocery app is designed to enhance users' food options by leveraging insights from fellow users and offering personalized meal recommendations. The app integrates various sources, such as phone GPS, user data, and barcode scanners, to provide a comprehensive and engaging user experience. Smart Grocery aims to inspire users to explore diverse cuisines across various cultures, fostering a culinary journey that goes beyond boundaries. Users can contribute their own recipes, creating a dynamic exchange within communities. The app not only broadens users' recipe horizons but also customizes suggestions based on individual preferences and recommends nearby grocery stores in their community.

## Features
- User Preferences: Personalize the app experience based on individual preferences.
- Share Personal Recipes: Allow users to contribute their own recipes to the community.
- Stores Near You: Recommend nearby grocery stores based on the user's location.
- All Recipes: Explore a wide variety of recipes from different cultures and cuisines.
- Scan Barcode: Scan product barcodes to identify ingredients and find related recipes.
- Community Page: Engage with fellow users, share recipes, and participate in discussions.

## Installation
1. Clone the repository:
   ```
   git clone https://github.com/cundragon/smartGrocery.git
   ```
2. Navigate to the project directory:
   ```
   cd smartGrocery/smartGrocery
   ```
3. Install dependencies:
   ```
   flutter pub get
   ```
4. Run the app:
   ```
   flutter run
   ```

## Testing
The Smart Grocery application undergoes thorough testing and inspection to ensure the reliability and functionality of key features. The majority of the features, including HomeScreen, NavBar, authentication, recipe adding, Community Page, and log-out, have successfully passed tests and meet the criteria for a smooth user experience. Through inspection sessions, the app has been further refined by addressing code issues, optimizing image loading, improving error messages, and enhancing button responsiveness.

## Known Issues
- The "Scan Barcode" feature is currently inactive due to challenges in ingredient source identification.
- The "Store Near You" feature is impeded by the lack of real store data.

## Future Enhancements
- Resolve the "Scan Barcode" feature by improving ingredient source identification.
- Integrate real store data to enhance the "Store Near You" feature.
- Implement additional features and improvements based on user feedback and evolving requirements.

## Credits
This project is based on the work of Folga, Agnes, Aditya Nadkarni, Gabriel Nicdao, and Megh Patel, as detailed in the Smart Grocery Project Report from October 2022.

## License
This project is licensed under the [MIT License](LICENSE).
