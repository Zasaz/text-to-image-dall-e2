import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/imageprovider.dart';

class ImageGeneratorView extends ConsumerStatefulWidget {
  const ImageGeneratorView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ImageGeneratorViewState();
}

class _ImageGeneratorViewState extends ConsumerState<ImageGeneratorView> {
  String imageText = 'Paint something new';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Text to Image'),
      ),
      body: SafeArea(
        child: ref.watch(fetchImageProvider(imageText)).when(
              data: (data) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      onFieldSubmitted: (value) {
                        if (value.isEmpty || value == '') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Prompt cannot be empty'),
                            ),
                          );
                        } else {
                          setState(() {
                            imageText = value;
                          });
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter your prompt',
                        hintStyle: const TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text('Prompt: $imageText'),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 3,
                            crossAxisSpacing: 3,
                          ),
                          itemCount: data.data!.length,
                          itemBuilder: ((context, index) => Image.network(
                                data.data![index].url ??
                                    "https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg",
                              )),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              error: (error, stackTrace) => Center(
                child: Text(
                  error.toString(),
                ),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
      ),
    );
  }
}
