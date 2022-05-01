import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokemon_app/constant/size_config.dart';
import 'package:pokemon_app/model/pokemon_model.dart';
import 'package:pokemon_app/screens/info_page.dart';
import 'package:pokemon_app/screens/search_page.dart';
import 'package:pokemon_app/service/pokemon_hive.dart';
import 'package:pokemon_app/service/pokemon_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
        toolbarHeight: height(200),
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/pokemon_logo.png",
              fit: BoxFit.cover,
              width: width(252),
              height: height(88),
            ),
            SizedBox(height: height(30)),
            SizedBox(
              width: width(296),
              height: height(42),
              child: TextFormField(
                readOnly: true,
                cursorColor: const Color(0xFF000000),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF000000),
                  fontWeight: FontWeight.w400,
                  fontSize: width(14),
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: height(21)),
                  filled: true,
                  fillColor: const Color(0xFFE5E5E5),
                  hintText: "Buscar Pokémon",
                  hintStyle: TextStyle(
                    color: const Color(0xFF838282),
                    fontWeight: FontWeight.w400,
                    fontSize: width(14),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(width(30)),
                    borderSide: const BorderSide(
                      style: BorderStyle.none,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(width(30)),
                    borderSide: const BorderSide(
                      style: BorderStyle.none,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: Builder(
        builder: (BuildContext context) {
          ServicePokemon.getPokemons();
          if (PokemonHive.pokemonsBox!.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFFF993FB),
                strokeWidth: 2,
              ),
            );
          } else {
            List<Pokemon> data = PokemonHive.pokemonsBox!.getAt(0).pokemon;
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.symmetric(
                horizontal: width(20),
                vertical: height(60),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: height(115.18),
                crossAxisSpacing: width(20),
                mainAxisSpacing: height(35),
              ),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width(20)),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          Color(0xFFFC7CFF),
                          Color(0xFFFA5AFD),
                        ],
                      ),
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: <Widget>[
                        Positioned(
                          bottom: height(47),
                          child: CachedNetworkImage(
                            imageUrl: data[index].img!,
                            fit: BoxFit.cover,
                            width: width(105),
                            height: height(115.18),
                          ),
                        ),
                        Positioned(
                          bottom: height(12.8),
                          child: Container(
                            width: width(147),
                            height: height(27.42),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              horizontal: width(11),
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF676767),
                              borderRadius: BorderRadius.circular(width(10)),
                              boxShadow: <BoxShadow>[
                                shadows(2.77, 2.21, 0.0281),
                                shadows(6.65, 5.32, 0.0404),
                                shadows(12.52, 10.02, 0.05),
                                shadows(22.34, 17.87, 0.0596),
                                shadows(41.78, 33.42, 0.0719),
                                shadows(100, 80, 0.01),
                              ],
                            ),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "#${data[index].num}",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: const Color(0xFFF993FB),
                                      fontWeight: FontWeight.w800,
                                      fontSize: width(12),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Text(
                                    data[index].name!,
                                    textAlign: TextAlign.end,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: const Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w800,
                                      fontSize: width(12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoPage(
                          pokemon: data[index],
                        ),
                      ),
                    );
                  },
                );
              },
              itemCount: data.length,
            );
          }
        },
      ),
    );
  }

  BoxShadow shadows(double width, double blurR, opacity) {
    return BoxShadow(
      color: const Color(0xFF000000).withOpacity(opacity),
      offset: Offset(0, width),
      blurRadius: blurR,
    );
  }
}
