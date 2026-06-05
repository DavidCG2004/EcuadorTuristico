import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

// ==================== PALETA GLOBAL ====================

abstract final class AppColors {
  static const primary = Color(0xFF1B4332);
  static const secondary = Color(0xFF40916C);
  static const accentLight = Color(0xFFD8F3E8);
  static const surface = Color(0xFFF8FAF9);
  static const card = Color(0xFFFFFFFF);
  static const textDark = Color(0xFF1B2E22);
  static const textSubtle = Color(0xFF6B7C73);
  static const divider = Color(0xFFE6EFEB);
  static const favActive = Color(0xFFE63946);
  static const favBg = Color(0xFFFFF0F1);
}

// ==================== APP ====================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecuador Turístico',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(
              seedColor: AppColors.primary,
              brightness: Brightness.light,
            ).copyWith(
              primary: AppColors.primary,
              secondary: AppColors.secondary,
              surface: AppColors.surface,
              onSurface: AppColors.textDark,
            ),
        scaffoldBackgroundColor: AppColors.surface,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
        dividerTheme: const DividerThemeData(
          color: AppColors.divider,
          thickness: 1,
          space: 0,
        ),
        useMaterial3: true,
      ),
      home: const TouristSitesScreen(),
    );
  }
}

// ==================== MODELS ====================

class TouristSite {
  const TouristSite({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
    required this.image,
    required this.rating,
    required this.tag,
    required this.latitude,
    required this.longitude,
  });

  final int id;
  final String name;
  final String location;
  final String description;
  final String image;
  final int rating;
  final String tag;
  final double latitude;
  final double longitude;
}

// ==================== DATA ====================

