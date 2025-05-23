
# 🛍️ FakeStore E-commerce App

Aplicación de comercio electrónico desarrollada con Flutter, que utiliza la Fake Store API para simular un entorno de tienda en línea. Permite a los usuarios explorar productos, ver detalles y gestionar su carrito de compras.

## 📋 Tabla de Contenidos

- [🛍️ FakeStore E-commerce App](#️-fakestore-e-commerce-app)
  - [📋 Tabla de Contenidos](#-tabla-de-contenidos)
  - [✨ Características](#-características)
  - [🛠️ Tecnologías Utilizadas](#️-tecnologías-utilizadas)
  - [📁 Estructura del Proyecto](#-estructura-del-proyecto)
  - [🚀 Instalación y Ejecución](#-instalación-y-ejecución)
  - [📸 Pantallas](#-pantallas)
    - [Lista de Productos:](#lista-de-productos)
    - [Detalle de un producto:](#detalle-de-un-producto)
    - [Carrito de comprar:](#carrito-de-comprar)
    - [Autenticación:](#autenticación)
    - [Registro:](#registro)
  - [📄 Licencia](#-licencia)
- [🧪 Pruebas de integración en `fake_e_commerce` app](#-pruebas-de-integración-en-fake_e_commerce-app)
  - [📁 Estructura de Pruebas](#-estructura-de-pruebas)
  - [🧰 Herramientas Utilizadas](#-herramientas-utilizadas)
  - [🚀 Ejecución de Pruebas](#-ejecución-de-pruebas)
- [📦 Parametrización de la App con JSON](#-parametrización-de-la-app-con-json)
  - [📁 Estructura parametrización](#-estructura-parametrización)
  - [⚠️ Importante:](#️-importante)
- [♿️ Accesibilidad con Semantics en Flutter](#️-accesibilidad-con-semantics-en-flutter)
  - [🧠 Buenas prácticas aplicadas](#-buenas-prácticas-aplicadas)

## ✨ Características

- **Listado de Productos**: Muestra una lista de productos obtenidos desde la Fake Store API.
- **Detalles del Producto**: Visualiza información detallada de cada producto seleccionado.
- **Carrito de Compras**: Permite agregar productos al carrito y gestionar su contenido.
- **Interfaz Responsiva**: Diseño adaptado para diferentes tamaños de pantalla y plataformas.

## 🛠️ Tecnologías Utilizadas

- **[Flutter](https://flutter.dev/)**: Framework de UI para desarrollar aplicaciones nativas multiplataforma.
- **[Dart](https://dart.dev/)**: Lenguaje de programación utilizado por Flutter.
- **[Fake Store Package](https://github.com/Carl0395/fake_store_package/)**: Paquete de Flutter que permite interactuar con la [Fake Store API](https://fakestoreapi.com/) que proporciona datos ficticios de productos para pruebas y desarrollo.
- **[Ecommerce_system_design](https://github.com/Carl0395/ecommerce_system_design)**: Paquete con un sistema de diseño para aplicaciones de comercio electrónico.

## 📁 Estructura del Proyecto

```
fakestore-ecommerce-app/
├── lib/
├── core/                         # Inyección de dependencia, rutas.
├── features/
│   ├── account/                  # Gestión cuenta de usuario
│   │   ├── domain/               # Casos de uso
│   │   └── presentation/         # Widgets, páginas, controladores
│   ├── cart/                     # Lógica del carrito de compras
│   │   ├── domain/
│   │   └── presentation/
│   ├── products/                 # Lógica de productos (catálogo, detalles)
│   │   ├── domain/
│   │   └── presentation/
│   └── shared/                   # Componentes compartidos entre features
│       ├── domain/
│       └── presentation/
└── main.dart                     # Punto de entrada de la app
```

## 🚀 Instalación y Ejecución

Sigue los siguientes pasos para clonar y ejecutar el proyecto en tu entorno local:

1. **Clonar el repositorio**

   ```bash
   git clone https://github.com/Carl0395/fakestore-ecommerce-app.git
   cd fakestore-ecommerce-app
   ```

2. **Instalar dependencias**

   Asegúrate de tener Flutter instalado. Luego, ejecuta:

   ```bash
   flutter pub get
   ```

3. Ejecuta el comando

   ```dart
   dart run build_runner watch -d
   ```
   Para la generación de código de Riverpod
   
4. **Ejecutar la aplicación**

   Para ejecutar la aplicación en un dispositivo o emulador conectado:

   ```bash
   flutter run
   ```

## 📸 Pantallas

### Lista de Productos:

<img src="screenshots/01-products.png" alt="Products List" width="200"/>

Muestra la lista de productos

### Detalle de un producto:

<img src="screenshots/04-detailProduct.png" alt="Products List" width="200"/>

Muestra el detalle de un producto

### Carrito de comprar:

<img src="screenshots/05-cart.png" alt="Products List" width="200"/>

Permite ver el carrito de compras

### Autenticación:

<img src="screenshots/02-login.png" alt="Products List" width="200"/>

Permite autenticar un usuario

### Registro:

<img src="screenshots/03-signUp.png" alt="Products List" width="200"/>

Permite crear una cuenta de usuario

## 📄 Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.


# 🧪 Pruebas de integración en `fake_e_commerce` app

Este paquete incluye una suite de pruebas de integración para garantizar la fiabilidad y robustez de la app. A continuación, se detallan las pruebas implementadas y cómo ejecutarlas.

## 📁 Estructura de Pruebas

Las pruebas se encuentran en el directorio `integration_test/` y cubren los siguientes módulos:

- **`app_test.dart`**: Archivo principal que contiene todas las pruebas
- **`filter_products_test.dart`**: Prueba el flujo de la app al filtrar y encontrar un elemento en la lista
- **`navigate_to_cart_test`**: Prueba navegación hacia el carrito de compra
- **`select_category_test`**: Prueba seleccionar una categoría de productos
- **`show_detail_product_test`**: Prueba visualización del detalle de un producto

## 🧰 Herramientas Utilizadas

- **Framework de Pruebas**: [integration_test](https://docs.flutter.dev/testing/integration-tests)

## 🚀 Ejecución de Pruebas

Para ejecutar todas las pruebas de integración, utiliza el siguiente comando en la raíz del proyecto:

```bash
flutter test integration_test/app_test.dart
```

# 📦 Parametrización de la App con JSON

Esta guía muestra cómo parametrizar una app Flutter leyendo un archivo config.json antes de que la app inicie, y usarlo globalmente con Riverpod.

## 📁 Estructura parametrización

```
fakestore-ecommerce-app/
├── lib/
├── core/                                            
│    ├── app_config/                                 # Gestión cuenta de usuario
│    │   ├── app_config_provider.dart                # Proveedor para al app_config (sobrescrito en main)
│    │   ├── app_config.dart                         # Modelo general del app_config.json
│    │   ├── app_text_config.dart                    # Modelo de textos del app_config.json
│    │   └── app_theme_config.dart                   # Modelo de colores del app_config.json
│    └── extensions/
│        ├── hex_to_color_extension.dart             # Extension de String para converting un color hex a Color
│        └── widget_ref_parametrized_extension.dart  # Extension del WidgetRef para obtener los textos y colores a traves del ConsumerWidget
└── main.dart                                        # Carga del archivo json y sobrescritura del proveedor app_config_provider.dart
```

## ⚠️ Importante:

Estructura del archivo config.json contenido en la carpeta Assets

```json
{
   "text": {
      "appTitle": "Fake Store App",
      // ...
   },
   "theme": {
      "primaryColor": "#14866E",
      // ...
   }
}
```

# ♿️ Accesibilidad con Semantics en Flutter

Este proyecto incluye soporte de accesibilidad utilizando el widget Semantics, el cual permite mejorar la experiencia para personas que usan lectores de pantalla como VoiceOver (iOS) o TalkBack (Android).

✅ ¿Qué se ha implementado?

- Lectura de contenido textual importante: título del producto, precio, calificación.
- Descripción de imágenes: las imágenes del producto están marcadas como contenido visual no decorativo.
- Botones accesibles: el botón de “Añadir al carrito” tiene una etiqueta (label) y pista (hint) clara.
- Navegación por secciones: cada sección del ProductCard puede ser leída de forma independiente por el lector de pantalla.

📌 Ejemplo de uso

```dart
Semantics(
  label: 'Botón añadir al carrito',
  hint: 'Presiona dos veces para agregar',
  button: true,
  child: IconButton(
    icon: Icon(Icons.add_shopping_cart),
    onPressed: () {},
  ),
)
```

## 🧠 Buenas prácticas aplicadas

- Uso de container: true para agrupar semánticas relacionadas.
- Separación clara de secciones con Semantics independientes.
- Inclusión de hint para mejorar la interacción por accesibilidad.

