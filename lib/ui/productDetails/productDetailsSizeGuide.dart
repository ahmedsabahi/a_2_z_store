import 'package:flutter/material.dart';

class ProductDetailsSizeGuide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Size Guide'),
        backgroundColor: Color(0xff363640),
      ),
      body: Center(
        child: InteractiveViewer(
          panEnabled: false, // Set it to false
          minScale: 0.5,
          maxScale: 2.5,
          boundaryMargin: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Menswear',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      letterSpacing: 1.4),
                ),
              ),
              Image.asset(
                'images/men_size_guide.jpg',
              ),
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Womenswear',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      letterSpacing: 1.4),
                ),
              ),
              Image.asset(
                'images/women_size_guide.jpg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
