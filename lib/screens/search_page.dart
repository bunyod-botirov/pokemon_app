import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokemon_app/constant/size_config.dart';
import 'package:pokemon_app/model/pokemon_model.dart';
import 'package:pokemon_app/screens/info_page.dart';
import 'package:pokemon_app/service/pokemon_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final Set _searchedPokemons = {};
  List<Pokemon> pokemons = [];
  @override
  void initState() {
    ServicePokemon.getPokemons().then((value) => pokemons = value.pokemon!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
        toolbarHeight: height(200),
        centerTitle: true,
        automaticallyImplyLeading: false,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  child: SizedBox(
                    width: width(30),
                    height: height(30),
                    child: SvgPicture.asset(
                      "assets/icons/arrow_back_icon.svg",
                      fit: BoxFit.none,
                      width: width(7),
                      height: height(14),
                    ),
                  ),
                  onTap: () => Navigator.pop(context),
                ),
                SizedBox(width: width(49)),
                SizedBox(
                  width: width(296),
                  height: height(42),
                  child: TextFormField(
                    cursorColor: const Color(0xFF000000),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w400,
                      fontSize: width(14),
                    ),
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      fillColor: const Color(0xFFE5E5E5),
                      label: Center(
                        child: Text(
                          "Buscar Pokémon",
                          style: TextStyle(
                            color: const Color(0xFF838282),
                            fontWeight: FontWeight.w400,
                            fontSize: width(14),
                          ),
                        ),
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
                    onChanged: (value) {
                      _searchedPokemons.clear();
                      for (Pokemon pokemon in pokemons) {
                        if (value.isEmpty) {
                          _searchedPokemons.clear();
                          setState(() {});
                        } else if (pokemon.name!.toLowerCase().contains(
                              value.toLowerCase(),
                            )) {
                          _searchedPokemons.add(pokemon);
                          setState(() {});
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: GridView.builder(
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
                      imageUrl: _searchedPokemons.elementAt(index).img!,
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
                              "#${_searchedPokemons.elementAt(index).num}",
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
                              _searchedPokemons.elementAt(index).name!,
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
                    pokemon: _searchedPokemons.elementAt(index),
                  ),
                ),
              );
            },
          );
        },
        itemCount: _searchedPokemons.length,
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
