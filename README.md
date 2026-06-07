# 🇪🇨 Ecuador Turístico - Flutter App

Una aplicación móvil interactiva desarrollada en **Flutter** que funciona como una guía de los destinos turísticos más emblemáticos del Ecuador. Los usuarios pueden explorar sitios, marcarlos como favoritos y obtener rutas directas de navegación hacia los destinos utilizando su ubicación en tiempo real.

## ✨ Características Principales

* **🗺️ Exploración de Destinos:** Un catálogo con información rica sobre lugares como Galápagos, el Centro Histórico de Quito, Cuenca, la Amazonía, entre otros.
* **❤️ Sistema de Favoritos:** Permite a los usuarios marcar y desmarcar sitios como favoritos. Incluye un contador dinámico en la barra superior (AppBar) y animaciones fluidas en la interfaz.
* **📍 Geolocalización en Tiempo Real:** Integración con el GPS del dispositivo para obtener la ubicación actual del usuario.
* **🚗 Trazado de Rutas (Google Maps):** Calcula la ruta exacta desde la ubicación del usuario hasta el destino turístico abriendo Google Maps automáticamente.
* **📌 Visualización de Coordenadas:** Muestra las coordenadas exactas de cada sitio (Latitud y Longitud) y permite ver el "pin" en el mapa sin necesidad de calcular ruta.
* **🎨 Interfaz Moderna e Intuitiva:** Diseño limpio basado en Material 3, con una paleta de colores personalizada inspirada en la naturaleza (tonos verdes y cálidos).

## 🛠️ Tecnologías y Dependencias

* **Framework:** [Flutter](https://flutter.dev/)
* **Lenguaje:** Dart
* **Paquetes de terceros:**
  * [`geolocator`](https://pub.dev/packages/geolocator) - Para manejar los permisos de ubicación y obtener la latitud/longitud del usuario.
  * [`url_launcher`](https://pub.dev/packages/url_launcher) - Para ejecutar esquemas de URL y redirigir al usuario hacia la aplicación de Google Maps.

## 📂 Estructura Lógica del Código

Aunque el código está integrado en un solo archivo principal, sigue una arquitectura modular clara:
* **`AppColors`**: Define la paleta de colores global de la app.
* **`Models` (`TouristSite`)**: Define la estructura de datos de un sitio turístico.
* **`Data` (`kTouristSites`)**: Lista estática (mock data) con 10 sitios turísticos populares.
* **`Services` (`LocationService`)**: Aísla la lógica de geolocalización, peticiones de permisos y lanzamiento de URLs externas.
* **`Screens` & `Widgets`**: Interfaz de usuario dividida en componentes pequeños y reutilizables (`_SiteCard`, `_FavoriteButton`, `_RouteButton`, etc.).

## 🚀 Instalación y Uso

1. **Clonar el repositorio:**
   ```bash
   git clone https://github.com/DavidCG2004/EcuadorTuristico.git
   cd ecuador-turistico
   ```

2. **Obtener dependencias:**
   ```bash
   flutter pub get
   ```

3. **Configurar los Assets (Imágenes):**
   Asegúrate de crear una carpeta llamada `images/` en la raíz del proyecto y colocar las imágenes de los sitios turísticos referenciadas en el código (`galapagos.jpg`, `quito.jpg`, etc.). Luego, regístralas en tu `pubspec.yaml`:
   ```yaml
   flutter:
     uses-material-design: true
     assets:
       - images/
   ```

4. **Ejecutar la app:**
   ```bash
   flutter run
   ```

## ⚙️ Configuración de Permisos (Importante)

Dado que la aplicación utiliza el GPS y abre aplicaciones externas, debes configurar los permisos nativos en Android y iOS.

### Para Android
En el archivo `android/app/src/main/AndroidManifest.xml`, añade los siguientes permisos dentro de la etiqueta `<manifest>`:

```xml
<!-- Permisos de Ubicación -->
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />

<!-- Para permitir a url_launcher abrir URLs de Google Maps -->
<queries>
  <intent>
    <action android:name="android.intent.action.VIEW" />
    <data android:scheme="https" />
  </intent>
</queries>
```

### Para iOS
En el archivo `ios/Runner/Info.plist`, añade las siguientes claves dentro del `<dict>` principal:

```xml
<!-- Permiso de Ubicación -->
<key>NSLocationWhenInUseUsageDescription</key>
<string>La aplicación necesita acceso a tu ubicación para trazar rutas hacia los destinos turísticos.</string>

<!-- Para permitir abrir Google Maps / URLs -->
<key>LSApplicationQueriesSchemes</key>
<array>
  <string>https</string>
  <string>http</string>
</array>
```

## 📱 Capturas de Pantalla
<p align="center">
  <br>
<img width="220" alt="WhatsApp Image 2026-06-07 at 6 42 55 PM (1)" src="https://github.com/user-attachments/assets/6abeea0e-5732-48a3-b250-9fe1f428db12" />
<img width="220" alt="WhatsApp Image 2026-06-07 at 6 42 55 PM" src="https://github.com/user-attachments/assets/a1111ade-3db6-485d-b7e3-c4005aa1ed72" />
</p>
---
Hecho con ❤️ para promover el turismo en Ecuador.
