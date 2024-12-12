import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_example/misc/tile_providers.dart';
import 'package:flutter_map_example/widgets/drawer/menu_drawer.dart';
import 'package:latlong2/latlong.dart';

typedef HitValue = ({String title, String subtitle});

class PolygonPage extends StatefulWidget {
  static const String route = '/polygon';

  const PolygonPage({super.key});

  @override
  State<PolygonPage> createState() => _PolygonPageState();
}

/
class _PolygonPageState extends State<PolygonPage> {

  final LayerHitNotifier<HitValue> _hitNotifier = ValueNotifier(null);
  List<HitValue>? _prevHitValues;
  List<Polygon<HitValue>>? _hoverGons;

  final _polygonsRaw = <Polygon<HitValue>>[ // adding randos from wikimapia api
    Polygon(
      points: const [
        LatLng(28.5562593, 77.1914649),
        LatLng(28.556231, 77.1912718),
        LatLng(28.5561273, 77.1910518),
        LatLng(28.5559671, 77.1908802),
        LatLng(28.5555666, 77.1909606),
        LatLng(28.55543, 77.1909553),
        LatLng(28.5552839, 77.1908695),
        LatLng(28.5549447, 77.1905637),
        LatLng(28.5547373, 77.190274),
        LatLng(28.5546667, 77.1901453),
        LatLng(28.55453, 77.1900648),
        LatLng(28.5544263, 77.1901506),
        LatLng(28.5543274, 77.1903867),
        LatLng(28.5542614, 77.1906656),
        LatLng(28.5542379, 77.1909553),
        LatLng(28.5542473, 77.1913254),
        LatLng(28.5542473, 77.1916527),
        LatLng(28.554219, 77.1918029),
        LatLng(28.5541955, 77.1919692),
        LatLng(28.5540871, 77.1922535),
        LatLng(28.5539646, 77.192409),
        LatLng(28.5538091, 77.1926075),
        LatLng(28.5536819, 77.1927255),
        LatLng(28.5536018, 77.1929133),
        LatLng(28.5535405, 77.193101),
        LatLng(28.5535028, 77.1933317),
        LatLng(28.5536347, 77.1934336),
        LatLng(28.5538374, 77.193498),
        LatLng(28.5541201, 77.1935678),
        LatLng(28.554318, 77.1936107),
        LatLng(28.5545583, 77.1937233),
        LatLng(28.5548033, 77.1938306),
        LatLng(28.5549965, 77.1939325),
        LatLng(28.5550954, 77.193954),
        LatLng(28.5552038, 77.1938843),
        LatLng(28.555298, 77.1937394),
        LatLng(28.5553216, 77.1935838),
        LatLng(28.5553499, 77.1932673),
        LatLng(28.5554583, 77.1928865),
        LatLng(28.5559294, 77.1921784),
        LatLng(28.5561179, 77.1918941),
        LatLng(28.556198, 77.1917492),
      ],
      borderColor: Colors.red,
      borderStrokeWidth: 1,
      color: Colors.yellow.withOpacity(0.05),
      hitValue: (
      title: 'level 3',
      subtitle: 'Depth: 3',
      ),
    ),
    Polygon(
      points: const [
        LatLng(28.550751, 77.184105),
        LatLng(28.551769, 77.185006),
        LatLng(28.557875, 77.187195),
        LatLng(28.557574, 77.187924),
        LatLng(28.560288, 77.189126),
        LatLng(28.558931, 77.19419),
        LatLng(28.558686, 77.19728),
        LatLng(28.557951, 77.200885),
        LatLng(28.557461, 77.200756),
        LatLng(28.557197, 77.201443),
        LatLng(28.555953, 77.201228),
        LatLng(28.555915, 77.200842),
        LatLng(28.55388, 77.200027),
        LatLng(28.553239, 77.199469),
        LatLng(28.553427, 77.198696),
        LatLng(28.546114, 77.195864),
        LatLng(28.547509, 77.191701),
      ],
      borderColor: Colors.red,
      borderStrokeWidth: 1,
      color: Colors.yellow.withOpacity(0.05),
      hitValue: (
      title: 'level 1',
      subtitle: 'Parent',
      ),
    ),
    Polygon(
      points: const [
        LatLng(28.5596988, 77.1912181),
        LatLng(28.5593972, 77.1911001),
        LatLng(28.5595009, 77.1907889),
        LatLng(28.5583795, 77.1903276),
        LatLng(28.5586151, 77.1892869),
        LatLng(28.5574937, 77.1887719),
        LatLng(28.5575879, 77.1884608),
        LatLng(28.5549587, 77.1873021),
        LatLng(28.5535452, 77.1920442),
        LatLng(28.5538279, 77.1921515),
        LatLng(28.553385, 77.1933746),
        LatLng(28.5553828, 77.1941041),
        LatLng(28.5552603, 77.1944904),
        LatLng(28.5561461, 77.1948122),
        LatLng(28.5567304, 77.1925914),
        LatLng(28.5575597, 77.1928918),
        LatLng(28.5578518, 77.1920227),
        LatLng(28.5591051, 77.1924519),
        LatLng(28.5594067, 77.1914219),
        LatLng(28.5596045, 77.191497),
      ],
      borderColor: Colors.red,
      borderStrokeWidth: 1,
      color: Colors.yellow.withOpacity(0.05),
      hitValue: (
      title: 'Level 2',
      subtitle: 'Depth 2',
      ),
    ),
    Polygon(
      points: const [
        LatLng(28.5532907, 77.1935544),
        LatLng(28.5540146, 77.1938511),
        LatLng(28.5540405, 77.1937813),
        LatLng(28.5542737, 77.1938698),
        LatLng(28.554064, 77.1943553),
        LatLng(28.5535457, 77.1941032),
        LatLng(28.5534515, 77.1943097),
        LatLng(28.552584, 77.1939486),
        LatLng(28.5530693, 77.192393),
        LatLng(28.5535523, 77.1926182),
      ],
      borderColor: Colors.red,
      borderStrokeWidth: 1,
      color: Colors.yellow.withOpacity(0.05),
      hitValue: (
      title: 'New Polygon',
      subtitle: 'Newly Added',
      ),
    ),
    Polygon(
      points: const [
        LatLng(28.5529562, 77.1941096),
        LatLng(28.5529562, 77.1935624),
        LatLng(28.5534981, 77.1935624),
        LatLng(28.5534981, 77.1941096),
      ],
      borderColor: Colors.red,
      borderStrokeWidth: 1,
      color: Colors.yellow.withOpacity(0.05),
      hitValue: (
      title: 'Hauz Khas Fort',
      subtitle: 'Hauz Khas Fort',
      ),
    ),
    Polygon(
      points: const [
        LatLng(28.5478906, 77.1924948),
        LatLng(28.5477021, 77.1931599),
        LatLng(28.5473346, 77.1929239),
        LatLng(28.5476173, 77.1924197),
      ],
      borderColor: Colors.red,
      borderStrokeWidth: 1,
      color: Colors.yellow.withOpacity(0.05),
      hitValue: (
      title: 'Rose Garden',
      subtitle: 'Rose Garden',
      ),
    ),
    Polygon(
      points: const [
        LatLng(28.5564242, 77.1918942),
        LatLng(28.5564242, 77.1914811),
        LatLng(28.556787, 77.1914811),
        LatLng(28.556787, 77.1918942),
      ],
      borderColor: Colors.red,
      borderStrokeWidth: 1,
      color: Colors.yellow.withOpacity(0.05),
      hitValue: (
      title: 'tila',
      subtitle: 'tila',
      ),
    ),
    Polygon(
      points: const [
        LatLng(28.556695, 77.1916231),
        LatLng(28.556516, 77.191548),
        LatLng(28.5564689, 77.1917196),
        LatLng(28.5566432, 77.1918054),
      ],
      borderColor: Colors.red,
      borderStrokeWidth: 1,
      color: Colors.yellow.withOpacity(0.05),
      hitValue: (
      title: 'monument protected in delhi list of monument',
      subtitle: 'monument protected in delhi list of monument',
      ),
    ),
    Polygon(
      points: const [
        LatLng(28.5552602, 77.1942006),
        LatLng(28.5543272, 77.1938679),
        LatLng(28.5540635, 77.1944045),
        LatLng(28.5535451, 77.1941577),
        LatLng(28.5534509, 77.1943507),
        LatLng(28.5525556, 77.1939431),
        LatLng(28.5530456, 77.192366),
        LatLng(28.552876, 77.1922051),
        LatLng(28.5524848, 77.1929883),
        LatLng(28.5517688, 77.1927522),
        LatLng(28.5514672, 77.1935462),
        LatLng(28.5523531, 77.1938466),
        LatLng(28.5525556, 77.1951769),
        LatLng(28.5527547, 77.1952038),
        LatLng(28.5529266, 77.1948873),
        LatLng(28.5531694, 77.1951555),
        LatLng(28.5531929, 77.1957429),
        LatLng(28.5540446, 77.1956813),
        LatLng(28.5540352, 77.1958208),
        LatLng(28.5542425, 77.1959817),
        LatLng(28.554491, 77.1959065),
        LatLng(28.5546466, 77.1957161),
        LatLng(28.5550988, 77.1955739),
      ],
      borderColor: Colors.red,
      borderStrokeWidth: 1,
      color: Colors.yellow.withOpacity(0.05),
      hitValue: (
      title: 'Hauz Khas Village',
      subtitle: 'Hauz Khas Village',
      ),
    ),
    Polygon(
      points: const [
        LatLng(28.5535439, 77.1940773),
        LatLng(28.5535015, 77.1941685),
        LatLng(28.5533555, 77.1941148),
        LatLng(28.5534002, 77.1940183),
      ],
      borderColor: Colors.red,
      borderStrokeWidth: 1,
      color: Colors.yellow.withOpacity(0.05),
      hitValue: (
      title: 'entry gate for Hauz Khaz fort',
      subtitle: 'entry gate for Hauz Khaz fort',
      ),
    ),
    Polygon(
      points: const [
        LatLng(28.5523742, 77.1941292),
        LatLng(28.5523695, 77.1941425),
        LatLng(28.5523908, 77.1941399),
      ],
      borderColor: Colors.red,
      borderStrokeWidth: 1,
      color: Colors.yellow.withOpacity(0.05),
      hitValue: (
      title: 'cotton curio,hauz khas village',
      subtitle: 'cotton curio,hauz khas village',
      ),
    ),
    Polygon(
      points: const [
        LatLng(28.5530446, 77.1942182),
        LatLng(28.5529291, 77.1941619),
        LatLng(28.5528961, 77.1942396),
        LatLng(28.5530163, 77.1942933),
      ],
      borderColor: Colors.red,
      borderStrokeWidth: 1,
      color: Colors.yellow.withOpacity(0.05),
      hitValue: (
      title: 'Palace of Flt. Lt. Hari Singh',
      subtitle: 'Palace of Flt. Lt. Hari Singh',
      ),
    ),
  ];
  late final _polygons =
  Map.fromEntries(_polygonsRaw.map((e) => MapEntry(e.hitValue, e)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Polygons')),
      drawer: const MenuDrawer(PolygonPage.route),
      body: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(28.55676, 77.195971)
              initialZoom: 16,
            ),
            children: [
              openStreetMapTileLayer,
              MouseRegion(
                hitTestBehavior: HitTestBehavior.deferToChild,
                cursor: SystemMouseCursors.click,
                onHover: (_) {
                  final hitValues = _hitNotifier.value?.hitValues.toList();
                  if (hitValues == null) return;

                  if (listEquals(hitValues, _prevHitValues)) return;
                  _prevHitValues = hitValues;

                  // Find the polygon with the smallest area to select
                  final smallestPolygon = hitValues
                      .map((v) => _polygons[v]!)
                      .reduce((a, b) => _calculateArea(a.points) < _calculateArea(b.points) ? a : b);

                  final hoverLines = [
                    Polygon<HitValue>(
                      points: smallestPolygon.points,
                      holePointsList: smallestPolygon.holePointsList,
                      color: Colors.red.withOpacity(0.2),
                      borderStrokeWidth: 1,
                      borderColor: Colors.red,
                      disableHolesBorder: smallestPolygon.disableHolesBorder,
                    )
                  ];
                  setState(() => _hoverGons = hoverLines);
                },
                onExit: (_) {
                  _prevHitValues = null;
                  setState(() => _hoverGons = null);
                },
                child: GestureDetector(
                  onTap: () => _openTouchedGonsModal(
                    'Tapped',
                    _hitNotifier.value!.hitValues,
                    _hitNotifier.value!.coordinate,
                  ),
                  onLongPress: () => _openTouchedGonsModal(
                    'Long pressed',
                    _hitNotifier.value!.hitValues,
                    _hitNotifier.value!.coordinate,
                  ),
                  onSecondaryTap: () => _openTouchedGonsModal(
                    'Secondary tapped',
                    _hitNotifier.value!.hitValues,
                    _hitNotifier.value!.coordinate,
                  ),
                  child: PolygonLayer(
                    hitNotifier: _hitNotifier,
                    simplificationTolerance: 0,
                    polygons: [..._polygonsRaw, ...?_hoverGons],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  double _calculateArea(List<LatLng> points) {
    double area = 0;
    for (int i = 0; i < points.length; i++) {
      final j = (i + 1) % points.length;
      area += points[i].longitude * points[j].latitude;
      area -= points[j].longitude * points[i].latitude;
    }
    return area.abs() / 2.0;
  }

  void _openTouchedGonsModal(
      String eventType,
      List<HitValue> tappedLines,
      LatLng coords,
      ) {
    if (tappedLines.isEmpty) return;

    // Find the polygon with the smallest area
    final smallestPolygon = tappedLines
        .map((v) => _polygons[v]!)
        .reduce((a, b) => _calculateArea(a.points) < _calculateArea(b.points) ? a : b);

    showModalBottomSheet<void>(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tapped Polygon',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              '$eventType at point: (${coords.latitude.toStringAsFixed(6)}, ${coords.longitude.toStringAsFixed(6)})',
            ),
            const SizedBox(height: 8),
            ListTile(
              title: Text(smallestPolygon.hitValue?.title ?? 'No title'),
              subtitle: Text(smallestPolygon.hitValue?.subtitle ?? 'No subtitle'),
              dense: true,
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}