const List<TouristSite> kTouristSites = [
  TouristSite(
    id: 1,
    name: 'Galápagos',
    location: 'Archipiélago de Galápagos',
    description:
        'Archipiélago único en el mundo, declarado Patrimonio Natural de la '
        'Humanidad por la UNESCO. Hogar de especies endémicas como las tortugas '
        'gigantes, iguanas marinas y pinzones de Darwin, que inspiraron la teoría '
        'de la evolución. Sus aguas cristalinas son ideales para el buceo.',
    image: 'images/galapagos.jpg',
    rating: 98,
    tag: 'Galápagos',
    latitude: -0.7052584010754481,
    longitude: -91.01672485235852,
  ),
  TouristSite(
    id: 2,
    name: 'Centro Histórico de Quito',
    location: 'Quito, Pichincha',
    description:
        'El centro histórico mejor conservado de América Latina, declarado primer '
        'Patrimonio Cultural de la Humanidad en 1978. Sus iglesias barrocas, '
        'conventos coloniales y plazas adoquinadas narran cinco siglos de historia viva.',
    image: 'images/quito.jpg',
    rating: 92,
    tag: 'Sierra',
    latitude: -0.2201,
    longitude: -78.5123,
  ),
  TouristSite(
    id: 3,
    name: 'Cotacachi-Cayapas',
    location: 'Imbabura / Esmeraldas',
    description:
        'La mayor reserva ecológica del Ecuador, que abarca desde los páramos '
        'andinos hasta las selvas tropicales del Pacífico. Alberga el volcán '
        'Cotacachi y la laguna de Cuicocha, un cráter volcánico de extraordinaria belleza.',
    image: 'images/cotacachi.jpg',
    rating: 87,
    tag: 'Sierra',
    latitude: -0.30951320343457656,
    longitude: -78.26711374471749,
  ),
  TouristSite(
    id: 4,
    name: 'Cuenca',
    location: 'Cuenca, Azuay',
    description:
        'Conocida como "La Atenas del Ecuador", esta ciudad colonial es Patrimonio '
        'de la Humanidad por su arquitectura neoclásica y barroca. Sus cuatro ríos, '
        'el mercado de artesanías y la producción de sombreros de paja toquilla son '
        'emblemas de su identidad.',
    image: 'images/cuenca.jpg',
    rating: 91,
    tag: 'Sierra',
    latitude: -2.9001,
    longitude: -79.0059,
  ),
  TouristSite(
    id: 5,
    name: 'Amazonia Ecuatoriana',
    location: 'Tena, Napo',
    description:
        'Una de las regiones con mayor biodiversidad del planeta. Comunidades kichwas, '
        'ríos de aguas turquesas y una selva exuberante conforman este paraíso natural. '
        'El rafting en el río Jatunyacu y el avistamiento de fauna son actividades imperdibles.',
    image: 'images/amazonia.jpg',
    rating: 93,
    tag: 'Oriente',
    latitude: -0.9933,
    longitude: -77.8153,
  ),
  TouristSite(
    id: 6,
    name: 'Ruta del Spondylus',
    location: 'Puerto López, Manabí',
    description:
        'Corredor costero que une playas, parques nacionales y culturas ancestrales. '
        'Desde Puerto López se avistan ballenas jorobadas entre junio y octubre, y '
        'se accede al Parque Nacional Machalilla e Isla de la Plata.',
    image: 'images/spondylus.jpg',
    rating: 85,
    tag: 'Costa',
    latitude: -1.5533,
    longitude: -80.8131,
  ),
  TouristSite(
    id: 7,
    name: 'Chimborazo',
    location: 'Riobamba, Chimborazo',
    description:
        'El volcán más alto de Ecuador con 6.268 m y el punto más alejado del '
        'centro de la Tierra por el achatamiento polar. Su reserva faunística '
        'protege vicuñas y cóndores. El tren "Nariz del Diablo" parte desde Riobamba.',
    image: 'images/chimborazo.jpg',
    rating: 90,
    tag: 'Sierra',
    latitude: -1.4692,
    longitude: -78.8176,
  ),
  TouristSite(
    id: 8,
    name: 'Mindo',
    location: 'Mindo, Pichincha',
    description:
        'Uno de los mejores destinos de avistamiento de aves del mundo, con más '
        'de 500 especies registradas. Sus cascadas, mariposas exóticas, plantaciones '
        'de cacao y el teleférico sobre el bosque nublado son imperdibles.',
    image: 'images/mindo.jpg',
    rating: 89,
    tag: 'Sierra',
    latitude: -0.0522,
    longitude: -78.7739,
  ),
  TouristSite(
    id: 9,
    name: 'Parque Nacional Cajas',
    location: 'Cuenca, Azuay',
    description:
        'Un laberinto de más de 235 lagunas glaciares a 4.000 metros sobre el nivel '
        'del mar. Sus paisajes de páramo, trucheras naturales y rutas de trekking '
        'ofrecen una experiencia andina única a solo 30 minutos de Cuenca.',
    image: 'images/cajas.jpg',
    rating: 88,
    tag: 'Sierra',
    latitude: -2.8471626576198443,
    longitude: -79.24801868801458,
  ),
  TouristSite(
    id: 10,
    name: 'Mitad del Mundo',
    location: 'San Antonio, Pichincha',
    description:
        'El monumento que marca la latitud 0°0\'0" divide la Tierra en hemisferios '
        'norte y sur. El complejo incluye el Museo Intiñan, donde se realizan '
        'experimentos físicos únicos en la línea ecuatorial.',
    image: 'images/mitad_mundo.jpg',
    rating: 84,
    tag: 'Sierra',
    latitude: -0.0019961521216092753,
    longitude: -78.4556943617997,
  ),
];

// ==================== SERVICES ====================

