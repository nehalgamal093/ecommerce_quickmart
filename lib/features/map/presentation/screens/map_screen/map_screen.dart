import 'package:ecommerce_shop/core/widgets/custom_btn_widget.dart';
import 'package:ecommerce_shop/features/profile/presentation/screens/shipping_address/providers/cities_province_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../provider/map_provider.dart';

class MapScreen extends StatefulWidget {
  final CityProvinceProvider cityProvince;
  const MapScreen({super.key, required this.cityProvince});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MapProvider>().getCurrentLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    var mapProvider = Provider.of<MapProvider>(context);
    return Scaffold(
      body: mapProvider.loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: GoogleMap(
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    onMapCreated: (controller) {
                      mapProvider.changeMapController(controller);
                    },
                    onTap: (LatLng position) {
                      mapProvider.changePosition(position);
                      mapProvider.changeMarker(
                        Marker(
                          markerId: MarkerId('selected'),
                          position: position,
                          draggable: true,
                        ),
                      );
                      mapProvider.getAddressFromLatLng(position);
                    },
                    markers: mapProvider.selectedPosition == null
                        ? {}
                        : {
                            Marker(
                              markerId: MarkerId('selected'),
                              position: mapProvider.selectedPosition!,
                            ),
                          },
                    initialCameraPosition: CameraPosition(
                      target: mapProvider.currentPosition ?? LatLng(0, 0),
                      zoom: 15,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Selected Location:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(mapProvider.address),
                      SizedBox(height: 16),
                      CustomBtnWidget(
                        title: 'Confirm Location',
                        onPressed: () {
                          widget.cityProvince
                              .changeCity(mapProvider.place!.locality!);
                          widget.cityProvince
                              .changeProvince(mapProvider.place!.name!);
                          widget.cityProvince
                              .changeStreet(mapProvider.place!.street!);
                          Navigator.pop(context);
                          // Navigator.pop(context, {
                          //   'position': mapProvider.selectedPosition,
                          //   'address': mapProvider.address,
                          // });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
