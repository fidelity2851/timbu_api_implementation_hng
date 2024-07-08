import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timbu_api_implementation_hng/models/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product details;
  const ProductDetailsScreen({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(details.name),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: GoogleFonts.poppins(
          color: Colors.amber,
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: Colors.green[600],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 1.8,
                child: details.images.isEmpty
                    ? Center(
                        child: Text(
                          'No image found',
                          style: GoogleFonts.poppins(
                            color: Colors.red,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: details.images.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 20.0),
                            child: Image(
                              image: NetworkImage(details.images[index]),
                              fit: BoxFit.contain,
                              width: MediaQuery.sizeOf(context).width / 1.3,
                            ),
                          );
                        }),
              ),
              const SizedBox(height: 15),
              Text(
                details.stock > 0
                    ? '${details.stock} Stock remaining'
                    : 'Out Of Stock',
                style: GoogleFonts.poppins(
                  color: details.stock > 0 ? Colors.amber : Colors.red,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                details.name,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '\$${details.price}',
                style: GoogleFonts.poppins(
                  color: Colors.green[600],
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                details.desciption,
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