/// Encapsula toda la lógica de geolocalización y apertura de mapas.
/// Separar esto de la UI facilita pruebas unitarias y reemplazar
/// la implementación (p. ej. usar un mock en tests).
abstract final class LocationService {
  /// Solicita permisos si es necesario y devuelve la posición actual.
  /// Lanza [LocationServiceDisabledException] o [PermissionDeniedException]
  /// con mensajes listos para mostrar al usuario.
  static Future<Position> getCurrentPosition() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw LocationServiceDisabledException();
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw PermissionDeniedException('Permiso de ubicación denegado.');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      throw PermissionDeniedException(
        'Permiso denegado permanentemente. Actívalo en Ajustes.',
      );
    }

    return Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );
  }

  /// Abre Google Maps con navegación desde [origin] hasta [destination].
  /// Si [origin] es null abre solo el destino (sin ruta).
  static Future<void> openInMaps({
    required double destLat,
    required double destLng,
    required String destLabel,
    Position? origin,
  }) async {
    final Uri uri;

    if (origin != null) {
      // Ruta desde la posición actual hasta el destino
      uri = Uri.parse(
        'https://www.google.com/maps/dir/'
        '${origin.latitude},${origin.longitude}/'
        '$destLat,$destLng',
      );
    } else {
      // Solo muestra el pin del destino
      uri = Uri.parse(
        'https://www.google.com/maps/search/'
        '?api=1&query=$destLat,$destLng&query_place_id=$destLabel',
      );
    }

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('No se pudo abrir Google Maps.');
    }
  }
}

// ==================== SCREENS ====================

class TouristSitesScreen extends StatefulWidget {
  const TouristSitesScreen({super.key});

  @override
  State<TouristSitesScreen> createState() => _TouristSitesScreenState();
}

class _TouristSitesScreenState extends State<TouristSitesScreen> {
  final Set<int> _favoriteSiteIds = {};

  void _toggleFavorite(int siteId) {
    setState(() {
      _favoriteSiteIds.contains(siteId)
          ? _favoriteSiteIds.remove(siteId)
          : _favoriteSiteIds.add(siteId);
    });
  }

  bool _isFavorite(int siteId) => _favoriteSiteIds.contains(siteId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ecuador Turístico'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Badge(
              label: Text(
                '${_favoriteSiteIds.length}',
                style: const TextStyle(fontSize: 11),
              ),
              isLabelVisible: _favoriteSiteIds.isNotEmpty,
              backgroundColor: AppColors.favActive,
              child: const Icon(Icons.favorite_rounded, size: 22),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 12, bottom: 40),
        itemCount: kTouristSites.length,
        itemBuilder: (context, index) {
          final site = kTouristSites[index];
          return _SiteCard(
            site: site,
            isFavorite: _isFavorite(site.id),
            onToggleFavorite: () => _toggleFavorite(site.id),
          );
        },
      ),
    );
  }
}

// ==================== WIDGETS ====================

// ---------- _SiteCard ----------

class _SiteCard extends StatelessWidget {
  const _SiteCard({
    required this.site,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  final TouristSite site;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CardHeader(
            site: site,
            isFavorite: isFavorite,
            onToggleFavorite: onToggleFavorite,
          ),
          const Divider(height: 1),
          _ActionRow(site: site),
          const Divider(height: 1),
          _DescriptionSection(description: site.description),
          const Divider(height: 1),
          _GeoSection(site: site),
        ],
      ),
    );
  }
}

// ---------- _CardHeader ----------

class _CardHeader extends StatelessWidget {
  const _CardHeader({
    required this.site,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  final TouristSite site;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SiteThumbnail(imagePath: site.image),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 2),
                _TagChip(label: site.tag),
                const SizedBox(height: 6),
                Text(
                  site.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_rounded,
                      size: 13,
                      color: AppColors.secondary,
                    ),
                    const SizedBox(width: 2),
                    Expanded(
                      child: Text(
                        site.location,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSubtle,
                          height: 1.3,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          _FavoriteButton(
            isFavorite: isFavorite,
            rating: site.rating,
            onTap: onToggleFavorite,
          ),
        ],
      ),
    );
  }
}

// ---------- _TagChip ----------

class _TagChip extends StatelessWidget {
  const _TagChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.accentLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}

// ---------- _FavoriteButton ----------

class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({
    required this.isFavorite,
    required this.rating,
    required this.onTap,
  });

  final bool isFavorite;
  final int rating;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isFavorite ? AppColors.favBg : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isFavorite
                ? AppColors.favActive.withOpacity(0.3)
                : AppColors.divider,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 220),
              transitionBuilder: (child, anim) =>
                  ScaleTransition(scale: anim, child: child),
              child: Icon(
                isFavorite ? Icons.star_rounded : Icons.star_border_rounded,
                key: ValueKey<bool>(isFavorite),
                color: isFavorite ? AppColors.favActive : AppColors.textSubtle,
                size: 18,
              ),
            ),
            const SizedBox(width: 4),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 220),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: isFavorite ? AppColors.favActive : AppColors.textSubtle,
              ),
              child: Text('$rating'),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------- _ActionRow ----------

