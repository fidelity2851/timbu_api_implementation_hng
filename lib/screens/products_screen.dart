import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timbu_api_implementation_hng/screens/product_details_screen.dart';
import 'package:timbu_api_implementation_hng/viewmodel/products_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Timbu Api'),
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          color: Colors.amber,
          fontSize: 35,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: Colors.green[600],
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.refresh(productProvider.future),
        child: products.when(
          data: (data) {
            return data.isEmpty
                ? Center(
                    child: Text(
                      'No Record Found, Pull down to refresh',
                      style: GoogleFonts.poppins(
                        color: Colors.red,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                : GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                    childAspectRatio: 0.8,
                    padding: const EdgeInsets.all(20.0),
                    children: List.generate(data.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailsScreen(details: data[index]),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            border: Border.all(
                              color: Colors.grey.shade300,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image(
                                  image: (data[index].images).isNotEmpty
                                      ? NetworkImage(
                                          data[index].images.first,
                                        )
                                      : const AssetImage(
                                              'assets/placeholder.png')
                                          as ImageProvider,
                                  height: 120.0,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[index].name,
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '\$${data[index].price}',
                                      style: GoogleFonts.poppins(
                                        color: Colors.green[600],
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  );
          },
          error: (error, stackTrace) {
            return Center(
              child: Text(
                'An error occured, Pull down to refresh',
                style: GoogleFonts.poppins(
                  color: Colors.red,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          },
          loading: () {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.green[600],
              ),
            );
          },
        ),
      ),
    );
  }
}
