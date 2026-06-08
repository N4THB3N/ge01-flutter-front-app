# ge01_crud_front

Aplicación móvil desarrollada con **Flutter** para el manejo básico de clientes,
incluyendo las operaciones **CRUD** (Crear, Leer, Actualizar y Eliminar).

---

## 🛠️ Requisitos previos

Antes de comenzar, asegúrate de tener instalado lo siguiente:

- [Flutter 3.12.1](https://docs.flutter.dev/get-started/install) — versión con la que fue compilado el proyecto.
- [Android Studio](https://developer.android.com/studio?hl=es-419) — necesario para compilar y emular la aplicación.
- [Visual Studio Code](https://code.visualstudio.com/) — editor recomendado para ejecutar el proyecto.
- Extensiones de VS Code recomendadas:
  - [Flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter)
  - [Dart](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code)

---

## 🚀 Instalación y ejecución

Sigue estos pasos en orden para poner en marcha el proyecto:

### 1. Configurar Android Studio
Instala y configura Android Studio desde el siguiente enlace:
👉 [Descargar Android Studio](https://developer.android.com/studio?hl=es-419)

### 2. Configurar un emulador Android
Crea y configura un dispositivo virtual (AVD) siguiendo esta guía:
👉 [Administrar dispositivos virtuales](https://developer.android.com/studio/run/managing-avds?hl=es-419)

### 3. Configurar la URL de la API
En el archivo `lib/constants.dart`, actualiza la variable `apiUrl` con la
dirección IP de tu máquina:

```dart
const String apiUrl = '192.168.1.XXX'; // 👈 Reemplaza con tu IP local
```

> ⚠️ **Importante:** Si usas un emulador de Android, usa `10.0.2.2` en lugar
> de tu IP local. Si usas un dispositivo físico, usa la IP de tu máquina en
> la red local.

### 4. Instalar dependencias
Ejecuta el siguiente comando en la raíz del proyecto:

```bash
flutter pub get
```

### 5. Ejecutar el proyecto
Asegúrate de tener el emulador corriendo, luego ejecuta:

```bash
flutter run
```

O presiona **F5** desde Visual Studio Code.

---

## 📦 Tecnologías utilizadas

| Tecnología | Uso |
|---|---|
| Flutter 3.12.1 | Framework principal de desarrollo móvil |
| Dart | Lenguaje de programación |
| Provider | Manejo de estado |
| HTTP | Consumo de la API REST |

---

## 🔗 Proyecto relacionado

Este frontend consume la API REST del siguiente proyecto:
👉 [ge01-microservice-v1](https://github.com/) <!-- Reemplaza con el link real -->
