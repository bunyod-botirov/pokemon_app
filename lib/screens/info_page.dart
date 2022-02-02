import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokemon_app/constant/size_config.dart';
import 'package:pokemon_app/model/pokemon_model.dart';
import 'package:pokemon_app/screens/search_page.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key, this.pokemon}) : super(key: key);

  final Pokemon? pokemon;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
        toolbarHeight: height(190),
        automaticallyImplyLeading: false,
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
                  width: width(228),
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
                SizedBox(width: width(40)),
                SvgPicture.asset(
                  "assets/icons/settings_icon.svg",
                  fit: BoxFit.cover,
                  width: width(16),
                  height: height(18),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          const Spacer(),
          Row(
            children: <Widget>[
              SizedBox(width: width(21)),
              Text(
                "#${pokemon!.num!}",
                style: TextStyle(
                  color: const Color(0xFFFC7CFF),
                  fontWeight: FontWeight.w800,
                  fontSize: width(16),
                ),
              ),
              const Spacer(),
              Text(
                pokemon!.name!,
                style: TextStyle(
                  color: const Color(0xFF000000),
                  fontWeight: FontWeight.w800,
                  fontSize: width(16),
                ),
              ),
              SizedBox(width: width(21)),
            ],
          ),
          SizedBox(height: height(14)),
          image(),
          SizedBox(height: height(22)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: width(174),
                height: height(38),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFFCA600).withOpacity(0.97),
                  borderRadius: BorderRadius.circular(width(10)),
                  boxShadow: <BoxShadow>[
                    shadows(1.02, 1.59, 0.0168),
                    shadows(2.31, 3.62, 0.0244),
                    shadows(4.02, 6.31, 0.03),
                    shadows(6.39, 10.02, 0.035),
                    shadows(9.85, 15.46, 0.04),
                    shadows(15.38, 24.12, 0.0456),
                    shadows(25.52, 40.04, 0.0532),
                    shadows(51, 80, 0.07),
                  ],
                ),
                child: Text(
                  "Fuego",
                  style: TextStyle(
                    color: const Color(0xFFFFFEFC),
                    fontWeight: FontWeight.w800,
                    fontSize: width(16),
                  ),
                ),
              ),
              Container(
                width: width(174),
                height: height(38),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF0083FC).withOpacity(0.46),
                  borderRadius: BorderRadius.circular(width(10)),
                  boxShadow: <BoxShadow>[
                    shadows(1.02, 1.59, 0.0168),
                    shadows(2.31, 3.62, 0.0244),
                    shadows(4.02, 6.31, 0.03),
                    shadows(6.39, 10.02, 0.035),
                    shadows(9.85, 15.46, 0.04),
                    shadows(15.38, 24.12, 0.0456),
                    shadows(25.52, 40.04, 0.0532),
                    shadows(51, 80, 0.07),
                  ],
                ),
                child: Text(
                  "Volador",
                  style: TextStyle(
                    color: const Color(0xFFFFFEFC),
                    fontWeight: FontWeight.w800,
                    fontSize: width(16),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: height(25)),
          informations(),
        ],
      ),
    );
  }

  Container image() {
    return Container(
      width: width(371),
      height: height(205),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width(30)),
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
            bottom: height(15),
            child: CachedNetworkImage(
              imageUrl: pokemon!.img!,
              fit: BoxFit.cover,
              width: width(250),
              height: height(250),
            ),
          ),
        ],
      ),
    );
  }

  Container informations() {
    return Container(
      width: width(415),
      height: height(309),
      decoration: BoxDecoration(
        color: const Color(0xFFFA5AFD),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(width(60)),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: height(191),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Spacer(),
                    Text(
                      "Height",
                      style: TextStyle(
                        color: const Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w800,
                        fontSize: width(16),
                      ),
                    ),
                    SizedBox(height: height(9)),
                    Text(
                      pokemon!.height!,
                      style: TextStyle(
                        color: const Color(0xFFF3B7FE),
                        fontWeight: FontWeight.w700,
                        fontSize: width(16),
                      ),
                    ),
                    const Spacer(flex: 2),
                    Text(
                      "Weight",
                      style: TextStyle(
                        color: const Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w800,
                        fontSize: width(16),
                      ),
                    ),
                    SizedBox(height: height(9)),
                    Text(
                      pokemon!.weight!,
                      style: TextStyle(
                        color: const Color(0xFFF3B7FE),
                        fontWeight: FontWeight.w700,
                        fontSize: width(16),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                Column(
                  children: <Widget>[
                    const Spacer(),
                    Text(
                      "Type",
                      style: TextStyle(
                        color: const Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w800,
                        fontSize: width(16),
                      ),
                    ),
                    SizedBox(height: height(9)),
                    SizedBox(
                      width: width(70),
                      height: height(50),
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: pokemon!.type!.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: height(9));
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return Text(
                            pokemon!.type![index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFFF3B7FE),
                              fontWeight: FontWeight.w700,
                              fontSize: width(16),
                            ),
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "Sex",
                      style: TextStyle(
                        color: const Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w800,
                        fontSize: width(16),
                      ),
                    ),
                    SizedBox(height: height(9)),
                    pokemon!.egg! == "Not in Eggs"
                        ? SvgPicture.asset(
                            "assets/icons/m_sex_icon.svg",
                            fit: BoxFit.cover,
                            width: width(20),
                            height: height(20),
                          )
                        : SvgPicture.asset(
                            "assets/icons/w_sex_icon.svg",
                            fit: BoxFit.cover,
                            width: width(20),
                            height: height(20),
                          ),
                    const Spacer(),
                  ],
                ),
                Column(
                  children: <Widget>[
                    const Spacer(),
                    Text(
                      "Weaknesses",
                      style: TextStyle(
                        color: const Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w800,
                        fontSize: width(16),
                      ),
                    ),
                    SizedBox(height: height(9)),
                    SizedBox(
                      width: width(100),
                      height: height(110),
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: pokemon!.weaknesses!.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: height(9));
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: _circleColorChanger(
                                    pokemon!.weaknesses![index]),
                                radius: 7.5,
                              ),
                              SizedBox(width: width(6)),
                              Text(
                                pokemon!.weaknesses![index],
                                style: TextStyle(
                                  color: const Color(0xFFF3B7FE),
                                  fontWeight: FontWeight.w700,
                                  fontSize: width(16),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                  ],
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              const Spacer(),
              Column(
                children: <Widget>[
                  Text(
                    "Candy",
                    style: TextStyle(
                      color: const Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w800,
                      fontSize: width(16),
                    ),
                  ),
                  SizedBox(height: height(9)),
                  Text(
                    pokemon!.candy!,
                    style: TextStyle(
                      color: const Color(0xFFF3B7FE),
                      fontWeight: FontWeight.w700,
                      fontSize: width(pokemon!.candy!.length >= 20 ? 12 : 16),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Image.asset(
                "assets/images/image.png",
                fit: BoxFit.cover,
                width: width(233),
                height: height(118),
              ),
            ],
          )
        ],
      ),
    );
  }

  Color _circleColorChanger(String _weakness) {
    if (_weakness == "Water") {
      return const Color(0xFF1D8FF8);
    } else if (_weakness == "Electric") {
      return const Color(0xFFFBD92A);
    } else if (_weakness == "Rock") {
      return const Color(0xFFCA9E03);
    } else if (_weakness == "Fire") {
      return const Color(0xFFFBB741);
    } else if (_weakness == "Ice") {
      return const Color(0xFFDBF1FD);
    } else if (_weakness == "Flying") {
      return const Color(0xFF7bd0e0);
    } else if (_weakness == "Psychic") {
      return const Color(0xFF625981);
    } else if (_weakness == "Grass") {
      return const Color(0xFF348C31);
    } else if (_weakness == "Fighting") {
      return const Color(0xFFbb0a1e);
    } else if (_weakness == "Ground") {
      return const Color(0xFF9b7653);
    } else {
      return const Color(0xFF000000);
    }
  }

  BoxShadow shadows(double width, double blurR, opacity) {
    return BoxShadow(
      color: const Color(0xFF000000).withOpacity(opacity),
      offset: Offset(0, width),
      blurRadius: blurR,
    );
  }
}
