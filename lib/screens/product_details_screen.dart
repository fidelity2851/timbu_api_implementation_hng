import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsScreen extends StatelessWidget {
  final details;
  const ProductDetailsScreen({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Name'),
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
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Image(
                          image: const AssetImage('assets/cloth.png'),
                          fit: BoxFit.cover,
                          width: MediaQuery.sizeOf(context).width / 1.3,
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 15),
              Text(
                true ? '10 Stock remaining' : 'Out Of Stock',
                style: GoogleFonts.poppins(
                  color: true ? Colors.amber : Colors.red,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Products name 1 already',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '\$300',
                style: GoogleFonts.poppins(
                  color: Colors.green[600],
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type',
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
