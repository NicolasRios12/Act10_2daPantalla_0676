import 'package:flutter/material.dart';

void main() => runApp(DogClubApp());

class DogClubApp extends StatelessWidget {
  const DogClubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF0F4F8), // Fondo App
      ),
      home: const DogClubHome(),
    );
  }
}

class DogClubHome extends StatelessWidget {
  const DogClubHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1976D2), // AppBar
        leading: const Icon(Icons.pets, color: Colors.white), // Dog paw
        title: const Text("Dog Club", style: TextStyle(color: Colors.white)),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.white), // Botón 3 líneas
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      // Menú vertical que despliega de la derecha
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF0D47A1)),
              child: Text('Menú Dog Club', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(leading: Icon(Icons.person), title: Text('Perfil')),
            ListTile(leading: Icon(Icons.settings), title: Text('Ajustes')),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // --- SECCIÓN IMAGEN CENTRAL ---
            Center(
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 200,
                    decoration: BoxDecoration(
                      color: const Color(0xFFBBDEFB), // Acento
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        image: NetworkImage('https://raw.githubusercontent.com/NicolasRios12/imagenes-para-flutter-6I-fecha-11-feb-2026/refs/heads/main/casa1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0D47A1)),
                      onPressed: () {},
                      child: const Text("Ver foto", style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // --- TARJETA PERFIL PAULINA ---
            Card(
              elevation: 0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFFBBDEFB), // Color de fondo (Acento) mientras carga
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          // REEMPLAZA ESTA URL CON LA QUE DESEES
                          image: NetworkImage('https://raw.githubusercontent.com/NicolasRios12/imagenes-para-flutter-6I-fecha-11-feb-2026/refs/heads/main/foto1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Opcional: Icono de respaldo si la imagen falla o está vacía
                      child: null, 
                    ),
                    const SizedBox(width: 15),
                    const SizedBox(
                      height: 80, // Misma altura que el contenedor
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Paulina Zugasti", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          Text("33 reseñas", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // --- SECCIÓN SERVICIOS Y TARIFAS ---
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                children: [
                  const Text("Servicios y tarifas", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Hospedaje en casa del cuidador"),
                      Text("Desde 260 x noche", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0D47A1)),
                      onPressed: () {},
                      child: const Text("Contactar a Paulina", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // --- SECCIÓN RESEÑAS ---
            const Row(
              children: [
                Text("33 reseñas", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 10),
                Icon(Icons.star, color: Colors.amber, size: 18),
                Icon(Icons.star, color: Colors.amber, size: 18),
                Icon(Icons.star, color: Colors.amber, size: 18),
                Icon(Icons.star, color: Colors.amber, size: 18),
              ],
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 0,
              color: Colors.white,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFFBBDEFB),
                  child: Icon(Icons.face, color: Color(0xFF1976D2)),
                ),
                title: const Text("Sonia Valdez"),
                subtitle: const Text("Octubre 15, 2025"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}