import 'package:sqflite/sqflite.dart';

Future<void> initializeDatabase(Database db) async {
  // Insertar datos predeterminados en la tabla Furniture
  // Sillas
  await db.insert('Furniture', {
    'category': 'Sillas',
    'description': 'Silla bambú',
    'stock': 1000,
    'price': 15.00,
    'image': 'silla_bambu.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Sillas',
    'description': 'Silla ceremonia',
    'stock': 1000,
    'price': 10.00,
    'image': 'silla_ceremonia.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Sillas',
    'description': 'Silla tiffany transparente',
    'stock': 1000,
    'price': 10.00,
    'image': 'silla_tiffany_transparente.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Sillas',
    'description': 'Silla tiffany dorada',
    'stock': 1000,
    'price': 10.00,
    'image': 'silla_tiffany_dorada.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Sillas',
    'description': 'Silla tiffany blanca',
    'stock': 1000,
    'price': 10.00,
    'image': 'silla_tiffany_blanca.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Sillas',
    'description': 'Silla napoleón',
    'stock': 1000,
    'price': 12.00,
    'image': 'silla_napoleon.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Sillas',
    'description': 'Silla garrotcha blanca',
    'stock': 1000,
    'price': 10.00,
    'image': 'silla_garrotcha_blanca.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Sillas',
    'description': 'Silla picnic',
    'stock': 1000,
    'price': 10.00,
    'image': 'silla_picnic.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Sillas',
    'description': 'Taburete tolix negro',
    'stock': 1000,
    'price': 10.00,
    'image': 'taburete_tolix_negro.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Sillas',
    'description': 'Taburete tolix blanco',
    'stock': 1000,
    'price': 10.00,
    'image': 'taburete_tolix_blanco.jpg'
  });

  // Mesas
  await db.insert('Furniture', {
    'category': 'Mesas',
    'description': 'Mesa redonda plegable 150 y 180 cm',
    'stock': 150,
    'price': 100.00,
    'image': 'mesa_redonda_plegable.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Mesas',
    'description': 'Mesa rectangular plegable 200 x 90 cm',
    'stock': 150,
    'price': 100.00,
    'image': 'mesa_rectangular_plegable.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Mesas',
    'description': 'Mesa de madera plegable 50 y 70 cm',
    'stock': 100,
    'price': 80.00,
    'image': 'mesa_madera_plegable.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Mesas',
    'description': 'Mesa alta plegable 80 diametro x 110 altura',
    'stock': 100,
    'price': 80.00,
    'image': 'mesa_alta_plegable.jpg'
  });

  // Mantelería
  await db.insert('Furniture', {
    'category': 'Mantelería',
    'description': 'Mantelería serie hilo modelo arena',
    'stock': 200,
    'price': 50.00,
    'image': 'manteleria_hilo_arena.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Mantelería',
    'description': 'Mantelería serie hilo modelo vichy',
    'stock': 200,
    'price': 50.00,
    'image': 'manteleria_hilo_vichy.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Mantelería',
    'description': 'Mantelería serie hilo celeste',
    'stock': 200,
    'price': 50.00,
    'image': 'manteleria_hilo_celeste.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Mantelería',
    'description': 'Mantelería serie hilo gris',
    'stock': 200,
    'price': 50.00,
    'image': 'manteleria_hilo_gris.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Mantelería',
    'description': 'Mantelería serie hilo rosa',
    'stock': 200,
    'price': 50.00,
    'image': 'manteleria_hilo_rosa.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Mantelería',
    'description': 'Mantelería serie strech negro',
    'stock': 200,
    'price': 50.00,
    'image': 'manteleria_strech_negro.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Mantelería',
    'description': 'Mantelería serie strech blanco',
    'stock': 200,
    'price': 50.00,
    'image': 'manteleria_strech_blanco.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Mantelería',
    'description': 'Camino de mesa rosa suave',
    'stock': 200,
    'price': 30.00,
    'image': 'camino_rosa_suave.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Mantelería',
    'description': 'Camino de mesa arena',
    'stock': 200,
    'price': 30.00,
    'image': 'camino_arena.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Mantelería',
    'description': 'Camino de mesa marrón',
    'stock': 200,
    'price': 30.00,
    'image': 'camino_marron.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Mantelería',
    'description': 'Camino de mesa ancla',
    'stock': 200,
    'price': 30.00,
    'image': 'camino_ancla.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Mantelería',
    'description': 'Mantel palmera',
    'stock': 100,
    'price': 50.00,
    'image': 'mantel_palmera.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Mantelería',
    'description': 'Cubre mantel celeste',
    'stock': 150,
    'price': 30.00,
    'image': 'cubre_mantel_celeste.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Mantelería',
    'description': 'Funda elástica blanca',
    'stock': 100,
    'price': 30.00,
    'image': 'funda_blanca.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Mantelería',
    'description': 'Funda elástica negra',
    'stock': 100,
    'price': 30.00,
    'image': 'funda_negra.jpg'
  });

  // Menaje Y Vajillas
  await db.insert('Furniture', {
    'category': 'Menaje Y Vajillas',
    'description': 'Copa martini',
    'stock': 200,
    'price': 3.00,
    'image': 'copa_martini.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Menaje Y Vajillas',
    'description': 'Copa balón 62 cl',
    'stock': 200,
    'price': 3.00,
    'image': 'copa_balon.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Menaje Y Vajillas',
    'description': 'Copa cava 17 cl',
    'stock': 200,
    'price': 3.00,
    'image': 'copa_cava.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Menaje Y Vajillas',
    'description': 'Copa princesa 42 cl',
    'stock': 200,
    'price': 3.00,
    'image': 'copa_princesa.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Menaje Y Vajillas',
    'description': 'Copa syrah 47 cl',
    'stock': 200,
    'price': 3.00,
    'image': 'copa_syrah.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Menaje Y Vajillas',
    'description': 'Jarra 1 L',
    'stock': 100,
    'price': 20.00,
    'image': 'jarra.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Menaje Y Vajillas',
    'description': 'Copa de helado',
    'stock': 200,
    'price': 3.00,
    'image': 'copa_helado.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Menaje Y Vajillas',
    'description': 'Juego de café modelo new augusta',
    'stock': 200,
    'price': 20.00,
    'image': 'juego_cafe_augusta.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Menaje Y Vajillas',
    'description': 'Taza café modelo new augusta',
    'stock': 200,
    'price': 12.00,
    'image': 'taza_cafe_augusta.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Menaje Y Vajillas',
    'description': 'Vaso sidra 50 cl',
    'stock': 200,
    'price': 3.00,
    'image': 'vaso_sidra.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Menaje Y Vajillas',
    'description': 'Vaso cónico 47 cl',
    'stock': 200,
    'price': 3.00,
    'image': 'vaso_conico.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Menaje Y Vajillas',
    'description': 'Vaso merlot 17 cl',
    'stock': 200,
    'price': 3.00,
    'image': 'vaso_merlot.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Menaje Y Vajillas',
    'description': 'Plato hondo new augusta',
    'stock': 200,
    'price': 10.00,
    'image': 'plato_hondo_augusta.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Menaje Y Vajillas',
    'description': 'Vajilla modelo trenzado',
    'stock': 200,
    'price': 10.00,
    'image': 'vajilla_trenzado.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Menaje Y Vajillas',
    'description': 'Vajilla modelo new augusta',
    'stock': 200,
    'price': 10.00,
    'image': 'vajilla_augusta.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Menaje Y Vajillas',
    'description': 'Presentación cristal filo rosa',
    'stock': 200,
    'price': 5.00,
    'image': 'presentacion_filo_rosa.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Menaje Y Vajillas',
    'description': 'Presentación cristal transparente',
    'stock': 200,
    'price': 5.00,
    'image': 'presentacion_transparente.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Menaje Y Vajillas',
    'description': 'Presentación cristal cobre',
    'stock': 200,
    'price': 5.00,
    'image': 'presentacion_cobre.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Menaje Y Vajillas',
    'description': 'Presentación pvc dorado',
    'stock': 200,
    'price': 5.00,
    'image': 'presentacion_dorado.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Menaje Y Vajillas',
    'description': 'Presentación pvc plateado',
    'stock': 200,
    'price': 5.00,
    'image': 'presentacion_plateado.jpg'
  });

  // Cubertería
  await db.insert('Furniture', {
    'category': 'Cubertería',
    'description': 'Cubertería modelo 86 acero inoxidable',
    'stock': 300,
    'price': 15.00,
    'image': 'cuberteria_acero.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Cubertería',
    'description': 'Cubertería modelo comas cobre',
    'stock': 300,
    'price': 15.00,
    'image': 'cuberteria_cobre.jpg'
  });

  await db.insert('Furniture', {
    'category': 'Cubertería',
    'description': 'Cubertería modelo comas oro',
    'stock': 300,
    'price': 15.00,
    'image': 'cuberteria_oro.jpg'
  });
}
