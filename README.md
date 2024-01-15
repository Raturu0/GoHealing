# GASCUY TEAM
<br>

# GoHealing
![alt text](https://github.com/Raturu0/GoHealing/blob/main/assets/readme/icon.png?raw=true)

GoHealing is a revolutionary application that makes planning easy
and organize user leisure trips. Some of the features this application has are:
- Ordering recreational tickets online, GoHealing makes it easy for users to get them
tourist attractions even in the palm of your cell phone.
- Souvenir shop. If the tour owner has an official souvenir shop, it will also be provided inside
This application means that users don't need to bother looking for souvenirs because they are already provided
right here.
This application has solutions for 3 of the 17 UN SDGs topics, including:
1. Point 8, Decent Work and Economic Growth.
Helping community MSMEs because tourist attractions are getting busier, then
will open up many new job opportunities for the surrounding community as well. Apart from that, this application will help many tourist attractions that are not well known, thereby providing an opportunity for tourism providers to register their tourist attractions on the GoHealing application, so that they can promote and enliven their tourist attractions.
2. Point 13, Climate Action.
By reducing paper use, we can reduce deforestation and impacts
ecological. This is in line with efforts to reduce carbon emissions
causing climate change.
3. Point 15, Life on Land
By reducing the use of paper on tickets, this innovation will also be possible
mitigating negative impacts on life on land, such as supporting
preserving natural habitats and maintaining biodiversity.
In the end, users will be able to enjoy a fast and fast ticket ordering experience
efficiently, as well as exploring tourism more easily and pleasantly
## Features

- Ticket reservations
- Order Official Souvenirs
  
## Tech
- [VSCODE](https://www.figma.com/) -The main tool for coding of course
- [FLUTTER](flutter.io) - Application design tools
- [PackagaDlutter](pub.dev) - Packages that make application design easier
- [AndroidStudio](https://developer.android.com/studio) - SDK and android simulator
- [Figma](https://developer.android.com/studio) - UI and UX design
- [Firebase](https://firebase.google.com/) - real-time data management and storage

## Preparation
- ### Android Studio
Download Android Studio and some required SDKs according to your device. You can download it [here](https://developer.android.com/studio). After downloading, don't forget to add the environment to the system path according to the instructions.

- ### Flutter 
Also download Flutter at [here](https://docs.flutter.dev/get-started/install). Choose according to your device and don't forget to add the environment bin to your system path.

## Instalation
- Fork our repository or clone with the command:
```sh
git clone https://github.com/Raturu0/GoHealing.git
```
- Download and get the dependencies in the pubspec.yaml file with the command
```sh
flutter pub get
```
- Select the device in the right corner, then choose according to your wishes, it can be real device, chrome, or the Android Studio simulator
- Run the application with the command:
```sh
flutter run
```


# APPLICATION LAYOUTS
Below we show several views of the applications we designed...
<br>

### Description: If there is a DEBUG banner in the top right corner, it means it is a display of the developer's results, but if there is none it means it is a display of Figma which is planned to be developed as well... Below we show the progress we have made and several things that will be we plan for the future:
<br>

### Login and Register
![alt text](https://github.com/Raturu0/GoHealing/blob/main/assets/readme/login.jpg?raw=true)
![alt text](https://github.com/Raturu0/GoHealing/blob/main/assets/readme/register.jpg?raw=true)


### Main menu of the application :
![alt text](https://github.com/Raturu0/GoHealing/blob/main/assets/readme/beranda.jpg?raw=true)

Has 5 navigations, including:
1. Home <br>
2. Souvenirs <br>
3. Tourism <br>
4. History <br>
5. Profile
<br>

### Souvenir Search and Souvenir Details :
![alt text](https://github.com/Raturu0/GoHealing/blob/main/assets/readme/souvenir.jpg)
![alt text](https://github.com/Raturu0/GoHealing/blob/main/assets/readme/detailsouvenir.jpg)
<br>
Description: The data above has been integrated with Firebase, in the form of souvenir names, descriptions, prices, etc. The plan is for this data to be sent by tourism providers who register with the application and entered into Firebase by the developer.

### Tour Search and Tour Details :
![alt text](https://github.com/Raturu0/GoHealing/blob/main/assets/readme/wisata.jpg?raw=true)
![alt text](https://github.com/Raturu0/GoHealing/blob/main/assets/readme/detailwisata.jpg?raw=true)
<br>
Description: The data above has been integrated with Firebase, in the form of place names, descriptions, prices, etc. The plan is for this data to be sent by tourism providers who register with the application and entered into Firebase by the developer.

### History :
![alt text](https://github.com/Raturu0/GoHealing/blob/main/assets/readme/history.jpg?raw=true)
![alt text](https://github.com/Raturu0/GoHealing/blob/main/assets/readme/historynolog.jpg?raw=true)
<br>

### Profile :
![alt text](https://github.com/Raturu0/GoHealing/blob/main/assets/readme/profilenolog.jpg?raw=true)
![alt text](https://github.com/Raturu0/GoHealing/blob/main/assets/readme/profil.jpg?raw=true)
<br>

# FIRESTORE DATABASE 
Below we attach the Firestore database that we are currently using :
![alt text](https://github.com/Raturu0/GoHealing/blob/main/assets/readme/db.jpeg?raw=true)
<br>
Here, we are currently creating 3 collections, namely for:
- DB_order
- DB_tourism
- DB_souvenir
<br>
Where the contents of each collection will later be integrated with the layout of the application, so that the application can display information flexibly and in real time with the help of this Firestore database.

# PLAN OF THINGS THAT WILL BE ADDED:
- Page for Admin/Tourist Providers (Login, Register, Dashboard, chat, Edit tourist and souvenir information)
- User chat with tourist attraction admin


