public import Foundation

extension TimeZone {
    /// Names of time zones known to the system.
    ///
    /// Timezones have unique names in the form "Area/Location", e.g. "America/New_York".
    public enum Name: String, CaseIterable, Sendable {
        /// Africa/Abidjan
        case africaAbidjan = "Africa/Abidjan"
        /// Africa/Accra
        case africaAccra = "Africa/Accra"
        /// Africa/Addis_Ababa
        case africaAddisAbaba = "Africa/Addis_Ababa"
        /// Africa/Algiers
        case africaAlgiers = "Africa/Algiers"
        /// Africa/Asmara
        case africaAsmara = "Africa/Asmara"
        /// Africa/Bamako
        case africaBamako = "Africa/Bamako"
        /// Africa/Bangui
        case africaBangui = "Africa/Bangui"
        /// Africa/Banjul
        case africaBanjul = "Africa/Banjul"
        /// Africa/Bissau
        case africaBissau = "Africa/Bissau"
        /// Africa/Blantyre
        case africaBlantyre = "Africa/Blantyre"
        /// Africa/Brazzaville
        case africaBrazzaville = "Africa/Brazzaville"
        /// Africa/Bujumbura
        case africaBujumbura = "Africa/Bujumbura"
        /// Africa/Cairo
        case africaCairo = "Africa/Cairo"
        /// Africa/Casablanca
        case africaCasablanca = "Africa/Casablanca"
        /// Africa/Ceuta
        case africaCeuta = "Africa/Ceuta"
        /// Africa/Conakry
        case africaConakry = "Africa/Conakry"
        /// Africa/Dakar
        case africaDakar = "Africa/Dakar"
        /// Africa/Dar_es_Salaam
        case africaDarEsSalaam = "Africa/Dar_es_Salaam"
        /// Africa/Djibouti
        case africaDjibouti = "Africa/Djibouti"
        /// Africa/Douala
        case africaDouala = "Africa/Douala"
        /// Africa/El_Aaiun
        case africaElAaiun = "Africa/El_Aaiun"
        /// Africa/Freetown
        case africaFreetown = "Africa/Freetown"
        /// Africa/Gaborone
        case africaGaborone = "Africa/Gaborone"
        /// Africa/Harare
        case africaHarare = "Africa/Harare"
        /// Africa/Johannesburg
        case africaJohannesburg = "Africa/Johannesburg"
        /// Africa/Juba
        case africaJuba = "Africa/Juba"
        /// Africa/Kampala
        case africaKampala = "Africa/Kampala"
        /// Africa/Khartoum
        case africaKhartoum = "Africa/Khartoum"
        /// Africa/Kigali
        case africaKigali = "Africa/Kigali"
        /// Africa/Kinshasa
        case africaKinshasa = "Africa/Kinshasa"
        /// Africa/Lagos
        case africaLagos = "Africa/Lagos"
        /// Africa/Libreville
        case africaLibreville = "Africa/Libreville"
        /// Africa/Lome
        case africaLome = "Africa/Lome"
        /// Africa/Luanda
        case africaLuanda = "Africa/Luanda"
        /// Africa/Lubumbashi
        case africaLubumbashi = "Africa/Lubumbashi"
        /// Africa/Lusaka
        case africaLusaka = "Africa/Lusaka"
        /// Africa/Malabo
        case africaMalabo = "Africa/Malabo"
        /// Africa/Maputo
        case africaMaputo = "Africa/Maputo"
        /// Africa/Maseru
        case africaMaseru = "Africa/Maseru"
        /// Africa/Mbabane
        case africaMbabane = "Africa/Mbabane"
        /// Africa/Mogadishu
        case africaMogadishu = "Africa/Mogadishu"
        /// Africa/Monrovia
        case africaMonrovia = "Africa/Monrovia"
        /// Africa/Nairobi
        case africaNairobi = "Africa/Nairobi"
        /// Africa/Ndjamena
        case africaNdjamena = "Africa/Ndjamena"
        /// Africa/Niamey
        case africaNiamey = "Africa/Niamey"
        /// Africa/Nouakchott
        case africaNouakchott = "Africa/Nouakchott"
        /// Africa/Ouagadougou
        case africaOuagadougou = "Africa/Ouagadougou"
        /// Africa/Porto-Novo
        case africaPortoNovo = "Africa/Porto-Novo"
        /// Africa/Sao_Tome
        case africaSaoTome = "Africa/Sao_Tome"
        /// Africa/Tripoli
        case africaTripoli = "Africa/Tripoli"
        /// Africa/Tunis
        case africaTunis = "Africa/Tunis"
        /// Africa/Windhoek
        case africaWindhoek = "Africa/Windhoek"
        /// America/Adak
        case americaAdak = "America/Adak"
        /// America/Anchorage
        case americaAnchorage = "America/Anchorage"
        /// America/Anguilla
        case americaAnguilla = "America/Anguilla"
        /// America/Antigua
        case americaAntigua = "America/Antigua"
        /// America/Araguaina
        case americaAraguaina = "America/Araguaina"
        /// America/Argentina/Buenos_Aires
        case americaArgentinaBuenosAires = "America/Argentina/Buenos_Aires"
        /// America/Argentina/Catamarca
        case americaArgentinaCatamarca = "America/Argentina/Catamarca"
        /// America/Argentina/Cordoba
        case americaArgentinaCordoba = "America/Argentina/Cordoba"
        /// America/Argentina/Jujuy
        case americaArgentinaJujuy = "America/Argentina/Jujuy"
        /// America/Argentina/La_Rioja
        case americaArgentinaLaRioja = "America/Argentina/La_Rioja"
        /// America/Argentina/Mendoza
        case americaArgentinaMendoza = "America/Argentina/Mendoza"
        /// America/Argentina/Rio_Gallegos
        case americaArgentinaRioGallegos = "America/Argentina/Rio_Gallegos"
        /// America/Argentina/Salta
        case americaArgentinaSalta = "America/Argentina/Salta"
        /// America/Argentina/San_Juan
        case americaArgentinaSanJuan = "America/Argentina/San_Juan"
        /// America/Argentina/San_Luis
        case americaArgentinaSanLuis = "America/Argentina/San_Luis"
        /// America/Argentina/Tucuman
        case americaArgentinaTucuman = "America/Argentina/Tucuman"
        /// America/Argentina/Ushuaia
        case americaArgentinaUshuaia = "America/Argentina/Ushuaia"
        /// America/Aruba
        case americaAruba = "America/Aruba"
        /// America/Asuncion
        case americaAsuncion = "America/Asuncion"
        /// America/Atikokan
        case americaAtikokan = "America/Atikokan"
        /// America/Bahia
        case americaBahia = "America/Bahia"
        /// America/Bahia_Banderas
        case americaBahiaBanderas = "America/Bahia_Banderas"
        /// America/Barbados
        case americaBarbados = "America/Barbados"
        /// America/Belem
        case americaBelem = "America/Belem"
        /// America/Belize
        case americaBelize = "America/Belize"
        /// America/Blanc-Sablon
        case americaBlancSablon = "America/Blanc-Sablon"
        /// America/Boa_Vista
        case americaBoaVista = "America/Boa_Vista"
        /// America/Bogota
        case americaBogota = "America/Bogota"
        /// America/Boise
        case americaBoise = "America/Boise"
        /// America/Cambridge_Bay
        case americaCambridgeBay = "America/Cambridge_Bay"
        /// America/Campo_Grande
        case americaCampoGrande = "America/Campo_Grande"
        /// America/Cancun
        case americaCancun = "America/Cancun"
        /// America/Caracas
        case americaCaracas = "America/Caracas"
        /// America/Cayenne
        case americaCayenne = "America/Cayenne"
        /// America/Cayman
        case americaCayman = "America/Cayman"
        /// America/Chicago
        case americaChicago = "America/Chicago"
        /// America/Chihuahua
        case americaChihuahua = "America/Chihuahua"
        /// America/Ciudad_Juarez
        case americaCiudadJuarez = "America/Ciudad_Juarez"
        /// America/Costa_Rica
        case americaCostaRica = "America/Costa_Rica"
        /// America/Coyhaique
        case americaCoyhaique = "America/Coyhaique"
        /// America/Creston
        case americaCreston = "America/Creston"
        /// America/Cuiaba
        case americaCuiaba = "America/Cuiaba"
        /// America/Curacao
        case americaCuracao = "America/Curacao"
        /// America/Danmarkshavn
        case americaDanmarkshavn = "America/Danmarkshavn"
        /// America/Dawson
        case americaDawson = "America/Dawson"
        /// America/Dawson_Creek
        case americaDawsonCreek = "America/Dawson_Creek"
        /// America/Denver
        case americaDenver = "America/Denver"
        /// America/Detroit
        case americaDetroit = "America/Detroit"
        /// America/Dominica
        case americaDominica = "America/Dominica"
        /// America/Edmonton
        case americaEdmonton = "America/Edmonton"
        /// America/Eirunepe
        case americaEirunepe = "America/Eirunepe"
        /// America/El_Salvador
        case americaElSalvador = "America/El_Salvador"
        /// America/Fort_Nelson
        case americaFortNelson = "America/Fort_Nelson"
        /// America/Fortaleza
        case americaFortaleza = "America/Fortaleza"
        /// America/Glace_Bay
        case americaGlaceBay = "America/Glace_Bay"
        /// America/Godthab
        case americaGodthab = "America/Godthab"
        /// America/Goose_Bay
        case americaGooseBay = "America/Goose_Bay"
        /// America/Grand_Turk
        case americaGrandTurk = "America/Grand_Turk"
        /// America/Grenada
        case americaGrenada = "America/Grenada"
        /// America/Guadeloupe
        case americaGuadeloupe = "America/Guadeloupe"
        /// America/Guatemala
        case americaGuatemala = "America/Guatemala"
        /// America/Guayaquil
        case americaGuayaquil = "America/Guayaquil"
        /// America/Guyana
        case americaGuyana = "America/Guyana"
        /// America/Halifax
        case americaHalifax = "America/Halifax"
        /// America/Havana
        case americaHavana = "America/Havana"
        /// America/Hermosillo
        case americaHermosillo = "America/Hermosillo"
        /// America/Indiana/Indianapolis
        case americaIndianaIndianapolis = "America/Indiana/Indianapolis"
        /// America/Indiana/Knox
        case americaIndianaKnox = "America/Indiana/Knox"
        /// America/Indiana/Marengo
        case americaIndianaMarengo = "America/Indiana/Marengo"
        /// America/Indiana/Petersburg
        case americaIndianaPetersburg = "America/Indiana/Petersburg"
        /// America/Indiana/Tell_City
        case americaIndianaTellCity = "America/Indiana/Tell_City"
        /// America/Indiana/Vevay
        case americaIndianaVevay = "America/Indiana/Vevay"
        /// America/Indiana/Vincennes
        case americaIndianaVincennes = "America/Indiana/Vincennes"
        /// America/Indiana/Winamac
        case americaIndianaWinamac = "America/Indiana/Winamac"
        /// America/Inuvik
        case americaInuvik = "America/Inuvik"
        /// America/Iqaluit
        case americaIqaluit = "America/Iqaluit"
        /// America/Jamaica
        case americaJamaica = "America/Jamaica"
        /// America/Juneau
        case americaJuneau = "America/Juneau"
        /// America/Kentucky/Louisville
        case americaKentuckyLouisville = "America/Kentucky/Louisville"
        /// America/Kentucky/Monticello
        case americaKentuckyMonticello = "America/Kentucky/Monticello"
        /// America/Kralendijk
        case americaKralendijk = "America/Kralendijk"
        /// America/La_Paz
        case americaLaPaz = "America/La_Paz"
        /// America/Lima
        case americaLima = "America/Lima"
        /// America/Los_Angeles
        case americaLosAngeles = "America/Los_Angeles"
        /// America/Lower_Princes
        case americaLowerPrinces = "America/Lower_Princes"
        /// America/Maceio
        case americaMaceio = "America/Maceio"
        /// America/Managua
        case americaManagua = "America/Managua"
        /// America/Manaus
        case americaManaus = "America/Manaus"
        /// America/Marigot
        case americaMarigot = "America/Marigot"
        /// America/Martinique
        case americaMartinique = "America/Martinique"
        /// America/Matamoros
        case americaMatamoros = "America/Matamoros"
        /// America/Mazatlan
        case americaMazatlan = "America/Mazatlan"
        /// America/Menominee
        case americaMenominee = "America/Menominee"
        /// America/Merida
        case americaMerida = "America/Merida"
        /// America/Metlakatla
        case americaMetlakatla = "America/Metlakatla"
        /// America/Mexico_City
        case americaMexicoCity = "America/Mexico_City"
        /// America/Miquelon
        case americaMiquelon = "America/Miquelon"
        /// America/Moncton
        case americaMoncton = "America/Moncton"
        /// America/Monterrey
        case americaMonterrey = "America/Monterrey"
        /// America/Montevideo
        case americaMontevideo = "America/Montevideo"
        /// America/Montreal
        case americaMontreal = "America/Montreal"
        /// America/Montserrat
        case americaMontserrat = "America/Montserrat"
        /// America/Nassau
        case americaNassau = "America/Nassau"
        /// America/New_York
        case americaNewYork = "America/New_York"
        /// America/Nipigon
        case americaNipigon = "America/Nipigon"
        /// America/Nome
        case americaNome = "America/Nome"
        /// America/Noronha
        case americaNoronha = "America/Noronha"
        /// America/North_Dakota/Beulah
        case americaNorthDakotaBeulah = "America/North_Dakota/Beulah"
        /// America/North_Dakota/Center
        case americaNorthDakotaCenter = "America/North_Dakota/Center"
        /// America/North_Dakota/New_Salem
        case americaNorthDakotaNewSalem = "America/North_Dakota/New_Salem"
        /// America/Nuuk
        case americaNuuk = "America/Nuuk"
        /// America/Ojinaga
        case americaOjinaga = "America/Ojinaga"
        /// America/Panama
        case americaPanama = "America/Panama"
        /// America/Pangnirtung
        case americaPangnirtung = "America/Pangnirtung"
        /// America/Paramaribo
        case americaParamaribo = "America/Paramaribo"
        /// America/Phoenix
        case americaPhoenix = "America/Phoenix"
        /// America/Port-au-Prince
        case americaPortAuPrince = "America/Port-au-Prince"
        /// America/Port_of_Spain
        case americaPortOfSpain = "America/Port_of_Spain"
        /// America/Porto_Velho
        case americaPortoVelho = "America/Porto_Velho"
        /// America/Puerto_Rico
        case americaPuertoRico = "America/Puerto_Rico"
        /// America/Punta_Arenas
        case americaPuntaArenas = "America/Punta_Arenas"
        /// America/Rainy_River
        case americaRainyRiver = "America/Rainy_River"
        /// America/Rankin_Inlet
        case americaRankinInlet = "America/Rankin_Inlet"
        /// America/Recife
        case americaRecife = "America/Recife"
        /// America/Regina
        case americaRegina = "America/Regina"
        /// America/Resolute
        case americaResolute = "America/Resolute"
        /// America/Rio_Branco
        case americaRioBranco = "America/Rio_Branco"
        /// America/Santa_Isabel
        case americaSantaIsabel = "America/Santa_Isabel"
        /// America/Santarem
        case americaSantarem = "America/Santarem"
        /// America/Santiago
        case americaSantiago = "America/Santiago"
        /// America/Santo_Domingo
        case americaSantoDomingo = "America/Santo_Domingo"
        /// America/Sao_Paulo
        case americaSaoPaulo = "America/Sao_Paulo"
        /// America/Scoresbysund
        case americaScoresbysund = "America/Scoresbysund"
        /// America/Shiprock
        case americaShiprock = "America/Shiprock"
        /// America/Sitka
        case americaSitka = "America/Sitka"
        /// America/St_Barthelemy
        case americaStBarthelemy = "America/St_Barthelemy"
        /// America/St_Johns
        case americaStJohns = "America/St_Johns"
        /// America/St_Kitts
        case americaStKitts = "America/St_Kitts"
        /// America/St_Lucia
        case americaStLucia = "America/St_Lucia"
        /// America/St_Thomas
        case americaStThomas = "America/St_Thomas"
        /// America/St_Vincent
        case americaStVincent = "America/St_Vincent"
        /// America/Swift_Current
        case americaSwiftCurrent = "America/Swift_Current"
        /// America/Tegucigalpa
        case americaTegucigalpa = "America/Tegucigalpa"
        /// America/Thule
        case americaThule = "America/Thule"
        /// America/Thunder_Bay
        case americaThunderBay = "America/Thunder_Bay"
        /// America/Tijuana
        case americaTijuana = "America/Tijuana"
        /// America/Toronto
        case americaToronto = "America/Toronto"
        /// America/Tortola
        case americaTortola = "America/Tortola"
        /// America/Vancouver
        case americaVancouver = "America/Vancouver"
        /// America/Whitehorse
        case americaWhitehorse = "America/Whitehorse"
        /// America/Winnipeg
        case americaWinnipeg = "America/Winnipeg"
        /// America/Yakutat
        case americaYakutat = "America/Yakutat"
        /// America/Yellowknife
        case americaYellowknife = "America/Yellowknife"
        /// Antarctica/Casey
        case antarcticaCasey = "Antarctica/Casey"
        /// Antarctica/Davis
        case antarcticaDavis = "Antarctica/Davis"
        /// Antarctica/DumontDUrville
        case antarcticaDumontdurville = "Antarctica/DumontDUrville"
        /// Antarctica/Macquarie
        case antarcticaMacquarie = "Antarctica/Macquarie"
        /// Antarctica/Mawson
        case antarcticaMawson = "Antarctica/Mawson"
        /// Antarctica/McMurdo
        case antarcticaMcmurdo = "Antarctica/McMurdo"
        /// Antarctica/Palmer
        case antarcticaPalmer = "Antarctica/Palmer"
        /// Antarctica/Rothera
        case antarcticaRothera = "Antarctica/Rothera"
        /// Antarctica/South_Pole
        case antarcticaSouthPole = "Antarctica/South_Pole"
        /// Antarctica/Syowa
        case antarcticaSyowa = "Antarctica/Syowa"
        /// Antarctica/Troll
        case antarcticaTroll = "Antarctica/Troll"
        /// Antarctica/Vostok
        case antarcticaVostok = "Antarctica/Vostok"
        /// Arctic/Longyearbyen
        case arcticLongyearbyen = "Arctic/Longyearbyen"
        /// Asia/Aden
        case asiaAden = "Asia/Aden"
        /// Asia/Almaty
        case asiaAlmaty = "Asia/Almaty"
        /// Asia/Amman
        case asiaAmman = "Asia/Amman"
        /// Asia/Anadyr
        case asiaAnadyr = "Asia/Anadyr"
        /// Asia/Aqtau
        case asiaAqtau = "Asia/Aqtau"
        /// Asia/Aqtobe
        case asiaAqtobe = "Asia/Aqtobe"
        /// Asia/Ashgabat
        case asiaAshgabat = "Asia/Ashgabat"
        /// Asia/Atyrau
        case asiaAtyrau = "Asia/Atyrau"
        /// Asia/Baghdad
        case asiaBaghdad = "Asia/Baghdad"
        /// Asia/Bahrain
        case asiaBahrain = "Asia/Bahrain"
        /// Asia/Baku
        case asiaBaku = "Asia/Baku"
        /// Asia/Bangkok
        case asiaBangkok = "Asia/Bangkok"
        /// Asia/Barnaul
        case asiaBarnaul = "Asia/Barnaul"
        /// Asia/Beirut
        case asiaBeirut = "Asia/Beirut"
        /// Asia/Bishkek
        case asiaBishkek = "Asia/Bishkek"
        /// Asia/Brunei
        case asiaBrunei = "Asia/Brunei"
        /// Asia/Calcutta
        case asiaCalcutta = "Asia/Calcutta"
        /// Asia/Chita
        case asiaChita = "Asia/Chita"
        /// Asia/Choibalsan
        case asiaChoibalsan = "Asia/Choibalsan"
        /// Asia/Chongqing
        case asiaChongqing = "Asia/Chongqing"
        /// Asia/Colombo
        case asiaColombo = "Asia/Colombo"
        /// Asia/Damascus
        case asiaDamascus = "Asia/Damascus"
        /// Asia/Dhaka
        case asiaDhaka = "Asia/Dhaka"
        /// Asia/Dili
        case asiaDili = "Asia/Dili"
        /// Asia/Dubai
        case asiaDubai = "Asia/Dubai"
        /// Asia/Dushanbe
        case asiaDushanbe = "Asia/Dushanbe"
        /// Asia/Famagusta
        case asiaFamagusta = "Asia/Famagusta"
        /// Asia/Gaza
        case asiaGaza = "Asia/Gaza"
        /// Asia/Harbin
        case asiaHarbin = "Asia/Harbin"
        /// Asia/Hebron
        case asiaHebron = "Asia/Hebron"
        /// Asia/Ho_Chi_Minh
        case asiaHoChiMinh = "Asia/Ho_Chi_Minh"
        /// Asia/Hong_Kong
        case asiaHongKong = "Asia/Hong_Kong"
        /// Asia/Hovd
        case asiaHovd = "Asia/Hovd"
        /// Asia/Irkutsk
        case asiaIrkutsk = "Asia/Irkutsk"
        /// Asia/Jakarta
        case asiaJakarta = "Asia/Jakarta"
        /// Asia/Jayapura
        case asiaJayapura = "Asia/Jayapura"
        /// Asia/Jerusalem
        case asiaJerusalem = "Asia/Jerusalem"
        /// Asia/Kabul
        case asiaKabul = "Asia/Kabul"
        /// Asia/Kamchatka
        case asiaKamchatka = "Asia/Kamchatka"
        /// Asia/Karachi
        case asiaKarachi = "Asia/Karachi"
        /// Asia/Kashgar
        case asiaKashgar = "Asia/Kashgar"
        /// Asia/Kathmandu
        case asiaKathmandu = "Asia/Kathmandu"
        /// Asia/Katmandu
        case asiaKatmandu = "Asia/Katmandu"
        /// Asia/Khandyga
        case asiaKhandyga = "Asia/Khandyga"
        /// Asia/Krasnoyarsk
        case asiaKrasnoyarsk = "Asia/Krasnoyarsk"
        /// Asia/Kuala_Lumpur
        case asiaKualaLumpur = "Asia/Kuala_Lumpur"
        /// Asia/Kuching
        case asiaKuching = "Asia/Kuching"
        /// Asia/Kuwait
        case asiaKuwait = "Asia/Kuwait"
        /// Asia/Macau
        case asiaMacau = "Asia/Macau"
        /// Asia/Magadan
        case asiaMagadan = "Asia/Magadan"
        /// Asia/Makassar
        case asiaMakassar = "Asia/Makassar"
        /// Asia/Manila
        case asiaManila = "Asia/Manila"
        /// Asia/Muscat
        case asiaMuscat = "Asia/Muscat"
        /// Asia/Nicosia
        case asiaNicosia = "Asia/Nicosia"
        /// Asia/Novokuznetsk
        case asiaNovokuznetsk = "Asia/Novokuznetsk"
        /// Asia/Novosibirsk
        case asiaNovosibirsk = "Asia/Novosibirsk"
        /// Asia/Omsk
        case asiaOmsk = "Asia/Omsk"
        /// Asia/Oral
        case asiaOral = "Asia/Oral"
        /// Asia/Phnom_Penh
        case asiaPhnomPenh = "Asia/Phnom_Penh"
        /// Asia/Pontianak
        case asiaPontianak = "Asia/Pontianak"
        /// Asia/Pyongyang
        case asiaPyongyang = "Asia/Pyongyang"
        /// Asia/Qatar
        case asiaQatar = "Asia/Qatar"
        /// Asia/Qostanay
        case asiaQostanay = "Asia/Qostanay"
        /// Asia/Qyzylorda
        case asiaQyzylorda = "Asia/Qyzylorda"
        /// Asia/Rangoon
        case asiaRangoon = "Asia/Rangoon"
        /// Asia/Riyadh
        case asiaRiyadh = "Asia/Riyadh"
        /// Asia/Sakhalin
        case asiaSakhalin = "Asia/Sakhalin"
        /// Asia/Samarkand
        case asiaSamarkand = "Asia/Samarkand"
        /// Asia/Seoul
        case asiaSeoul = "Asia/Seoul"
        /// Asia/Shanghai
        case asiaShanghai = "Asia/Shanghai"
        /// Asia/Singapore
        case asiaSingapore = "Asia/Singapore"
        /// Asia/Srednekolymsk
        case asiaSrednekolymsk = "Asia/Srednekolymsk"
        /// Asia/Taipei
        case asiaTaipei = "Asia/Taipei"
        /// Asia/Tashkent
        case asiaTashkent = "Asia/Tashkent"
        /// Asia/Tbilisi
        case asiaTbilisi = "Asia/Tbilisi"
        /// Asia/Tehran
        case asiaTehran = "Asia/Tehran"
        /// Asia/Thimphu
        case asiaThimphu = "Asia/Thimphu"
        /// Asia/Tokyo
        case asiaTokyo = "Asia/Tokyo"
        /// Asia/Tomsk
        case asiaTomsk = "Asia/Tomsk"
        /// Asia/Ulaanbaatar
        case asiaUlaanbaatar = "Asia/Ulaanbaatar"
        /// Asia/Urumqi
        case asiaUrumqi = "Asia/Urumqi"
        /// Asia/Ust-Nera
        case asiaUstNera = "Asia/Ust-Nera"
        /// Asia/Vientiane
        case asiaVientiane = "Asia/Vientiane"
        /// Asia/Vladivostok
        case asiaVladivostok = "Asia/Vladivostok"
        /// Asia/Yakutsk
        case asiaYakutsk = "Asia/Yakutsk"
        /// Asia/Yangon
        case asiaYangon = "Asia/Yangon"
        /// Asia/Yekaterinburg
        case asiaYekaterinburg = "Asia/Yekaterinburg"
        /// Asia/Yerevan
        case asiaYerevan = "Asia/Yerevan"
        /// Atlantic/Azores
        case atlanticAzores = "Atlantic/Azores"
        /// Atlantic/Bermuda
        case atlanticBermuda = "Atlantic/Bermuda"
        /// Atlantic/Canary
        case atlanticCanary = "Atlantic/Canary"
        /// Atlantic/Cape_Verde
        case atlanticCapeVerde = "Atlantic/Cape_Verde"
        /// Atlantic/Faroe
        case atlanticFaroe = "Atlantic/Faroe"
        /// Atlantic/Madeira
        case atlanticMadeira = "Atlantic/Madeira"
        /// Atlantic/Reykjavik
        case atlanticReykjavik = "Atlantic/Reykjavik"
        /// Atlantic/South_Georgia
        case atlanticSouthGeorgia = "Atlantic/South_Georgia"
        /// Atlantic/St_Helena
        case atlanticStHelena = "Atlantic/St_Helena"
        /// Atlantic/Stanley
        case atlanticStanley = "Atlantic/Stanley"
        /// Australia/Adelaide
        case australiaAdelaide = "Australia/Adelaide"
        /// Australia/Brisbane
        case australiaBrisbane = "Australia/Brisbane"
        /// Australia/Broken_Hill
        case australiaBrokenHill = "Australia/Broken_Hill"
        /// Australia/Currie
        case australiaCurrie = "Australia/Currie"
        /// Australia/Darwin
        case australiaDarwin = "Australia/Darwin"
        /// Australia/Eucla
        case australiaEucla = "Australia/Eucla"
        /// Australia/Hobart
        case australiaHobart = "Australia/Hobart"
        /// Australia/Lindeman
        case australiaLindeman = "Australia/Lindeman"
        /// Australia/Lord_Howe
        case australiaLordHowe = "Australia/Lord_Howe"
        /// Australia/Melbourne
        case australiaMelbourne = "Australia/Melbourne"
        /// Australia/Perth
        case australiaPerth = "Australia/Perth"
        /// Australia/Sydney
        case australiaSydney = "Australia/Sydney"
        /// Europe/Amsterdam
        case europeAmsterdam = "Europe/Amsterdam"
        /// Europe/Andorra
        case europeAndorra = "Europe/Andorra"
        /// Europe/Astrakhan
        case europeAstrakhan = "Europe/Astrakhan"
        /// Europe/Athens
        case europeAthens = "Europe/Athens"
        /// Europe/Belgrade
        case europeBelgrade = "Europe/Belgrade"
        /// Europe/Berlin
        case europeBerlin = "Europe/Berlin"
        /// Europe/Bratislava
        case europeBratislava = "Europe/Bratislava"
        /// Europe/Brussels
        case europeBrussels = "Europe/Brussels"
        /// Europe/Bucharest
        case europeBucharest = "Europe/Bucharest"
        /// Europe/Budapest
        case europeBudapest = "Europe/Budapest"
        /// Europe/Busingen
        case europeBusingen = "Europe/Busingen"
        /// Europe/Chisinau
        case europeChisinau = "Europe/Chisinau"
        /// Europe/Copenhagen
        case europeCopenhagen = "Europe/Copenhagen"
        /// Europe/Dublin
        case europeDublin = "Europe/Dublin"
        /// Europe/Gibraltar
        case europeGibraltar = "Europe/Gibraltar"
        /// Europe/Guernsey
        case europeGuernsey = "Europe/Guernsey"
        /// Europe/Helsinki
        case europeHelsinki = "Europe/Helsinki"
        /// Europe/Isle_of_Man
        case europeIsleOfMan = "Europe/Isle_of_Man"
        /// Europe/Istanbul
        case europeIstanbul = "Europe/Istanbul"
        /// Europe/Jersey
        case europeJersey = "Europe/Jersey"
        /// Europe/Kaliningrad
        case europeKaliningrad = "Europe/Kaliningrad"
        /// Europe/Kiev
        case europeKiev = "Europe/Kiev"
        /// Europe/Kirov
        case europeKirov = "Europe/Kirov"
        /// Europe/Kyiv
        case europeKyiv = "Europe/Kyiv"
        /// Europe/Lisbon
        case europeLisbon = "Europe/Lisbon"
        /// Europe/Ljubljana
        case europeLjubljana = "Europe/Ljubljana"
        /// Europe/London
        case europeLondon = "Europe/London"
        /// Europe/Luxembourg
        case europeLuxembourg = "Europe/Luxembourg"
        /// Europe/Madrid
        case europeMadrid = "Europe/Madrid"
        /// Europe/Malta
        case europeMalta = "Europe/Malta"
        /// Europe/Mariehamn
        case europeMariehamn = "Europe/Mariehamn"
        /// Europe/Minsk
        case europeMinsk = "Europe/Minsk"
        /// Europe/Monaco
        case europeMonaco = "Europe/Monaco"
        /// Europe/Moscow
        case europeMoscow = "Europe/Moscow"
        /// Europe/Oslo
        case europeOslo = "Europe/Oslo"
        /// Europe/Paris
        case europeParis = "Europe/Paris"
        /// Europe/Podgorica
        case europePodgorica = "Europe/Podgorica"
        /// Europe/Prague
        case europePrague = "Europe/Prague"
        /// Europe/Riga
        case europeRiga = "Europe/Riga"
        /// Europe/Rome
        case europeRome = "Europe/Rome"
        /// Europe/Samara
        case europeSamara = "Europe/Samara"
        /// Europe/San_Marino
        case europeSanMarino = "Europe/San_Marino"
        /// Europe/Sarajevo
        case europeSarajevo = "Europe/Sarajevo"
        /// Europe/Saratov
        case europeSaratov = "Europe/Saratov"
        /// Europe/Simferopol
        case europeSimferopol = "Europe/Simferopol"
        /// Europe/Skopje
        case europeSkopje = "Europe/Skopje"
        /// Europe/Sofia
        case europeSofia = "Europe/Sofia"
        /// Europe/Stockholm
        case europeStockholm = "Europe/Stockholm"
        /// Europe/Tallinn
        case europeTallinn = "Europe/Tallinn"
        /// Europe/Tirane
        case europeTirane = "Europe/Tirane"
        /// Europe/Ulyanovsk
        case europeUlyanovsk = "Europe/Ulyanovsk"
        /// Europe/Uzhgorod
        case europeUzhgorod = "Europe/Uzhgorod"
        /// Europe/Vaduz
        case europeVaduz = "Europe/Vaduz"
        /// Europe/Vatican
        case europeVatican = "Europe/Vatican"
        /// Europe/Vienna
        case europeVienna = "Europe/Vienna"
        /// Europe/Vilnius
        case europeVilnius = "Europe/Vilnius"
        /// Europe/Volgograd
        case europeVolgograd = "Europe/Volgograd"
        /// Europe/Warsaw
        case europeWarsaw = "Europe/Warsaw"
        /// Europe/Zagreb
        case europeZagreb = "Europe/Zagreb"
        /// Europe/Zaporozhye
        case europeZaporozhye = "Europe/Zaporozhye"
        /// Europe/Zurich
        case europeZurich = "Europe/Zurich"
        /// GMT
        case gmt = "GMT"
        /// Indian/Antananarivo
        case indianAntananarivo = "Indian/Antananarivo"
        /// Indian/Chagos
        case indianChagos = "Indian/Chagos"
        /// Indian/Christmas
        case indianChristmas = "Indian/Christmas"
        /// Indian/Cocos
        case indianCocos = "Indian/Cocos"
        /// Indian/Comoro
        case indianComoro = "Indian/Comoro"
        /// Indian/Kerguelen
        case indianKerguelen = "Indian/Kerguelen"
        /// Indian/Mahe
        case indianMahe = "Indian/Mahe"
        /// Indian/Maldives
        case indianMaldives = "Indian/Maldives"
        /// Indian/Mauritius
        case indianMauritius = "Indian/Mauritius"
        /// Indian/Mayotte
        case indianMayotte = "Indian/Mayotte"
        /// Indian/Reunion
        case indianReunion = "Indian/Reunion"
        /// Pacific/Apia
        case pacificApia = "Pacific/Apia"
        /// Pacific/Auckland
        case pacificAuckland = "Pacific/Auckland"
        /// Pacific/Bougainville
        case pacificBougainville = "Pacific/Bougainville"
        /// Pacific/Chatham
        case pacificChatham = "Pacific/Chatham"
        /// Pacific/Chuuk
        case pacificChuuk = "Pacific/Chuuk"
        /// Pacific/Easter
        case pacificEaster = "Pacific/Easter"
        /// Pacific/Efate
        case pacificEfate = "Pacific/Efate"
        /// Pacific/Enderbury
        case pacificEnderbury = "Pacific/Enderbury"
        /// Pacific/Fakaofo
        case pacificFakaofo = "Pacific/Fakaofo"
        /// Pacific/Fiji
        case pacificFiji = "Pacific/Fiji"
        /// Pacific/Funafuti
        case pacificFunafuti = "Pacific/Funafuti"
        /// Pacific/Galapagos
        case pacificGalapagos = "Pacific/Galapagos"
        /// Pacific/Gambier
        case pacificGambier = "Pacific/Gambier"
        /// Pacific/Guadalcanal
        case pacificGuadalcanal = "Pacific/Guadalcanal"
        /// Pacific/Guam
        case pacificGuam = "Pacific/Guam"
        /// Pacific/Honolulu
        case pacificHonolulu = "Pacific/Honolulu"
        /// Pacific/Johnston
        case pacificJohnston = "Pacific/Johnston"
        /// Pacific/Kanton
        case pacificKanton = "Pacific/Kanton"
        /// Pacific/Kiritimati
        case pacificKiritimati = "Pacific/Kiritimati"
        /// Pacific/Kosrae
        case pacificKosrae = "Pacific/Kosrae"
        /// Pacific/Kwajalein
        case pacificKwajalein = "Pacific/Kwajalein"
        /// Pacific/Majuro
        case pacificMajuro = "Pacific/Majuro"
        /// Pacific/Marquesas
        case pacificMarquesas = "Pacific/Marquesas"
        /// Pacific/Midway
        case pacificMidway = "Pacific/Midway"
        /// Pacific/Nauru
        case pacificNauru = "Pacific/Nauru"
        /// Pacific/Niue
        case pacificNiue = "Pacific/Niue"
        /// Pacific/Norfolk
        case pacificNorfolk = "Pacific/Norfolk"
        /// Pacific/Noumea
        case pacificNoumea = "Pacific/Noumea"
        /// Pacific/Pago_Pago
        case pacificPagoPago = "Pacific/Pago_Pago"
        /// Pacific/Palau
        case pacificPalau = "Pacific/Palau"
        /// Pacific/Pitcairn
        case pacificPitcairn = "Pacific/Pitcairn"
        /// Pacific/Pohnpei
        case pacificPohnpei = "Pacific/Pohnpei"
        /// Pacific/Ponape
        case pacificPonape = "Pacific/Ponape"
        /// Pacific/Port_Moresby
        case pacificPortMoresby = "Pacific/Port_Moresby"
        /// Pacific/Rarotonga
        case pacificRarotonga = "Pacific/Rarotonga"
        /// Pacific/Saipan
        case pacificSaipan = "Pacific/Saipan"
        /// Pacific/Tahiti
        case pacificTahiti = "Pacific/Tahiti"
        /// Pacific/Tarawa
        case pacificTarawa = "Pacific/Tarawa"
        /// Pacific/Tongatapu
        case pacificTongatapu = "Pacific/Tongatapu"
        /// Pacific/Truk
        case pacificTruk = "Pacific/Truk"
        /// Pacific/Wake
        case pacificWake = "Pacific/Wake"
        /// Pacific/Wallis
        case pacificWallis = "Pacific/Wallis"
        
        /// Area is the name of a continent, an ocean, or "Etc".
        ///
        /// The continents and oceans used are Africa, America, Antarctica,
        /// Arctic, Asia, Atlantic, Australia, Europe, Indian, and Pacific.
        ///
        /// The oceans are included since some islands are hard to connect to a certain continent.
        /// Some are geographically connected to one continent and politically to another.
        public var area: String {
            guard self != .gmt else { return "Etc" }
            return rawValue.components(separatedBy: "/").first ?? rawValue
        }
        
        /// Location is the name of a specific location within the area – usually a city or small island.
        ///
        /// Country names are not normally used in this scheme, primarily because they would not be robust,
        /// owing to frequent political and boundary changes. The names of large cities tend to be more permanent.
        public var location: String {
            rawValue.components(separatedBy: "/").last ?? rawValue
        }
        
        /// All the time zones areas known to the system.
        public static var allAreas: [String] {
            Set(allCases.map({ $0.area })).sorted()
        }
    }
}

extension TimeZone.Name: CustomStringConvertible {
    public var description: String {
        rawValue
    }
}