class _ActionRow extends StatelessWidget {
  const _ActionRow({required this.site});

  final TouristSite site;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          _ActionButton(
            icon: Icons.call_rounded,
            label: 'Llamar',
            onTap: () {},
          ),
          _VerticalDivider(),
          // El botón RUTA ahora usa geolocalización real
          _RouteButton(site: site),
          _VerticalDivider(),
          _ActionButton(
            icon: Icons.share_rounded,
            label: 'Compartir',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 32, color: AppColors.divider);
  }
}

// ---------- _RouteButton ----------
// Botón especializado: obtiene la posición actual y abre Maps con ruta.

class _RouteButton extends StatefulWidget {
  const _RouteButton({required this.site});

  final TouristSite site;

  @override
  State<_RouteButton> createState() => _RouteButtonState();
}

class _RouteButtonState extends State<_RouteButton> {
  bool _loading = false;

  Future<void> _handleTap() async {
    if (_loading) return;
    setState(() => _loading = true);

    try {
      final position = await LocationService.getCurrentPosition();
      await LocationService.openInMaps(
        destLat: widget.site.latitude,
        destLng: widget.site.longitude,
        destLabel: widget.site.name,
        origin: position,
      );
    } on LocationServiceDisabledException {
      _showError('Activa el GPS del dispositivo e intenta de nuevo.');
    } on PermissionDeniedException catch (e) {
      _showError(e.message ?? 'Permiso de ubicación denegado.');
    } catch (e) {
      _showError('No se pudo abrir la ruta: $e');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: _handleTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _loading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.secondary,
                      ),
                    )
                  : const Icon(
                      Icons.near_me_rounded,
                      color: AppColors.secondary,
                      size: 20,
                    ),
              const SizedBox(height: 4),
              const Text(
                'Ruta',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppColors.secondary,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------- _ActionButton ----------

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: AppColors.secondary, size: 20),
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppColors.secondary,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------- _DescriptionSection ----------

class _DescriptionSection extends StatelessWidget {
  const _DescriptionSection({required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
      child: Text(
        description,
        softWrap: true,
        style: const TextStyle(
          fontSize: 13,
          color: AppColors.textSubtle,
          height: 1.6,
        ),
      ),
    );
  }
}

// ---------- _GeoSection ----------
// Muestra las coordenadas del sitio y un botón para abrir el pin en Maps.

class _GeoSection extends StatelessWidget {
  const _GeoSection({required this.site});

  final TouristSite site;

  String _formatCoord(double value, {required bool isLat}) {
    final dir = isLat ? (value >= 0 ? 'N' : 'S') : (value >= 0 ? 'E' : 'O');
    return '${value.abs().toStringAsFixed(4)}° $dir';
  }

  Future<void> _openPin() async {
    await LocationService.openInMaps(
      destLat: site.latitude,
      destLng: site.longitude,
      destLabel: site.name,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 10, 14, 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: AppColors.accentLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.my_location_rounded,
              size: 16,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Coordenadas',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSubtle,
                    letterSpacing: 0.4,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${_formatCoord(site.latitude, isLat: true)},  '
                  '${_formatCoord(site.longitude, isLat: false)}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),
          // Botón: solo abre el pin, sin calcular ruta
          TextButton.icon(
            onPressed: _openPin,
            icon: const Icon(Icons.map_rounded, size: 15),
            label: const Text('Ver en mapa'),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.secondary,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              textStyle: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: AppColors.accentLight),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------- _SiteThumbnail ----------

class _SiteThumbnail extends StatelessWidget {
  const _SiteThumbnail({required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        imagePath,
        width: 80,
        height: 80,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.accentLight,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.landscape_rounded,
            color: AppColors.secondary,
            size: 32,
          ),
        ),
      ),
    );
  }
}
