import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../models/campsite.dart';

class CampsiteDetailScreen extends StatelessWidget {
  final Campsite campsite;

  const CampsiteDetailScreen({
    super.key,
    required this.campsite,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(campsite.label),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              campsite.photo,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 300,
                  color: Colors.grey[300],
                  child: const Icon(Icons.error, size: 50),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    campsite.label,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow(
                    context,
                    Icons.location_on,
                    'Location',
                    '${campsite.geoLocation.lat.toStringAsFixed(2)}, ${campsite.geoLocation.lng.toStringAsFixed(2)}',
                  ),
                  const SizedBox(height: 8),
                  _buildInfoRow(
                    context,
                    Icons.language,
                    'Host Languages',
                    campsite.hostLanguages.join(", "),
                  ),
                  const SizedBox(height: 8),
                  _buildInfoRow(
                    context,
                    Icons.attach_money,
                    'Price per Night',
                    '\$${campsite.pricePerNight.toStringAsFixed(2)}',
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    children: [
                      if (campsite.isCloseToWater)
                        Chip(
                          label: const Text('Near Water'),
                          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                        ),
                      if (campsite.isCampFireAllowed)
                        Chip(
                          label: const Text('Campfire Allowed'),
                          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                        ),
                    ],
                  ),
                  if (campsite.suitableFor.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    Text(
                      'Suitable For:',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: campsite.suitableFor
                          .map((item) => Chip(
                                label: Text(item),
                                backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                              ))
                          .toList(),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Location',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(
                    campsite.geoLocation.lat,
                    campsite.geoLocation.lng,
                  ),
                  zoom: 13.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.campsite_finder',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(
                          campsite.geoLocation.lat,
                          campsite.geoLocation.lng,
                        ),
                        width: 80,
                        height: 80,
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Theme.of(context).colorScheme.secondary,
        ),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
} 