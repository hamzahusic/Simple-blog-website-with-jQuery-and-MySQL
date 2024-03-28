-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: infoportal
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `korisnik`
--

DROP TABLE IF EXISTS `korisnik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `korisnik` (
  `idkorisnik` int NOT NULL AUTO_INCREMENT,
  `Ime` varchar(45) NOT NULL,
  `Prezime` varchar(45) NOT NULL,
  `Sifra` varchar(300) NOT NULL,
  `email` varchar(45) NOT NULL,
  `uloga` varchar(45) NOT NULL,
  PRIMARY KEY (`idkorisnik`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `korisnik`
--

LOCK TABLES `korisnik` WRITE;
/*!40000 ALTER TABLE `korisnik` DISABLE KEYS */;
INSERT INTO `korisnik` VALUES (2,'Benjamin','Selimović','$2b$10$eqZNBk8mCBMOJqu5XS006uDLw4x.eSFzIO.soiyubook9ryxNyor2','benjamin@gmail.com','admin'),(4,'John','Doe','$2b$10$iTXB/UGSdZN6Zut7ofb2SOc7nE.1HYLa0KROrqCs2gtRWWNLql9Du','john@gmail.com','in_process');
/*!40000 ALTER TABLE `korisnik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objava`
--

DROP TABLE IF EXISTS `objava`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objava` (
  `idobjava` int NOT NULL AUTO_INCREMENT,
  `Naslov` varchar(200) NOT NULL,
  `Sadrzaj` text NOT NULL,
  `Datum_objave` datetime NOT NULL,
  `Putanja_slike` varchar(45) NOT NULL,
  `korisnik_idkorisnik` int NOT NULL,
  `kategorija` varchar(15) NOT NULL,
  PRIMARY KEY (`idobjava`,`korisnik_idkorisnik`),
  KEY `fk_objava_korisnik_idx` (`korisnik_idkorisnik`),
  CONSTRAINT `fk_objava_korisnik` FOREIGN KEY (`korisnik_idkorisnik`) REFERENCES `korisnik` (`idkorisnik`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objava`
--

LOCK TABLES `objava` WRITE;
/*!40000 ALTER TABLE `objava` DISABLE KEYS */;
INSERT INTO `objava` VALUES (10,'Uvod u Svijet Blogova: Mjesto Gdje Se Riječi Pretvaraju u Inspiraciju','Dobrodošli u svijet blogova, mjesto gdje se reči pretvaraju u inspiraciju, ideje postaju stvarnost, a zajednice se povezuju putem digitalnog svijeta. Blogovi su postali nezaobilazan dio online kulture, pružajući platformu za izražavanje, informisanje i zabavu.\r\n\r\nŠta je blog?\r\nPrije nego što zaronimo dublje, važno je razumjeti šta zapravo predstavlja blog. Blog je online dnevnik ili platforma na kojoj pojedinac ili grupa ljudi dijeli svoje misli, ideje, iskustva ili ekspertizu putem tekstova, fotografija, videa ili drugih medijskih formata. Oni mogu pokrivati širok spektar tema, od ličnih putovanja do političkih analiza, od kulinarstva do tehnoloških inovacija.\r\n\r\nRaznolikost Blogova:\r\nJedna od najljepših stvari kod blogova je raznolikost koju nude. Postoje blogovi koji se fokusiraju na specifične teme poput mode, zdravlja, ili ekologije, dok drugi nude široku paletu sadržaja koji zadovoljavaju različite interesovanja. Bez obzira da li tražite savjete za putovanja, recepte za kulinarske delicije, ili analize najnovijih filmskih ostvarenja, postoji blog za svakoga.\r\n\r\nZajednička Povezanost:\r\nJedna od ključnih karakteristika blogova je njihova sposobnost da izgrade zajednice i povežu ljude širom svijeta. Kroz komentare, diskusije na društvenim mrežama, ili čak susrete u stvarnom svijetu, čitaoci i blogeri mogu razmjenjivati ideje, iskustva i podršku. Ova interakcija često stvara osjećaj pripadnosti i zajedništva među onima koji dijele slične interese i strasti.\r\n\r\nZašto Blogovati?\r\nMnogi ljudi se odlučuju da pokrenu blog iz različitih razloga. Za neke je to način da izraze svoje kreativne strane i podijele svoje talente s drugima. Drugi vide blogovanje kao platformu za izgradnju ličnog brenda ili promovisanje svojih proizvoda i usluga. Bez obzira na motivaciju, blogovanje može biti izuzetno zadovoljavajuće iskustvo koje omogućava pojedincima da pronađu svoj glas u digitalnom svijetu.\r\n\r\nZaključak:\r\nU današnjem digitalnom dobu, blogovi predstavljaju moćan alat za izražavanje, informisanje i povezivanje. Bez obzira da li ste ljubitelj čitanja ili razmišljate o pokretanju vlastitog bloga, svijet blogovanja nudi neograničene mogućnosti za otkrivanje, učenje i inspiraciju. Zato se udobno smjestite, otvorite svoj omiljeni blog i prepustite se otkrivanju svega što ovaj fascinantan digitalni svijet ima da ponudi.','2024-03-16 12:33:37','829864ec46a652871ae7a5e932909f52',2,'news'),(11,'Priča : Izgubljeni u Vremenskom Labirintu','Dugo se već pričalo o staroj i tajanstvenoj kući duboko skrivenoj u šumi. Ljudi su izbjegavali put kroz gustu šumu koja je vodila do nje, tvrdeći da su čuli neobične zvukove i vidjeli čudne sjene u mraku. Međutim, jednog sunčanog ljetnog dana, troje hrabrih prijatelja - Mia, Tom i Ben - odlučili su istražiti tu misterioznu kuću.\r\n\r\nKada su stigli pred kuću, odjednom su osjetili hladan povjetarac koji im je naježio kožu. Kuća je izgledala kao da je izvučena iz priča o duhovima - fasada je bila prekrivena bršljanom, prozori su bili zamagljeni, a vrata su škripala kao da su stara vijekovima. Mia, Tom i Ben su se gledali s mješavinom uzbuđenja i straha, ali su odlučno krenuli prema vratima.\r\n\r\nKada su ušli unutra, atmosfera je postala još mračnija. Kuća je bila puna prašine, paučine su se pletile po uglovima, a svjetlost sunca jedva je probijala kroz prozore. Mia je zamijetila staru sliku na zidu koja je prikazivala tajanstvenu ženu s dubokim, tugaljivim pogledom. Osjećala se kao da ju je slika gledala izravno u oči.\r\n\r\nDok su istraživali prostorije kuće, čuli su neobične zvukove koji su dopirali iz dubine. Zvukovi su se činili kao da su dio neke drevne melodije koja je bila zarobljena u vremenu. Ben je naglo zastao kad je primijetio staru knjigu na prašnjavom stolu. Kada je otvorio knjigu, pronašao je zapisanu poruku: \"Vrijeme je labirint, a svaka stranica ove kuće čuva tajnu.\"\r\n\r\nNjihova znatiželja postala je neodoljiva, pa su odlučili nastaviti istraživanje. Međutim, što su više istraživali, to su se činili kao da su zaglavljeni u vremenu. Satovi su stajali, a sunce se činilo kao da se nikada ne pomjera s neba. Njihova avantura je postala borba protiv vremena koje se činilo da ih je zatočilo unutar ove misteriozne kuće.\r\n\r\nDok su se borili da pronađu izlaz, shvatili su da je tajna ove kuće bila duboko povezana s prošlošću i da su možda zapali u vrtlog vremena koje nije lako pobjeći. Kroz izazove, strahove i neočekivana otkrića, njihovo prijateljstvo postalo je ključ za razumijevanje tajne kuće i put ka slobodi.\r\n\r\nNa kraju, kada su se izgubljeni u vremenu i prostoru suočili s najvećim izazovima, uspjeli su otkriti tajnu koja je držala kuću zarobljenom. Njihova hrabrost, odlučnost i zajedništvo nisu samo oslobodili njih, već su oslobodili i dušu kuće, koja je konačno našla mir.\r\n\r\nKada su napustili kuću, sunce je ponovo obasjalo nebo, a vjetar je nosio miris slobode. Mia, Tom i Ben su se okrenuli prema šumi s osmijehom na licu, znajući da su kroz svoju avanturu naučili važnu lekciju - ponekad je hrabrost da se suočimo s tajnama prošlosti ključ za oslobađanje izazova budućnosti.','2024-03-16 13:29:05','dfffc4955599413d34af484364a17fc0',2,'news'),(12,'Okusi Svijeta: Putovanje Kroz Raznolikost Hrane','Dobrodošli u svijet hrane, mjesto gdje se kulture susreću, tradicije slave, a nepce putuje kroz raznolikost okusa i tekstura. U ovom blogu istražit ćemo raznolike gastronomske čarolije koje svijet nudi i kako hrana postaje centralni dio našeg iskustva života.\r\n\r\nKulinarstvo kao Kultura:\r\nHrana je mnogo više od osnovne potrebe - ona je izraz kulture, tradicije i identiteta. Svaka kuhinja nosi svoju priču koja se prenosi generacijama, od tajnih porodičnih recepata do nacionalnih specijaliteta koji su sinonim za određene zemlje ili regije. Kroz hranu, možemo istražiti dubine jednog naroda, upoznati njihove običaje i osjetiti puls njihovog života.\r\n\r\nPutovanje Okusima:\r\nJedna od najuzbudljivijih avantura je putovanje kroz različite kuhinje svijeta. Od začinjene hrane Azije do sofisticirane kuhinje Evrope, svaka destinacija nudi svoj jedinstveni spoj okusa, mirisa i tekstura. Putovanje okusima nije samo putovanje po geografskim lokacijama, već i putovanje kroz istoriju, prirodu i društvo.\r\n\r\nHrana i Zdravlje:\r\nPored uživanja u raznolikim gastronomskim užicima, važno je istražiti i ulogu hrane u našem zdravlju i blagostanju. Kako se svijest o zdravoj ishrani širi, sve više ljudi traži načine da unaprijede svoju ishranu, koristeći svježe sastojke, izbalansirane obroke i tradicionalne recepte koji se temelje na prirodnim i sezonskim namirnicama.\r\n\r\nKreativnost u Kuhinji:\r\nKuhinja je prostor za izražavanje kreativnosti i eksperimentisanje s ukusima. Od pripreme jednostavnih domaćih jela do složenih gastronomskih remek-djela, svako jelo nosi pečat autentičnosti i individualnosti svog kreatora. Kroz kulinarske izazove, možemo istražiti nove tehnike, kombinacije sastojaka i načine serviranja koji nas inspirišu i izazivaju.\r\n\r\nZajedništvo Oko Stola:\r\nNajljepši trenuci su oni koje dijelimo oko stola s voljenima. Hrana nas povezuje i stvara neprocjenjive uspomene dok zajedno dijelimo obroke, razgovaramo i smijemo se. Bez obzira na kulturu ili tradiciju, hrana ima moć da okupi ljude i stvori nezaboravne trenutke zajedništva i ljubavi.\r\n\r\nKroz ovaj blog, istražit ćemo svijet hrane s otvorenim umom i srcem, istražujući njene dubine, bogatstvo i neograničene mogućnosti. Pridružite nam se u ovom putovanju kroz okuse svijeta i otkrijte čaroliju koja se krije u svakom zalogaju. Bon appétit!','2024-03-16 13:21:57','0777d9bdc6ca974e26c77ad90789a41a',2,'food'),(13,'Uživajte u Zvuku: Praktični Vodič za Odabir Savršenih Slušalica','Slušalice su postale neizostavan deo našeg svakodnevnog života. Od slušanja omiljene muzike tokom šetnje do sastanaka putem video poziva, kvalitetne slušalice mogu poboljšati naše iskustvo zvuka i komunikacije. Međutim, sa toliko različitih modela i opcija dostupnih na tržištu, odabir pravih slušalica može biti izazovan. Evo praktičnog vodiča koji će vam pomoći da pronađete savršen par slušalica za svoje potrebe.\r\n\r\n1. Tip slušalica\r\n\r\nPrvo što treba uzeti u obzir prilikom odabira slušalica je njihov tip. Postoje tri glavne vrste slušalica: u-uvlakači, na-ušni i preko-ušne slušalice.\r\n\r\nU-uvlakači (In-ear): Ove slušalice idu direktno u ušni kanal i obično su male i lagane, čineći ih idealnim za korišćenje dok ste u pokretu. Pružaju dobar zvuk i često dolaze sa dodatnim jastučićima različitih veličina radi prilagođavanja vašem uhu.\r\n\r\nNa-ušne (On-ear): Ove slušalice sede na vašem uhu umesto u njemu. Obično su udobnije za nošenje tokom dužeg vremenskog perioda i pružaju dobar balans između udobnosti i kvaliteta zvuka.\r\n\r\nPreko-ušne (Over-ear): Ove slušalice imaju veće jastučiće koji pokrivaju celo uho. Pružaju odličnu izolaciju zvuka i vrhunski kvalitet zvuka, čineći ih odličnim izborom za ljubitelje muzike ili audio profesionalce.\r\n\r\n2. Povezivanje\r\n\r\nDrugi važan faktor je način povezivanja slušalica sa vašim uređajem. Postoje bežične i žičane opcije.\r\n\r\nBežične: Bežične slušalice koriste Bluetooth tehnologiju za povezivanje sa uređajem. Pružaju slobodu kretanja i praktičnost, ali imaju ograničenje u trajanju baterije.\r\n\r\nŽičane: Žičane slušalice koriste audio kabl za povezivanje sa uređajem. Iako su manje praktične u smislu slobode kretanja, nude neprekidan kvalitet zvuka i ne zahtevaju punjenje baterije.\r\n\r\n3. Kvalitet zvuka\r\n\r\nKvalitet zvuka je ključni faktor prilikom odabira slušalica. Potražite slušalice sa širokim rasponom frekvencija, jasnim visokim tonovima i dubokim basom. Takođe, obratite pažnju na aktivno uklanjanje buke ako vam je potrebno izolovanje od spoljnog sveta.\r\n\r\n4. Ergonomija i udobnost\r\n\r\nVažno je da odaberete slušalice koje su udobne za nošenje tokom dužeg vremenskog perioda, posebno ako ih koristite tokom fizičkih aktivnosti ili dugih putovanja. Obratite pažnju na materijale od kojih su napravljene jastučiće za uši ili dodatke za uši kako biste osigurali maksimalnu udobnost.\r\n\r\n5. Budžet\r\n\r\nKao i kod svake kupovine, važno je postaviti budžet pre nego što se odlučite za kupovinu slušalica. Cena može varirati u zavisnosti od brenda, kvaliteta zvuka i dodatnih funkcija poput aktivnog uklanjanja buke ili bežičnog povezivanja. Postavite realna očekivanja i pronađite slušalice koje zadovoljavaju vaše potrebe, ali i vaš budžet.\r\n\r\nUz ovaj vodič, trebalo bi da ste spremni da pronađete savršen par slušalica koji odgovara vašim potrebama i preferencijama. Bez obzira da li tražite slušalice za aktivni životni stil, profesionalnu upotrebu ili jednostavno za uživanje u omiljenoj muzici, važno je da pažljivo razmotrite sve opcije pre nego što napravite svoj izbor. Uživajte u vrhunskom zvuku sa svojim novim parom slušalica!','2024-03-16 12:16:25','5d2683aa2d1c4a85fba0873f1d3bf7d0',2,'tech'),(14,'Ključni Elementi Prilikom Odabira Savršenog Monitora u 2024 Godini','Monitori su temeljni deo svake radne ili zabavne postavke računara. Od osnovnih kancelarijskih zadataka do igara visoke rezolucije, kvalitetan monitor može značajno poboljšati vaše iskustvo korisnika. Međutim, sa širokim spektrom opcija dostupnih na tržištu, odabir pravog monitora može biti izazovan. Evo ključnih elemenata koje treba uzeti u obzir prilikom odabira savršenog monitora za vaše potrebe:\r\n\r\n1. Veličina i Rezolucija\r\n\r\nPrva stvar koju treba uzeti u obzir je veličina monitora i njegova rezolucija. Veličina monitora se obično meri dijagonalno, a standardne veličine se kreću od 21 do 34 inča. Veći monitori mogu poboljšati produktivnost i pružiti bolje iskustvo pri igranju, dok manji monitori mogu biti pogodniji za kompaktne radne prostorije.\r\n\r\nRezolucija se odnosi na broj piksela koji monitor može prikazati i utiče na jasnoću slike. Standardne rezolucije uključuju Full HD (1920x1080 piksela), Quad HD (2560x1440 piksela) i 4K Ultra HD (3840x2160 piksela). Viša rezolucija pruža oštriju sliku, ali zahteva i snažniju grafičku karticu.\r\n\r\n2. Tehnologija Panela\r\n\r\nPanel monitora određuje njegovu sposobnost prikaza boja, brzinu osvežavanja i uglove gledanja. Tri najčešće korišćena panela su:\r\n\r\nIPS (In-Plane Switching): IPS paneli pružaju širok spektar boja i odlične uglove gledanja, čineći ih idealnim za grafički dizajn i profesionalnu upotrebu.\r\n\r\nTN (Twisted Nematic): TN paneli imaju brži odziv i nižu cenu od IPS panela, ali imaju lošije uglove gledanja i manje preciznu reprodukciju boja. Oni su često izabrani za gejming monitore zbog brzine osvežavanja ekrana.\r\n\r\nVA (Vertical Alignment): VA paneli kombinuju karakteristike IPS i TN panela, pružajući dobar balans između brzine, boja i kontrasta.\r\n\r\n3. Osvežavanje Ekrana i Vreme Odziva\r\n\r\nBrzina osvežavanja monitora, izražena u Hertzima (Hz), određuje koliko puta u sekundi monitor može ažurirati sliku. Veće vrednosti osvežavanja pružaju glađe prikaze, što je posebno važno prilikom igranja video igara ili gledanja brzih video sadržaja.\r\n\r\nVreme odziva, mereno u milisekundama (ms), odnosi se na vreme koje monitoru treba da promeni boju piksela. Manje vrednosti vremena odziva obezbeđuju manje zamućenja slike i bolje performanse u brzim scenama.\r\n\r\n4. Dodatne Funkcije\r\n\r\nPored osnovnih karakteristika, mnogi monitori dolaze sa dodatnim funkcijama koje mogu poboljšati vaše iskustvo korisnika. Ovo uključuje:\r\n\r\nUgrađeni zvučnici: Za one koji ne koriste dodatne zvučne sisteme, ugrađeni zvučnici mogu biti praktična opcija za reprodukciju zvuka.\r\n\r\nErgonomske Opcije Montaže: Monitori sa mogućnošću podesivosti visine, nagiba i rotacije omogućavaju prilagođavanje postavke ekrana vašim ergonomskim potrebama.\r\n\r\nHDR (High Dynamic Range): HDR tehnologija poboljšava kontrast i boje, pružajući bogatije i živopisnije slike.\r\n\r\n5. Budžet\r\n\r\nKao i kod svake kupovine, budžet je važan faktor prilikom odabira monitora. Cene monitora variraju u zavisnosti od veličine, rezolucije, panela i dodatnih funkcija. Postavite realna očekivanja u skladu sa vašim budžetom i pronađite monitor koji najbolje odgovara vašim potrebama.\r\n\r\nSa ovim ključnim elementima na umu, trebalo bi da imate bolji uvid u ono što treba tražiti prilikom kupovine monitora. Bez obzira da li vam je potreban monitor za svakodnevnu kancelarijsku upotrebu, profesionalno uređivanje slika i videa ili gejming, važno je da pažljivo razmotrite sve opcije pre donošenja konačne odluke. Uživajte u kristalno jasnoj slici sa svojim novim monitorom!','2024-03-16 15:00:35','53622fc8ea520327090ca4b62c07ed36',2,'tech'),(15,'Kako Odabrati Pravi Laptop za Vaše Potrebe','Laptopovi su postali nezamenjivi uređaji u modernom životu. Od poslovnih sastanaka do gledanja omiljenih filmova u pokretu, laptopovi pružaju praktičnost i mobilnost. Međutim, sa toliko različitih modela dostupnih na tržištu, odabir pravog laptopa može biti izazovan. Evo nekoliko ključnih faktora koje treba uzeti u obzir prilikom odabira laptopa koji najbolje odgovara vašim potrebama:\r\n\r\n1. Namena\r\n\r\nPrvo što treba razmotriti je namena laptopa. Da li vam je potreban za posao, školu, zabavu ili sve zajedno? Ovo će vam pomoći da odredite potrebne specifikacije i funkcije.\r\n\r\nPoslovna Upotreba: Ako vam je potreban laptop za poslovnu upotrebu, možda ćete želeti model sa snažnim procesorom, velikom memorijom i dugotrajnom baterijom.\r\n\r\nŠkolska Upotreba: Za školsku upotrebu, lakši i prenosiviji modeli sa dugotrajnom baterijom mogu biti bolji izbor.\r\n\r\nMultimedija i Zabava: Ako planirate koristiti laptop za gledanje filmova, igranje igara ili uređivanje medija, potražite model sa visokokvalitetnim ekranom, snažnom grafičkom karticom i bogatim zvučnicima.\r\n\r\n2. Performanse\r\n\r\nPerformanse laptopa su od suštinskog značaja, posebno ako planirate raditi zahtevne zadatke poput video uređivanja ili gejminga. Ključni faktori performansi uključuju:\r\n\r\nProcesor: Potražite najnovije generacije procesora sa dovoljno snage za vaše potrebe. Intelove i AMD-ove procesore pružaju različite performanse i cene.\r\n\r\nRAM: Više RAM-a omogućava brže izvršavanje više zadataka istovremeno. Za većinu korisnika, 8GB do 16GB RAM-a je optimalno.\r\n\r\nMemorija: Odaberite laptop sa dovoljno prostora za skladištenje vaših datoteka. Ako često radite sa velikim medijima, razmislite o SSD-u za brži pristup podacima.\r\n\r\n3. Dizajn i Prenosivost\r\n\r\nDizajn i prenosivost su važni faktori, posebno ako planirate često nositi laptop sa sobom. Razmislite o faktorima poput težine, debljine i trajanja baterije. Takođe, obratite pažnju na tastaturu i touchpad kako biste osigurali udobnost prilikom korišćenja.\r\n\r\n4. Ekran\r\n\r\nKvalitet ekrana može znatno uticati na vaše iskustvo korišćenja laptopa. Potražite laptop sa visokokvalitetnim ekranom koji pruža jasnu sliku i žive boje. Obratite pažnju na faktore poput rezolucije, veličine ekrana i tehnologije ekrana (npr. IPS za bolje uglove gledanja).\r\n\r\n5. Cena\r\n\r\nKao i kod svake kupovine, postavljanje budžeta je važno prilikom kupovine laptopa. Cene laptopa mogu značajno varirati u zavisnosti od brenda, specifikacija i dodatnih funkcija. Postavite budžet koji odražava vaše potrebe i potražite najbolji mogući laptop u okviru tog budžeta.\r\n\r\n6. Marka i Pouzdanost\r\n\r\nNa kraju, obratite pažnju na marku laptopa i njihovu reputaciju za pouzdanost i kvalitet. Poznati brendovi obično nude bolju podršku korisnicima i duže garancijske periode.\r\n\r\nSa ovim faktorima na umu, trebali biste biti bolje opremljeni da pronađete laptop koji najbolje odgovara vašim potrebama. Bez obzira da li tražite laptop za rad, učenje ili zabavu, pažljivo razmotrite sve opcije pre donošenja konačne odluke. Uživajte u svojem novom laptopu i koristite ga punim potencijalom!','2024-03-16 13:25:15','b9754a5e580aebbc7263998ead69f411',2,'tech'),(16,'Umjetna inteligencija (AI) je danas jedan od najdinamičnijih i najinovativnijih polja tehnologije. Evo kako se AI koristi i razvija danas','AI se sve više koristi u različitim industrijama kako bi se poboljšala efikasnost, produktivnost i inovacija. U proizvodnji, AI se koristi za optimizaciju procesa, praćenje i održavanje opreme te predviđanje kvarova. U zdravstvu, AI se koristi za dijagnostiku bolesti, personalizovanu medicinu i analizu velikih setova medicinskih podataka radi identifikacije uzoraka i pronalaženja novih terapija. U finansijskom sektoru, AI se koristi za analizu tržišta, upravljanje rizicima, prevenciju prevara i personalizovano upravljanje portfeljima.\r\n\r\n1. Autonomna Vozila\r\n\r\nRazvoj autonomnih vozila predstavlja jedno od najuzbudljivijih dostignuća u oblasti AI. Kompanije poput Tesla, Google (putem Waymo), Uber i mnoge druge investiraju u razvoj tehnologije autonomnih vozila. AI se koristi za prepoznavanje objekata, interpretaciju saobraćajnih znakova, planiranje rute i donošenje brzih odluka u realnom vremenu radi sigurnog vođenja vozila.\r\n\r\n2. Personalizovana Iskustva Korisnika\r\n\r\nAI se koristi kako bi se stvorila personalizovana iskustva korisnika u različitim aplikacijama i servisima. Velike tehnološke kompanije kao što su Google, Amazon i Netflix koriste AI za preporuke proizvoda, prilagođeni sadržaj i predviđanje korisničkih preferencija. Ovo pomaže u poboljšanju korisničkog angažmana i zadovoljstva.\r\n\r\n3. Napredna Analitika i Predikcije\r\n\r\nAI se koristi za analizu velikih setova podataka radi identifikacije uzoraka, predikcija budućih događaja i donošenje informisanih odluka. U oblastima poput marketinga, prodaje, logistike i upravljanja lancima snabdevanja, AI omogućava organizacijama da bolje razumeju svoje poslovanje, identifikuju trendove i predvide buduće potrebe.\r\n\r\n4. Etički i Društveni Aspekti\r\n\r\nSa sve većom upotrebom AI dolazi i sa pitanjima o etici i društvenim posledicama. Pitanja privatnosti podataka, diskriminacije, sigurnosti i transparentnosti postaju sve važnija. Stoga, postoji sve veća potreba za razvojem politika, regulativa i standarda koji će regulisati upotrebu AI i zaštititi interese korisnika i društva u celini.\r\n\r\nU suštini, umjetna inteligencija je danas neizostavan deo našeg svakodnevnog života, oblikujući način na koji radimo, komuniciramo i zabavljamo se. Sa daljim napretkom tehnologije, očekuje se da će AI nastaviti da transformiše naše društvo na brojne načine u budućnosti.','2024-03-16 12:27:49','2630c93dbfd75e62ac1483bea8ecc335',2,'news'),(17,'Evo jednostavnog recepta za ukusnu pileću picu','Pileća Pizza:\r\n\r\nSastojci:\r\n\r\n1 pizza testo (možete koristiti gotovo testo ili napraviti svoje)\r\n1 šolja paradajz sosa\r\n1 šolja rendanog mozzarelle sira\r\n1 pileće grudi, kuvane i iseckane na kockice\r\n1/2 crvene paprike, iseckane na tanke trake\r\n1/2 zelene paprike, iseckane na tanke trake\r\n1/4 crvenog luka, iseckanog na tanke kolutove\r\n1/4 šolje maslina, iseckanih na kolutove\r\n1/4 šolje paradajza, iseckanog na kriške\r\n1/4 šolje pečuraka, iseckanih na tanke listiće\r\nSo, biber, origano i maslinovo ulje po ukusu\r\nUputstvo:\r\n\r\nZagrejte rernu na 220°C.\r\n\r\nRazvaljajte testo na radnoj površini posutoj brašnom, oblikujući krug ili pravougaonik, zavisno od vaše želje.\r\n\r\nPrebacite testo na pleh obložen papirom za pečenje.\r\n\r\nRaširite paradajz sos po testu, ostavljajući malo prostora oko ivica za koru.\r\n\r\nPospite rendanim mozzarellom preko paradajz sosa.\r\n\r\nPo vrhu rasporedite iseckane pileće grudi, papriku, crveni luk, masline, paradajz i pečurke.\r\n\r\nPosolite, pobiberite i pospite origanom preko pice, po ukusu.\r\n\r\nLagano pokapajte maslinovim uljem po vrhu.\r\n\r\nStavite picu u zagrejanu rernu i pecite 12-15 minuta ili dok korica ne postane zlatno smeđa, a sir ne otopi i ne postane blago zlatno smeđ.\r\n\r\nIzvadite picu iz rerne i ostavite da se malo ohladi pre sečenja.\r\n\r\nSeckajte i poslužite toplu pileću picu sa omiljenim dodacima, poput dodatnog paradajz sosa ili ljutih papričica.\r\n\r\nUživajte u vašoj domaćoj pilećoj pici!','2024-03-16 12:30:58','a0886fcda0397aaee5de2b8dbedfdef9',2,'food'),(18,'Zdrava Ishrana: Ključ za Očuvanje Zdravlja i Vitalnosti','Ishrana igra ključnu ulogu u našem opštem zdravlju i blagostanju. Od vitalnih hranljivih materija koje pružaju energiju i podržavaju funkcije tela do antioksidanata koji štite ćelije od oštećenja, hrana koju unosimo ima direktni uticaj na naše fizičko i mentalno zdravlje. Evo nekoliko ključnih principa zdrave ishrane i saveta za postizanje ravnoteže i vitalnosti:\r\n\r\n1. Raznolikost na Tanjiru\r\n\r\nVarijacija je ključ zdrave ishrane. Konzumiranje različitih vrsta hrane osigurava unos širokog spektra hranljivih materija, vitamina i minerala koji su neophodni za optimalno funkcionisanje tela. Uključite raznobojno voće i povrće, integralne žitarice, mahunarke, orašaste plodove, proteine životinjskog i biljnog porekla u svoju ishranu kako biste osigurali raznovrsnu ishranu.\r\n\r\n2. Balans Makronutrijenata\r\n\r\nBalansirana ishrana uključuje odgovarajući unos makronutrijenata - proteina, ugljenih hidrata i masti. Proteini su važni za izgradnju mišića i tkiva, ugljeni hidrati pružaju energiju, dok masti podržavaju apsorpciju vitamina i regulišu hormonalnu ravnotežu. Birajte zdrave izvore proteina poput piletine, ribe, mahunarki i tofu-a, kompleksne ugljene hidrate poput integralnih žitarica, povrća i voća, i zdrave masti poput maslinovog ulja, avokada i orašastih plodova.\r\n\r\n3. Ograničenje Prerađene Hrane i Šećera\r\n\r\nPrerađena hrana i dodatni šećeri često su povezani sa povećanim rizikom od gojaznosti, srčanih oboljenja, dijabetesa i drugih zdravstvenih problema. Pokušajte smanjiti unos prerađene hrane poput brze hrane, slatkiša, grickalica i gaziranih pića, i umesto toga birajte celovite, neprerađene namirnice koje su bogate hranljivim sastojcima.\r\n\r\n4. Hidratacija\r\n\r\nHidratacija je ključna za održavanje zdravlja tela. Pijte dovoljno vode tokom dana kako biste održali hidriranost i podržali funkcije organa. Pored vode, uključite i druge tečnosti poput biljnih čajeva, svežih sokova od voća i povrća, kako biste dodatno podržali hidrataciju.\r\n\r\n5. Fokus na Kvalitetu, Ne na Količini\r\n\r\nUmesto da se fokusirate na brojanje kalorija, fokusirajte se na kvalitet hrane koju unosite. Birajte hranu koja je bogata hranljivim sastojcima i koja podržava vaše zdravlje. Jedite polako i slušajte signale sitosti vašeg tela kako biste izbegli prejedanje.\r\n\r\n6. Održavanje Balansa i Fleksibilnosti\r\n\r\nZdrava ishrana treba da bude održiva i uključuje fleksibilnost. Nemojte sebi zabraniti određene namirnice, već se trudite da održavate balans i uživate u umerenosti. Ponekad je u redu uživati u omiljenom slatkišu ili obroku, pod uslovom da je to deo uravnotežene ishrane.\r\n\r\nZdrava ishrana je ključ za očuvanje zdravlja i vitalnosti tokom celog života. Uzimajući u obzir ove principe i savete, možete napraviti pozitivne promene u svojoj ishrani i unaprediti svoje zdravlje i blagostanje. Zapamtite da je zdrava ishrana proces, tako da budite strpljivi i dosledni u svojim naporima ka zdravijem načinu života.','2024-03-16 12:32:35','2a75ba5ca1bf77122d849f9e9166888b',2,'food');
/*!40000 ALTER TABLE `objava` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-16 16:06:34