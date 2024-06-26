DROP TABLE PLAYER CASCADE CONSTRAINTS;
DROP TABLE PLAYER_TEAM CASCADE CONSTRAINTS;
DROP TABLE IPL_MANAGEMENT CASCADE CONSTRAINTS;
DROP TABLE SPONSOR CASCADE CONSTRAINTS;
DROP TABLE COMPONY CASCADE CONSTRAINTS;
DROP TABLE TEAM CASCADE CONSTRAINTS;
DROP TABLE TEAM_SPONSOR CASCADE CONSTRAINTS;
DROP TABLE AUCTION CASCADE CONSTRAINTS;

DROP VIEW DOMINANT_BOW;
DROP VIEW SPENT_MONEY;
DROP VIEW ASP;
DROP VIEW REMAIN_MONEY;


CREATE TABLE AUCTION
(
  A_ID INT PRIMARY KEY,
  AUCTION_DATE DATE
);



INSERT INTO AUCTION VALUES(1,'20-FEB-2008');
INSERT INTO AUCTION VALUES(2,'13-MAR-2008');



CREATE TABLE IPL_MANAGEMENT
(
M_ID VARCHAR2(20) PRIMARY KEY,
M_OWNER VARCHAR2(20),
M_HEAD_COACH VARCHAR2(20)
);





INSERT INTO IPL_MANAGEMENT VALUES('M001','GAYATRI REDDY','ROBIN SINGH');
INSERT INTO IPL_MANAGEMENT VALUES('M002','PREITY ZINTA','TOM MOODY');
INSERT INTO IPL_MANAGEMENT VALUES('M003','MUKESH AMBANI','LALCHAND RAJPUT');
INSERT INTO IPL_MANAGEMENT VALUES('M004','VIJAY MALLYA','VENKATESH PRASAD');
INSERT INTO IPL_MANAGEMENT VALUES('M005','G M RAO','GREG SHIPPERD');
INSERT INTO IPL_MANAGEMENT VALUES('M006','SHILPA SHETTY','GEREMY SNAPE');
INSERT INTO IPL_MANAGEMENT VALUES('M007','N SRINIVASAN','KEPLER VESSELS');
INSERT INTO IPL_MANAGEMENT VALUES('M008','SHAH RUKH KHAN','JOHN BUCHANAN');





CREATE TABLE COMPONY
(
  CID VARCHAR(10) PRIMARY KEY,
  COMP_NAME VARCHAR(30),
  OWNER_NAME VARCHAR(30),
  C_PHONE NUMBER
);




 
INSERT INTO COMPONY VALUES('C01','RELIANCE INDUSTRIES','MUKESH AMBANI',9998887770);
INSERT INTO COMPONY VALUES('C02','BOMBAY TRADING','PREITY ZINTA',9998887771);
INSERT INTO COMPONY VALUES('C03',' RED CHILLIES ENTERTAINMENT','SHAH RUKH KHAN',9998887772);
INSERT INTO COMPONY VALUES('C04','EMERGING MEDIA','SHILPA SHETTY',9998887773);
INSERT INTO COMPONY VALUES('C05','DECCAN CHRONICLE','GAYATRI REDDY',9998887774);
INSERT INTO COMPONY VALUES('C06','GMR GROUP','GM RAO',9998887775);
INSERT INTO COMPONY VALUES('C07','INDIA CEMENTS','N SRINIVASAN',9998887776);
INSERT INTO COMPONY VALUES('C08','UNITED BREWERIES GROUP','VIJAY MALLYA',9998887777);
INSERT INTO COMPONY VALUES('C09','ICICI','CHANDA KOCHAR',9995837777);
INSERT INTO COMPONY VALUES('C10','SAHARA','SUBRATA ROY',9598887777);
INSERT INTO COMPONY VALUES('C11','FUTURE GROUPS','KISHARE BIYANI',9998887777);
INSERT INTO COMPONY VALUES('C12','TATA','RATAN TATA',9998887777);
INSERT INTO COMPONY VALUES('C13','HERO HONDA','PAWAN MUNJAL',9998834567);





CREATE TABLE SPONSOR
(
  SPONSOR_ID VARCHAR(10) PRIMARY KEY,
  SPONSOR_NAME   VARCHAR(30)
);





INSERT INTO SPONSOR VALUES('SP01','ADIDAS');
INSERT INTO SPONSOR VALUES('SP02','HERO_HONDA');
INSERT INTO SPONSOR VALUES('SP03','NOKIA');
INSERT INTO SPONSOR VALUES('SP04','MASTERCARD');
INSERT INTO SPONSOR VALUES('SP05','REEBOK');
INSERT INTO SPONSOR VALUES('SP06','SPICE');
INSERT INTO SPONSOR VALUES('SP07','FLY EMIRATES');
INSERT INTO SPONSOR VALUES('SP08','GULF');
INSERT INTO SPONSOR VALUES('SP09','BAJAJ ALLIANZ');
INSERT INTO SPONSOR VALUES('SP10','ZANDU BALM');
INSERT INTO SPONSOR VALUES('SP11','IDEA');
INSERT INTO SPONSOR VALUES('SP12','KING FISHER');
INSERT INTO SPONSOR VALUES('SP13','JAYPEE');
INSERT INTO SPONSOR VALUES('SP14','AIRCEL');
INSERT INTO SPONSOR VALUES('SP15','KOTAK');
INSERT INTO SPONSOR VALUES('SP16','ULTRATECH CEMENT');
INSERT INTO SPONSOR VALUES('SP17','HDIL');
INSERT INTO SPONSOR VALUES('SP18','PUMA');
INSERT INTO SPONSOR VALUES('SP19','CHRONICLE');
INSERT INTO SPONSOR VALUES('SP20','INDIA CEMENT');




CREATE TABLE TEAM
(
  TEAM_ID NUMBER PRIMARY KEY,
  TEAM_NAME VARCHAR(30),
  CID VARCHAR(10),
  TEAM_COST_IN_US$_MILLION FLOAT,
  MID VARCHAR2(20),
  MAX_AMOUNT_IN_US$_THOU NUMBER,
  FOREIGN KEY (MID) REFERENCES IPL_MANAGEMENT(M_ID),
  FOREIGN KEY (CID) REFERENCES COMPONY(CID)
  );
 
 
 
 
INSERT INTO TEAM VALUES(1,'DECCAN CHARGERS','C05',107.00,'M001',7000);
INSERT INTO TEAM VALUES(2,'CHENNAI SUPER KINGS','C07',91.00,'M007',7000);
INSERT INTO TEAM VALUES(3,'MUMBAI INDIANS','C01',111.90,'M003',7000);
INSERT INTO TEAM VALUES(4,'ROYAL CHALLENGERS BANGALORE','C08',111.60,'M004',7000);
INSERT INTO TEAM VALUES(5,'DELHI DAREDEVILS','C06',84.00,'M005',7000);
INSERT INTO TEAM VALUES(6,'KINGS XI PUNJAB','C02',76.00,'M002',7000);
INSERT INTO TEAM VALUES(7,'KOLKATA KNIGHT RIDERS','C03',75.09,'M008',7000);
INSERT INTO TEAM VALUES(8,'RAJASTHAN ROYALS','C04',67.00,'M006',7000);




CREATE TABLE TEAM_SPONSOR
  (   SPONSOR_ID VARCHAR(10),
      TEAM_ID NUMBER,
      FOREIGN KEY (SPONSOR_ID) REFERENCES SPONSOR(SPONSOR_ID),
      FOREIGN KEY (TEAM_ID)REFERENCES TEAM(TEAM_ID)
  );






INSERT INTO  TEAM_SPONSOR VALUES ('SP01',5);
INSERT INTO  TEAM_SPONSOR VALUES ('SP02',5);
INSERT INTO  TEAM_SPONSOR VALUES ('SP03',7);
INSERT INTO  TEAM_SPONSOR VALUES ('SP04',3);
INSERT INTO  TEAM_SPONSOR VALUES ('SP05',4);
INSERT INTO  TEAM_SPONSOR VALUES ('SP06',6);
INSERT INTO  TEAM_SPONSOR VALUES ('SP07',1);
INSERT INTO  TEAM_SPONSOR VALUES ('SP08',2);
INSERT INTO  TEAM_SPONSOR VALUES ('SP09',8);
INSERT INTO  TEAM_SPONSOR VALUES ('SP10',3);
INSERT INTO  TEAM_SPONSOR VALUES ('SP11',3);
INSERT INTO  TEAM_SPONSOR VALUES ('SP12',4);
INSERT INTO  TEAM_SPONSOR VALUES ('SP13',1);
INSERT INTO  TEAM_SPONSOR VALUES ('SP14',2);
INSERT INTO  TEAM_SPONSOR VALUES ('SP15',6);
INSERT INTO  TEAM_SPONSOR VALUES ('SP16',8);
INSERT INTO  TEAM_SPONSOR VALUES ('SP17',5);
INSERT INTO  TEAM_SPONSOR VALUES ('SP18',1);
INSERT INTO  TEAM_SPONSOR VALUES ('SP19',1);
INSERT INTO  TEAM_SPONSOR VALUES ('SP20',2);
INSERT INTO  TEAM_SPONSOR VALUES ('SP18',8);
INSERT INTO  TEAM_SPONSOR VALUES ('SP18',4);
INSERT INTO  TEAM_SPONSOR VALUES ('SP05',7);
INSERT INTO  TEAM_SPONSOR VALUES ('SP18',7);







CREATE TABLE PLAYER
(
PLAYER_ID VARCHAR2(20) PRIMARY KEY,
PLAYER_NAME VARCHAR2(20),
AGE INT,
COUNTRY VARCHAR2(20),
P_ROLE VARCHAR2(20),
RUNS INT,
WICKETS INT,
BASE_PRICE_IN_US$_THOU INT,
SOLD_PRICE_IN_US$_THOU INT,
AUCTION_ID INT,
STATUS VARCHAR2(20),
FOREIGN KEY(AUCTION_ID) REFERENCES AUCTION(A_ID)
);


INSERT INTO PLAYER VALUES('PR01','MS DHONI',27,'INDIA','WICKETKEEPER',750,0,450,1500,1,'SOLD');
INSERT INTO PLAYER VALUES('PR02','ADAM GILCHRIST',37,'AUSTRALIA','WICKETKEEPER',842,000,300,700,1,'SOLD');
INSERT INTO PLAYER VALUES('PR03','KUMAR SANGAKKARA',31,'SRILANKA','WICKETKEEPER',564,000,250,700,1,'SOLD');
INSERT INTO PLAYER VALUES('PR04','BRENDON MCCULLUM',27,'NEW ZEALAND','WICKETKEEPER',376,000,175,700,1,'SOLD');
INSERT INTO PLAYER VALUES('PR05','DINESH KARTHIK',23,'INDIA','WICKETKEEPER',265,000,200,525,1,'SOLD');
INSERT INTO PLAYER VALUES('PR06','MARK BOUCHER',32,'SOUTH AFRICA','WICKETKEEPER',657,000,200,450,1,'SOLD');
INSERT INTO PLAYER VALUES('PR07','AB DE VILLIERS',24,'SOUTH AFRICA','WICKETKEEPER',354,000,200,300,1,'SOLD');
INSERT INTO PLAYER VALUES('PR08','P JAYWARDANE',29,'SRI LANKA','WICKETKEEPER',245,000,50,000,2,'UNSOLD');
INSERT INTO PLAYER VALUES('PR09','PARTHIV PATEL',23,'INDIA','WICKETKEEPER',345,000,150,325,1,'SOLD');
INSERT INTO PLAYER VALUES('PR10','KAMRAN AKMAL',27,'PAKISTAN','WICKETKEEPER',452,000,150,150,1,'SOLD');
INSERT INTO PLAYER VALUES('PR11','TATENDA TAIBU',25,'ZIMBABWE','WICKETKEEPER',360,000,125,125,1,'SOLD');
INSERT INTO PLAYER VALUES('PR12','SHREEVATS GOSWAMI',19,'INDIA','WICKETKEEPER',120,000,30,30,2,'SOLD');
INSERT INTO PLAYER VALUES('PR13','WRIDDHIMAN SAHA',24,'INDIA','WICKETKEEPER',100,000,30,30,2,'SOLD');
INSERT INTO PLAYER VALUES('PR14','LUKE RONCHI',27,'NEW ZEALAND','WICKETKEEPER',234,000,50,20,2,'SOLD');
INSERT INTO PLAYER VALUES('PR15','PINAL SHAH',19,'INDIA','WICKETKEEPER',32,000,50,50,2,'SOLD');
INSERT INTO PLAYER VALUES('PR16','ARUN KARTIK',22,'INDIA','WICKETKEEPER',23,000,30,30,2,'SOLD');
INSERT INTO PLAYER VALUES('PR17','UDAY KAUL',27,'INDIA','WICKETKEEPER',24,000,30,30,1,'SOLD');
INSERT INTO PLAYER VALUES('PR18','SHANE WARNE',38,'AUSTRALIA','BOWLER',45,65,450,450,1,'SOLD');
INSERT INTO PLAYER VALUES('PR19', 'SHOAIB AKHTAR',32,'PAKISTAN', 'BOWLER',60,50,250,425,1,'SOLD');
INSERT INTO PLAYER VALUES('PR20', 'ANIL KUMBLE',37,'INDIA','BOWLER',80,100,250,500,1,'SOLD');
INSERT INTO PLAYER VALUES('PR21',' MURALIDHARAN',36,'SRILANKA', 'BOWLER', 80,90,250,600,1 ,'SOLD');
INSERT INTO PLAYER VALUES('PR22', 'HARBHAJAN SINGH',28,'INDIA', 'BOWLER',60,70,250,850,1 ,'SOLD');
INSERT INTO PLAYER VALUES('PR23', 'BRETT LEE',31,'AUSTRALIA', 'BOWLER',80,70,300,900,1 ,'SOLD');
INSERT INTO PLAYER VALUES('PR24', 'DANIEL VETTORI',29,'NEW ZEALAND', 'BOWLER',100,80,250,625,1 ,'SOLD');
INSERT INTO PLAYER VALUES('PR25', 'MOHAMMAD ASIF',25,'PAKISTAN', 'BOWLER',120,100,225,650,1,'SOLD');
INSERT INTO PLAYER VALUES('PR26', 'ZAHEER KHAN',29,'INDIA', 'BOWLER',90,100,200,450,1,'SOLD');
INSERT INTO PLAYER VALUES('PR27', 'SREESANTH',25,'INDIA', 'BOWLER',120,130,200,625,1 ,'SOLD');
INSERT INTO PLAYER VALUES('PR28', 'NATHAN BRACKEN',30,'AUSTRALIA', 'BOWLER',60,80,225,325,1 ,'SOLD');
INSERT INTO PLAYER VALUES('PR29', 'RP SINGH',22,'INDIA', 'BOWLER',120,100,200,875,1 ,'SOLD');
INSERT INTO PLAYER VALUES('PR30', 'MURALI KARTIK',31,'INDIA', 'BOWLER',90,100,200,425,1,'SOLD');
INSERT INTO PLAYER VALUES('PR31', 'MAKHAYA NTINI',30,'SOUTH AFRICA', 'BOWLER',50,60,200,200,1,'SOLD');
INSERT INTO PLAYER VALUES('PR32', 'LASITH MALINGA',25,'SRILANKA', 'BOWLER',40,60,200,350,1 ,'SOLD');
INSERT INTO PLAYER VALUES('PR33', 'CHAMINDA VAAS',34,'SRILANKA', 'BOWLER',50,60,200,200,1 ,'SOLD');
INSERT INTO PLAYER VALUES('PR34', 'RAMESH POWAR',29,'INDIA', 'BOWLER',30,50,150,170,1 ,'SOLD');
INSERT INTO PLAYER VALUES('PR35', 'UMAR GUL',24,'PAKISTAN', 'BOWLER',40,50,150,150,1 ,'SOLD');
INSERT INTO PLAYER VALUES('PR36', 'DALE STEYN',24,'SOUTH AFRICA', 'BOWLER',50,70,150,325,1 ,'SOLD');
INSERT INTO PLAYER VALUES('PR37', 'ISHANT SHARMA',19,'INDIA', 'BOWLER',120,100,150,950,1 ,'SOLD');
INSERT INTO PLAYER VALUES('PR38', 'PIYUSH CHAWLA',19,'INDIA', 'BOWLER',80,90,125,400,1 ,'SOLD');
INSERT INTO PLAYER VALUES('PR39', 'MUNAF PATEL',24,'INDIA', 'BOWLER',120,90,100,275,1,'SOLD');
INSERT INTO PLAYER VALUES('PR40', 'NUWAN ZOYSA',29,'SRILANKA', 'BOWLER',110,80,100,110,1,'SOLD');
INSERT INTO PLAYER VALUES('PR41', 'DILHARA FERNANDO',29,'SRILANKA', 'BOWLER',50,60,150,150,1 ,'SOLD');
INSERT INTO PLAYER VALUES('PR42', 'ASHISH NEHRA',28,'INDIA', 'BOWLER',20,30,20,50,2 ,'SOLD');
INSERT INTO PLAYER VALUES('PR43', 'ASHOK DINDA ',24,'INDIA', 'BOWLER',10,30,20,50,2 ,'SOLD');
INSERT INTO PLAYER VALUES('PR44', 'BRAD HODGE',33,'AUSTRALIA', 'BOWLER',20,10,50,00,2 ,'UNSOLD');
INSERT INTO PLAYER VALUES('PR45', 'SIDDARTH KAUL ',17,'INDIA', 'BOWLER',15,30,30,50,2 ,'SOLD');
INSERT INTO PLAYER VALUES('PR46', 'AJANTHA MENDIS',23,'SRILANKA', 'BOWLER',50,80,50,50,1,'SOLD');
INSERT INTO PLAYER VALUES('PR47', 'RAVICHANDRAN ASHWIN',21,'INDIA', 'BOWLER',80,50,20,50,2 ,'SOLD');
INSERT INTO PLAYER VALUES('PR48', 'LAKSHMI BALAJI  ',26 ,'INDIA', 'BOWLER',10,30,20,50,2,'SOLD');
INSERT INTO PLAYER VALUES('PR49', 'MANPREET GONY  ',24 ,'INDIA', 'BOWLER',15,20,20,50,2,'SOLD');
INSERT INTO PLAYER VALUES('PR50', 'SHADAB JAKATI  ',27 ,'INDIA', 'BOWLER',30,50,20,50,2,'SOLD');
INSERT INTO PLAYER VALUES('PR51', 'JOGINDER SHARMA  ',24 ,'INDIA', 'BOWLER',120,100,100,225,1 ,'SOLD');
INSERT INTO PLAYER VALUES('PR52', 'BRETT GEEVES ', 25,'AUSTRALIA', 'BOWLER',60,70,50,50,2 ,'SOLD');
INSERT INTO PLAYER VALUES('PR53', 'GLENN MCGRATH ',38 ,'AUSTRALIA', 'BOWLER',90,100,350,350,1 ,'SOLD');
INSERT INTO PLAYER VALUES('PR54', 'AMIT MISHRA ',25 ,'INDIA', 'BOWLER',50,30,20,50,1,'SOLD');
INSERT INTO PLAYER VALUES('PR55', 'PRADEEP SANGWAN  ', 17,'INDIA', 'BOWLER',60,80,50,50,2,'SOLD');
INSERT INTO PLAYER VALUES('PR56', 'KYLE MILLS',25,'NEW ZEALAND', 'BOWLER',70,90,50,150,1 ,'SOLD');
INSERT INTO PLAYER VALUES('PR57', 'MORNE MORKEL',23,'SOUTH AFRICA', 'BOWLER',80,90,50,60,2,'SOLD');
INSERT INTO PLAYER VALUES('PR58', 'SOHAIL TANVIR',23,'PAKISTAN', 'BOWLER',60,80,50,100,1 ,'SOLD');
INSERT INTO PLAYER VALUES('PR59', 'ABDUR RAZZAK',25,'BANGLADESH', 'BOWLER',30,40,50,50,2 ,'SOLD');
INSERT INTO PLAYER VALUES('PR60', 'BALACHANDRA AKHIL ',30,'INDIA', 'BOWLER',30,40,20,20,2 ,'SOLD');
INSERT INTO PLAYER VALUES('PR61', 'PRAVEEN KUMAR ',21,'INDIA', 'BOWLER',20,30,20,50,2 ,'SOLD');
INSERT INTO PLAYER VALUES('PR62', 'VINAY KUMAR ',24,'INDIA', 'BOWLER',30,50,20,50,2 ,'SOLD');
INSERT INTO PLAYER VALUES('PR63', 'PRAGYAN OJHA ',21,'INDIA', 'BOWLER',40,60,20,50,2,'SOLD');
INSERT INTO PLAYER VALUES('PR64', 'CHRIS MARTIN',28,'NEW ZEALAND','BOWLER',40,50,50,00,2,'UNSOLD');
INSERT INTO PLAYER VALUES('PR65', 'DHAWAL KULKARNI',23,'INDIA', 'BOWLER',30,40,20,50,2,'SOLD');
INSERT INTO PLAYER VALUES('PR66','ROBIN UTHAPPA',23,'INDIA','WICKETKEEPER',234,000,200,800,1,'SOLD');
INSERT INTO PLAYER VALUES('PR67','SHANE WATSON',27,'AUSTRALIA','ALLROUNDER',487,28,50,125,2,'SOLD');
INSERT INTO PLAYER VALUES('PR68','SANATH JAYASURIYA',38,'SRILANKA','ALLROUNDER',786,10,250,975,1,'SOLD');
INSERT INTO PLAYER VALUES('PR69','ANDREW SYMONDS',33,'AUSTRALIA','ALLROUNDER',337,8,250,1350,1,'SOLD');
INSERT INTO PLAYER VALUES('PR70','JACOB ORAM',30,'NEWZEALAND','ALLROUNDER',567,67,200,675,1,'SOLD');
INSERT INTO PLAYER VALUES('PR71','CHRIS GAYLE',29,'WEST INDIES','ALLROUNDER',675,12,250,800,1,'SOLD');
INSERT INTO PLAYER VALUES('PR72','SHOIAB MALIK',26,'PAKISTAN','ALLROUNDER',908,28,300,500,1,'SOLD');
INSERT INTO PLAYER VALUES('PR73','SHAHID AFRIDI',27,'PAKISTAN','ALLROUNDER',342,12,225,675,1,'SOLD');
INSERT INTO PLAYER VALUES('PR74','JACQUES KALLIS',32,'SOUTH AFRICA','ALLROUNDER',654,8,225,900,1,'SOLD');
INSERT INTO PLAYER VALUES('PR75','ALBIE MORKEL',26,'SOUTH AFRICA','ALLROUNDER',234,23,225,675,1,'SOLD');
INSERT INTO PLAYER VALUES('PR76','SHAUN POLLOCK',35,'SOUTH AFRICA','ALLROUNDER',298,56,200,550,1,'SOLD');
INSERT INTO PLAYER VALUES('PR77','IRFAN PATHAN',22,'INDIA','ALLROUNDER',346,23,200,925,1,'SOLD');
INSERT INTO PLAYER VALUES('PR78','FARVEZ MAHAROOF',23,'PAKISTAN','ALLROUNDER',33,7,150,225,1,'SOLD');
INSERT INTO PLAYER VALUES('PR79','CAMERON WHITE',24,'AUSTRALIA','ALLROUNDER',630,01,100,500,1,'SOLD');
INSERT INTO PLAYER VALUES('PR80','AGIT AGARKAR',30,'INDIA','ALLROUNDER',15,32,200,350,1,'SOLD');
INSERT INTO PLAYER VALUES('PR81','SCOTT STYRIS',32,'NEW ZEALAND','ALLROUNDER',231,19,175,175,1,'SOLD');
INSERT INTO PLAYER VALUES('PR82','TILAKARATNE DILSHAN',31,'SRI LANKA','ALLROUNDER',765,9,152,250,1,'SOLD');
INSERT INTO PLAYER VALUES('PR83','YUSUF PATHAN',25,'INDIA','ALLROUNDER',236,13,100,475,1,'SOLD');
INSERT INTO PLAYER VALUES('PR84','MOHAMMED HAFEEZ',27,'PAKISTAN','ALLROUNDER',970,24,50,100,2,'SOLD');
INSERT INTO PLAYER VALUES('PR85','DIMITRI MASCARENHAS',30,'ENGLAND','ALLROUNDER',123,12,50,100,2,'SOLD');
INSERT INTO PLAYER VALUES('PR86','MASHRAFE MORTAZA',23,'BANGLADESH','ALLROUNDER',78,22,50,0,2,'UNSOLD');
INSERT INTO PLAYER VALUES('PR87','BRAD HODGE',33,'AUSTRALIA','ALLROUNDER',183,0,50,0,2,'UNSOLD');
INSERT INTO PLAYER VALUES('PR88','JAMES FRAKLIN',27,'NEWZEALAND','ALLROUNDER',463,20,50,0,2,'UNSOLD');
INSERT INTO PLAYER VALUES('PR89','MAHELA JAYAWARDENE ',28,'SRI LANKA','BATSMAN',1493,0,250,475,1,'SOLD');
INSERT INTO PLAYER VALUES('PR90','MOHAMMED  YOUSUF ',28,'PAKISTAN','BATSMAN',50,0,350,0,2,'UNSOLD');
INSERT INTO PLAYER VALUES('PR91','RICKY PONTING ',33,'AUSTRALIA','BATSMAN',401,0,335,400,1,'SOLD');
INSERT INTO PLAYER VALUES('PR92','MICHAEL HUSSEY ',27,'AUSTRALIA','BATSMAN',721,0,250,250,1,'SOLD');
INSERT INTO PLAYER VALUES('PR93','MATTHEW  HAYDEN ',35,'AUSTRALIA','BATSMAN',308,0,225,375,1,'SOLD');
INSERT INTO PLAYER VALUES('PR94','STEPHEN FLEMING ',32,'NEW ZEALAND','BATSMAN',110,0,350,350,1,'SOLD');
INSERT INTO PLAYER VALUES('PR95','GRAEME SMITH ',25,'SOUTH AFRICA','BATSMAN',982,0,250,250,1,'SOLD');
INSERT INTO PLAYER VALUES('PR96','HERSCHELLE GIBBS ',31,'SOUTH AFRICA','BATSMAN',400,0,250,575,1,'SOLD');
INSERT INTO PLAYER VALUES('PR97','YOUNIS KHAN',35,'PAKISTAN','BATSMAN',442,3,225,225,1,'SOLD');
INSERT INTO PLAYER VALUES('PR98','RAMNARESH SARWAN ',34,'WEST INDIES','BATSMAN',298,2,225,225,1,'SOLD');
INSERT INTO PLAYER VALUES('PR99','SIMON KATICH ',33,'AUSTRALIA','BATSMAN',69,0,200,200,1,'SOLD');
INSERT INTO PLAYER VALUES('PR100','JUSTIN LANGER',38,'AUSTRALIA','BATSMAN',0,0,200,200,1,'SOLD');
INSERT INTO PLAYER VALUES('PR101','GAUTAM GAMBHIR',28,'INDIA','BATSMAN',932,0,220,725,1,'SOLD');
INSERT INTO PLAYER VALUES('PR102','SHIV CHANDERPAUL',35,'WEST INDIES','BATSMAN',343,0,200,200,1,'SOLD');
INSERT INTO PLAYER VALUES('PR103','ASHWELL PRINCE',30,' SOUTH AFRICA','BATSMAN',6,0,175,00,2,'UNSOLD');
INSERT INTO PLAYER VALUES('PR104','VVS LAXMAN',35,'INDIA','BATSMAN',0,0,150,375,1,'SOLD');
INSERT INTO PLAYER VALUES('PR105','WASIM JAFFER',32,'INDIA','BATSMAN',130,0,150,150,1,'SOLD');
INSERT INTO PLAYER VALUES('PR106','ROHIT SHARMA',26,'INDIA','BATSMAN',319,1,150,750,1,'SOLD');
INSERT INTO PLAYER VALUES('PR107','LOOTS BOSMAN',26,' SOUTH AFRICA','BATSMAN',323,0,150,175,1,'SOLD');
INSERT INTO PLAYER VALUES('PR108','MOHAMMAD KAIF',28,'INDIA','BATSMAN',0,0,125,675,1,'SOLD');
INSERT INTO PLAYER VALUES('PR109','SURESH RAINA',22,'INDIA','BATSMAN',504,7,125,620,1,'SOLD');
INSERT INTO PLAYER VALUES('PR110','VIRENDER SEHWAG',30,'INDIA','BATSMAN',500,5,450,834,1,'SOLD');
INSERT INTO PLAYER VALUES('PR111','MANOJ TIWARY',25,'INDIA','BATSMAN',304,0,100,675,1,'SOLD');
INSERT INTO PLAYER VALUES('PR112','CHAMARA SILVA',28,'SRI LANKA','BATSMAN',205,0,100,100,2,'SOLD');
INSERT INTO PLAYER VALUES('PR113','DAVID HUSSEY',29,'AUSTRALIA','BATSMAN',602,10,100,625,1,'SOLD');
INSERT INTO PLAYER VALUES('PR114','ROSS TAYLOR',25,'NEW ZEALAND','BATSMAN',302,1,100,100,1,'SOLD');
INSERT INTO PLAYER VALUES('PR115','PETER FULTON',30,'NEW ZEALAND','BATSMAN',196,5,50,00,2,'UNSOLD');
INSERT INTO PLAYER VALUES('PR116','JAMIE HOW',31,'NEW ZEALAND','BATSMAN',299,9,50,00,2,'UNSOLD');
INSERT INTO PLAYER VALUES('PR117','LUKE POMERSBACH',30,'AUSTRALIA','BATSMAN',405,2,100,00,2,'UNSOLD');
INSERT INTO PLAYER VALUES('PR118','PHIL JAQUES',35,'AUSTRALIA','BATSMAN',75,0,50,50,1,'SOLD');
INSERT INTO PLAYER VALUES('PR119','MOHAMMAD ASHRAFUL',29,'BANGLADESH','BATSMAN',89,1,100,00,2,'UNSOLD');
INSERT INTO PLAYER VALUES('PR120','MISBAH-UL-HAQ',28,'PAKISTAN','BATSMAN',307,0,100,125,1,'SOLD');
INSERT INTO PLAYER VALUES('PR121','SALMAN BUTT',28,'PAKISTAN','BATSMAN',0,0,100,100,1,'SOLD');
INSERT INTO PLAYER VALUES('PR122','YASIR HAMEED',31,'PAKISTAN','BATSMAN',115,8,50,00,2,'UNSOLD');
INSERT INTO PLAYER VALUES('PR123','VIRAT KOHLI',28,'INDIA','BATSMAN',203,0,50,50,2,'SOLD');
INSERT INTO PLAYER VALUES('PR124','SAURABH TIWARY',27,'INDIA','BATSMAN',307,0,20,50,2,'SOLD');
INSERT INTO PLAYER VALUES('PR125','TARUWAR SUSHIL KOHLI',28,'INDIA','BATSMAN',59,0,20,30,2,'SOLD');
INSERT INTO PLAYER VALUES('PR126','TANMAY SRIVASTAVA',26,'INDIA','BATSMAN',0,0,50,50,2,'SOLD');
INSERT INTO PLAYER VALUES('PR127','ABHINAV MUKUND',28,'INDIA','BATSMAN',0,0,20,50,2,'SOLD');
INSERT INTO PLAYER VALUES('PR128','NAPOLEON EINSTEIN',27,'INDIA','BATSMAN',0,0,20,30,2,'SOLD');
INSERT INTO PLAYER VALUES('PR129','MANISH PANDEY',27,'INDIA','BATSMAN',120,0,20,30,2,'SOLD');
INSERT INTO PLAYER VALUES('PR130','BHARAT CHIPLI',26,'INDIA','BATSMAN',10,0,50,50,2,'SOLD');
INSERT INTO PLAYER VALUES('PR131','SRIKKANTH ANIRUDHA',27,'INDIA','BATSMAN',150,0,50,50,2,'SOLD');
INSERT INTO PLAYER VALUES('PR132','S BADRINATH',34,'INDIA','BATSMAN',89,0,50,50,2,'SOLD');
INSERT INTO PLAYER VALUES('PR133','ABHISHEK NAYAR',29,'INDIA','BATSMAN',113,0,50,50,2,'SOLD');
INSERT INTO PLAYER VALUES('PR134','VENUGOPAL RAO',26,'INDIA','BATSMAN',97,0,50,50,2,'SOLD');
INSERT INTO PLAYER VALUES('PR135','ARJUN YADAV',31,'INDIA','BATSMAN',56,0,50,50,2,'SOLD');
INSERT INTO PLAYER VALUES('PR136','DWARAKA RAVI TEJA',30,'INDIA','BATSMAN',78,1,50,50,2,'SOLD');
INSERT INTO PLAYER VALUES('PR137',' KALYANKRISHNA',24,'INDIA','BATSMAN',23,1,50,50,2,'SOLD');
INSERT INTO PLAYER VALUES('PR138','AAKASH CHOPRA',31,'INDIA','BATSMAN',89,0,50,50,2,'SOLD');
INSERT INTO PLAYER VALUES('PR139','CHETESHWAR PUJARA',21,'INDIA','BATSMAN',0,0,50,50,2,'SOLD');
INSERT INTO PLAYER VALUES('PR140','SHAUN MARSH',25,'AUSTRALIA','BATSMAN',309,4,50,50,2,'SOLD');
INSERT INTO PLAYER VALUES('PR141','DOMINIC THORNELY',30,'AUSTRALIA','BATSMAN',177,5,50,50,2,'SOLD');
INSERT INTO PLAYER VALUES('PR142','SACHIN TENDULKAR',36,'INDIA','BATSMAN',61,0,450,975,1,'SOLD');
INSERT INTO PLAYER VALUES('PR143','SHIKHAR DHAWAN',30,'INDIA','BATSMAN',208,0,50,50,2,'SOLD');
INSERT INTO PLAYER VALUES('PR144','YUVRAJ SINGH',27,'INDIA','ALLROUNDER',265,30,450,1093,1,'SOLD');
INSERT INTO PLAYER VALUES('PR145','SOURAV GANGULY',36,'INDIA','BATSMAN',189,12,450,1064,1,'SOLD');
INSERT INTO PLAYER VALUES('PR146','RAHUL DRAVID',35,'INDIA','BATSMAN',180,0,450,1035,1,'SOLD');



CREATE TABLE PLAYER_TEAM
 (  
  PID VARCHAR2(20) CONSTRAINT FK3 REFERENCES PLAYER(PLAYER_ID),
  TID NUMBER   CONSTRAINT FK4 REFERENCES TEAM(TEAM_ID),
  CONSTRAINT PK3 PRIMARY KEY(PID,TID)
  );
 
INSERT INTO PLAYER_TEAM VALUES('PR01',2 );
INSERT INTO PLAYER_TEAM VALUES('PR02',1 );
INSERT INTO PLAYER_TEAM VALUES('PR03',6 );
INSERT INTO PLAYER_TEAM VALUES('PR04',7 );
INSERT INTO PLAYER_TEAM VALUES('PR05',5 );
INSERT INTO PLAYER_TEAM VALUES('PR06', 4); 
INSERT INTO PLAYER_TEAM VALUES('PR07',5 );
INSERT INTO PLAYER_TEAM VALUES('PR09',2 );
INSERT INTO PLAYER_TEAM VALUES('PR10',8 );
INSERT INTO PLAYER_TEAM VALUES('PR11',7 );
INSERT INTO PLAYER_TEAM VALUES('PR12',4 );
INSERT INTO PLAYER_TEAM VALUES('PR13',7 );
INSERT INTO PLAYER_TEAM VALUES('PR14',3 );
INSERT INTO PLAYER_TEAM VALUES('PR15',3 );
INSERT INTO PLAYER_TEAM VALUES('PR16',2 );
INSERT INTO PLAYER_TEAM VALUES('PR17',6 );
INSERT INTO PLAYER_TEAM VALUES('PR18',8 );
INSERT INTO PLAYER_TEAM VALUES('PR19',7 );
INSERT INTO PLAYER_TEAM VALUES('PR20', 4);
INSERT INTO PLAYER_TEAM VALUES('PR21',2 );
INSERT INTO PLAYER_TEAM VALUES('PR22',3);
INSERT INTO PLAYER_TEAM VALUES('PR23',6);
INSERT INTO PLAYER_TEAM VALUES('PR24',5);
INSERT INTO PLAYER_TEAM VALUES('PR25',5);
INSERT INTO PLAYER_TEAM VALUES('PR26',4);
INSERT INTO PLAYER_TEAM VALUES('PR27',8);
INSERT INTO PLAYER_TEAM VALUES('PR28',4);
INSERT INTO PLAYER_TEAM VALUES('PR29',1);
INSERT INTO PLAYER_TEAM VALUES('PR30',6);
INSERT INTO PLAYER_TEAM VALUES('PR31',2);
INSERT INTO PLAYER_TEAM VALUES('PR32',3);
INSERT INTO PLAYER_TEAM VALUES('PR33',1);
INSERT INTO PLAYER_TEAM VALUES('PR34',6);
INSERT INTO PLAYER_TEAM VALUES('PR35',7);
INSERT INTO PLAYER_TEAM VALUES('PR36',4);
INSERT INTO PLAYER_TEAM VALUES('PR37',7);
INSERT INTO PLAYER_TEAM VALUES('PR38',6);
INSERT INTO PLAYER_TEAM VALUES('PR39',8);
INSERT INTO PLAYER_TEAM VALUES('PR40',1);
INSERT INTO PLAYER_TEAM VALUES('PR41',3);
INSERT INTO PLAYER_TEAM VALUES('PR42',3);
INSERT INTO PLAYER_TEAM VALUES('PR43',7);
INSERT INTO PLAYER_TEAM VALUES('PR45',7);
INSERT INTO PLAYER_TEAM VALUES('PR46',7);
INSERT INTO PLAYER_TEAM VALUES('PR47',2);
INSERT INTO PLAYER_TEAM VALUES('PR48',2);
INSERT INTO PLAYER_TEAM VALUES('PR49',2);
INSERT INTO PLAYER_TEAM VALUES('PR50',2);
INSERT INTO PLAYER_TEAM VALUES('PR51',2);
INSERT INTO PLAYER_TEAM VALUES('PR52',5);
INSERT INTO PLAYER_TEAM VALUES('PR53',5);
INSERT INTO PLAYER_TEAM VALUES('PR54',5);
INSERT INTO PLAYER_TEAM VALUES('PR55',5);
INSERT INTO PLAYER_TEAM VALUES('PR56',6);
INSERT INTO PLAYER_TEAM VALUES('PR57',8);
INSERT INTO PLAYER_TEAM VALUES('PR58',8);
INSERT INTO PLAYER_TEAM VALUES('PR59',4);
INSERT INTO PLAYER_TEAM VALUES('PR60',4);
INSERT INTO PLAYER_TEAM VALUES('PR61',4);
INSERT INTO PLAYER_TEAM VALUES('PR62',4);
INSERT INTO PLAYER_TEAM VALUES('PR63',1);
INSERT INTO PLAYER_TEAM VALUES('PR65',3);
INSERT INTO PLAYER_TEAM VALUES('PR66',3);
INSERT INTO PLAYER_TEAM VALUES('PR67',8);
INSERT INTO PLAYER_TEAM VALUES('PR68',3);
INSERT INTO PLAYER_TEAM VALUES('PR69',1);
INSERT INTO PLAYER_TEAM VALUES('PR70',2);
INSERT INTO PLAYER_TEAM VALUES('PR71',7);
INSERT INTO PLAYER_TEAM VALUES('PR72',5);
INSERT INTO PLAYER_TEAM VALUES('PR73',1);
INSERT INTO PLAYER_TEAM VALUES('PR74',4);
INSERT INTO PLAYER_TEAM VALUES('PR75',2);
INSERT INTO PLAYER_TEAM VALUES('PR76',3);
INSERT INTO PLAYER_TEAM VALUES('PR77',6);
INSERT INTO PLAYER_TEAM VALUES('PR78',5);
INSERT INTO PLAYER_TEAM VALUES('PR79',4);
INSERT INTO PLAYER_TEAM VALUES('PR80',7);
INSERT INTO PLAYER_TEAM VALUES('PR81',1);
INSERT INTO PLAYER_TEAM VALUES('PR82',5);
INSERT INTO PLAYER_TEAM VALUES('PR83',5);
INSERT INTO PLAYER_TEAM VALUES('PR84',7);
INSERT INTO PLAYER_TEAM VALUES('PR85',8);
INSERT INTO PLAYER_TEAM VALUES('PR89',6);
INSERT INTO PLAYER_TEAM VALUES('PR91',7);
INSERT INTO PLAYER_TEAM VALUES('PR92',2);
INSERT INTO PLAYER_TEAM VALUES('PR93',2);
INSERT INTO PLAYER_TEAM VALUES('PR94',2);
INSERT INTO PLAYER_TEAM VALUES('PR95',8);
INSERT INTO PLAYER_TEAM VALUES('PR96',1);
INSERT INTO PLAYER_TEAM VALUES('PR97',8);
INSERT INTO PLAYER_TEAM VALUES('PR98',6);
INSERT INTO PLAYER_TEAM VALUES('PR99',6);
INSERT INTO PLAYER_TEAM VALUES('PR100',8);
INSERT INTO PLAYER_TEAM VALUES('PR101',5);
INSERT INTO PLAYER_TEAM VALUES('PR102',4);
INSERT INTO PLAYER_TEAM VALUES('PR104',1);
INSERT INTO PLAYER_TEAM VALUES('PR105',4);
INSERT INTO PLAYER_TEAM VALUES('PR106',1);
INSERT INTO PLAYER_TEAM VALUES('PR107',3);
INSERT INTO PLAYER_TEAM VALUES('PR108',8);
INSERT INTO PLAYER_TEAM VALUES('PR109',2);
INSERT INTO PLAYER_TEAM VALUES('PR110 ',5);
INSERT INTO PLAYER_TEAM VALUES('PR111 ',5);
INSERT INTO PLAYER_TEAM VALUES('PR112',1);
INSERT INTO PLAYER_TEAM VALUES('PR113',7);
INSERT INTO PLAYER_TEAM VALUES('PR114',4);
INSERT INTO PLAYER_TEAM VALUES('PR118',6);
INSERT INTO PLAYER_TEAM VALUES('PR120',4);
INSERT INTO PLAYER_TEAM VALUES('PR121',7);
INSERT INTO PLAYER_TEAM VALUES('PR123',4);
INSERT INTO PLAYER_TEAM VALUES('PR124',3);
INSERT INTO PLAYER_TEAM VALUES('PR125',8);
INSERT INTO PLAYER_TEAM VALUES('PR126',6);
INSERT INTO PLAYER_TEAM VALUES('PR127',2);
INSERT INTO PLAYER_TEAM VALUES('PR128',2);
INSERT INTO PLAYER_TEAM VALUES('PR129',3);
INSERT INTO PLAYER_TEAM VALUES('PR130',4);
INSERT INTO PLAYER_TEAM VALUES('PR131',2);
INSERT INTO PLAYER_TEAM VALUES('PR132',2);
INSERT INTO PLAYER_TEAM VALUES('PR133',3);
INSERT INTO PLAYER_TEAM VALUES('PR134',1);
INSERT INTO PLAYER_TEAM VALUES('PR135',1);
INSERT INTO PLAYER_TEAM VALUES('PR136',1);
INSERT INTO PLAYER_TEAM VALUES('PR137',1);
INSERT INTO PLAYER_TEAM VALUES('PR138',7);  
INSERT INTO PLAYER_TEAM VALUES('PR139',7);
INSERT INTO PLAYER_TEAM VALUES('PR140',6);
INSERT INTO PLAYER_TEAM VALUES('PR141',3);  
INSERT INTO PLAYER_TEAM VALUES('PR142',3);
INSERT INTO PLAYER_TEAM VALUES('PR143',5);
INSERT INTO PLAYER_TEAM VALUES('PR144',6);
INSERT INTO PLAYER_TEAM VALUES('PR145',7);
INSERT INTO PLAYER_TEAM VALUES('PR146',4);





SELECT * FROM PLAYER;
SELECT * FROM PLAYER_TEAM;
SELECT * FROM SPONSOR;
SELECT * FROM TEAM;
SELECT * FROM COMPONY;
SELECT * FROM TEAM_SPONSOR;
SELECT * FROM AUCTION;
SELECT * FROM IPL_MANAGEMENT;

COMMIT;
 


--1 RETREVE THE DETAILS OF TEAM WHICH IS BOWLER DOMINANT
CREATE VIEW DOMINANT_BOW AS
SELECT TEAM_ID, COUNT(P_ROLE) AS NO_OF_BOWLER
FROM PLAYER,TEAM,PLAYER_TEAM
WHERE PLAYER_ID=PID AND TEAM_ID=TID AND P_ROLE='BOWLER'
GROUP BY TEAM_ID;

SELECT * FROM DOMINANT_BOW;


SELECT T.TEAM_NAME,T.TEAM_ID,T.TEAM_COST_IN_US$_MILLION,T.MID
FROM DOMINANT_BOW D,TEAM T
WHERE T.TEAM_ID=D.TEAM_ID AND NO_OF_BOWLER=(SELECT  MAX(NO_OF_BOWLER)
                                          FROM DOMINANT_BOW 
                                          );
         
---2  RETREVE THE BEST BATSMAN NAME FOR EACH TEAM;                     
  SELECT TEAM_NAME,PLAYER_NAME,RUNS
  FROM PLAYER,TEAM,PLAYER_TEAM
  WHERE PLAYER_ID=PID AND TEAM_ID=TID AND RUNS IN (SELECT MAX(RUNS)
                                                    FROM PLAYER,PLAYER_TEAM,TEAM
                                                    WHERE PID=PLAYER_ID AND TEAM_ID=TID 
                                                    GROUP BY TEAM_NAME
                                                    );
                                                    
 ---3 CALCULATE THE SPENT VALUE OF EACH TEAM
 SELECT TEAM_ID,TEAM_NAME,SUM(SOLD_PRICE_IN_US$_THOU)
 FROM PLAYER,TEAM,PLAYER_TEAM
 WHERE PID=PLAYER_ID AND TEAM_ID=TID
 GROUP BY TEAM_ID,TEAM_NAME;
 
 --4 TEAM WISE PROFITS
 CREATE VIEW SPENT_MONEY AS
 SELECT TEAM_ID,TEAM_NAME,SUM(SOLD_PRICE_IN_US$_THOU) AS SMONEY
 FROM PLAYER,TEAM,PLAYER_TEAM
 WHERE PID=PLAYER_ID AND TEAM_ID=TID
 GROUP BY TEAM_ID,TEAM_NAME;
 
 SELECT * FROM SPENT_MONEY;
 
 
 --5 GUESS THE NO OF PLAYERS THEY CAN BUY WITH THE PURSE VALUE
 CREATE VIEW ASP AS
SELECT TEAM_NAME,AVG(SOLD_PRICE_IN_US$_THOU)AS AVGSP
FROM PLAYER,TEAM,PLAYER_TEAM
WHERE PID=PLAYER_ID AND TEAM_ID=TID
GROUP BY TEAM_NAME;

CREATE VIEW REMAIN_MONEY AS
SELECT T.TEAM_ID,T.TEAM_NAME,( MAX_AMOUNT_IN_US$_THOU - SMONEY)AS MAS
 FROM TEAM T,SPENT_MONEY S
 WHERE T.TEAM_ID=S.TEAM_ID;
 
 SELECT * FROM ASP;
 SELECT * FROM REMAIN_MONEY;
 

SELECT TEAM_ID,ASP.TEAM_NAME,CEIL(MAS/AVGSP) AS NUMBER_OF_PLAYERS_THEY_CAN_BUY
FROM ASP,REMAIN_MONEY
WHERE ASP.TEAM_NAME LIKE REMAIN_MONEY.TEAM_NAME;


--6 RETREVE THE HEAD COACH NAME ,TEAM_NAME AND THE RESPECTIVE PLAYER NAMES
SELECT TEAM_NAME,M_HEAD_COACH,PLAYER_NAME
FROM IPL_MANAGEMENT M,PLAYER P,TEAM T,PLAYER_TEAM PT 
WHERE T.MID=M.M_ID AND PT.PID=P.PLAYER_ID AND PT.TID=T.TEAM_ID;



--7 RETREVE THE MAXIMUM SOLD PLAYERS OF AUCTION ONE AND TWO
SELECT   player_name, player_id, auction_id, sold_price_in_Us$_thou
FROM PLAYER p2                                                        
where SOLD_PRICE_IN_US$_THOU in(
                                 select MAX(p.SOLD_PRICE_IN_US$_THOU)
                                 from player p, player p3
                                 where p.auction_id = p2.auction_id
                                  group by p.auction_id
                                  );
                                  
            


--8 Retreve  each teams remained value in auction
SELECT T.TEAM_ID,T.TEAM_NAME,( MAX_AMOUNT_IN_US$_THOU - SMONEY)AS MAS
FROM TEAM T,SPENT_MONEY S
WHERE T.TEAM_ID=S.TEAM_ID;



 
 --9 retreve the youngest player details  who has participated auction
 select player_id,team_id,player_name,team_name,age 
 from player p,team t,player_team pt
 where pt.pid=p.player_id and pt.tid=t.team_id and status='SOLD' AND age in( select min(age)
                                                                              from  player
                                                                                   );
 
  

  --10 retreve the elder player details  who has participated auction
 select player_id,team_id,player_name,team_name,age 
 from player p,team t,player_team pt
 where pt.pid=p.player_id and pt.tid=t.team_id and status='SOLD' AND age in( select max(age)
                                                                              from  player
                                                                                   );
 
                                                    
 
 
 
 
 
 
 1>RETRIEVE THE DETAILS OF THE PLAYER WHO HAS GOT THE THE HIGHEST BID PRICE

SELECT * 
FROM PLAYER
WHERE SOLD_PRICE_IN_US$_THOU =(SELECT MAX(SOLD_PRICE_IN_US$_THOU) 
                                FROM PLAYER);
                             
                             
      SELECT * FROM PLAYER;                       
2>RETRIEVE THE HIGHEST BID IN EACH CATEGORY

SELECT * FROM PLAYER
WHERE SOLD_PRICE_IN_US$_THOU IN(
                              SELECT MAX(SOLD_PRICE_IN_US$_THOU)
                              FROM PLAYER
                              GROUP BY P_ROLE);

3>RETRIEVE THE HIGHEST SALARIES GIVEN TO THE PLAYERS BY TEAM
SELECT * FROM TEAM;

SELECT MAX(SOLD_PRICE_IN_US$_THOU)
FROM PLAYER P2,PLAYER_TEAM
WHERE PLAYER_ID=PID 
 GROUP BY TID;

        
4>RETRIEVE THE NAME OF THE PLAYERS WHO WENT UNSOLD IN THE AUCTION AND RETRIEVE THEIR NAMES


SELECT * FROM PLAYER
WHERE PLAYER_ID 
           NOT IN 
                 (  SELECT PID FROM PLAYER_TEAM);
                  
5>RETRIEVE THE DETAILS OF THE COMPANIES WHICH COULD NOT BUY ANY TEAM
SELECT * 
FROM COMPONY
WHERE CID NOT IN
               (SELECT CID FROM TEAM );


6>RETRIEVE THE DETAILS OF THE PLAYER WHO WENT FOR MAXIMUM PRICE IN SECOND AUCTION

SELECT * FROM PLAYER 
WHERE     AUCTION_ID=2 AND SOLD_PRICE_IN_US$_THOU =
                    (SELECT MAX(SOLD_PRICE_IN_US$_THOU) 
                    FROM PLAYER
                    WHERE AUCTION_ID=2);
             SELECT * FROM TEAM;       
7>RETRIEV THE NAME OF THE PLAYER AND TEAM NAME OF THE PLAYER WHO WENT SOLD IN SECOND AUCTI

SELECT PLAYER_NAME ,TEAM_NAME,AUCTION_ID
FROM PLAYER,TEAM,PLAYER_TEAM
WHERE PLAYER_ID=PID AND TID=TEAM_ID AND AUCTION_ID=2;


8>RETRIEVE THE NAME OF THE TEAM AND T_ID FROM COUNT OF THE PLAYERS IN THE TEAM;
SELECT TEAM_NAME,TID ,COUNT(*)
FROM TEAM,PLAYER_TEAM
WHERE TEAM_ID=TID 
GROUP BY TID,TEAM_NAME ;


9>RETRIEVE THE TOTAL AMOUNT SPENT BY EACH TEAM 

SELECT SUM(SOLD_PRICE_IN_US$_THOU) ,TID
FROM PLAYER,PLAYER_TEAM,TEAM 
WHERE PLAYER_ID=PID 
GROUP BY TID;

10>RETRIEVE THE DETAILS THE TEAMS WHERE THE NO OF SPONSORS ARE GREATER THAN 3;
SELECT *
FROM TEAM 
WHERE TEAM_ID IN(SELECT TEAM_ID FROM 
                  TEAM_SPONSOR 
                  GROUP BY TEAM_ID
                  HAVING COUNT(*) >3);
                  
11>RETRIVE THE NAME OF THE PLAYERS WHO HAS SECOND HIGHEST SOLD PRICE 

SELECT * FROM PLAYER
WHERE SOLD_PRICE_IN_US$_THOU=(

                         SELECT MAX(SOLD_PRICE_IN_US$_THOU) 
                          FROM PLAYER  
                              WHERE SOLD_PRICE_IN_US$_THOU  <
                                                           (SELECT MAX(SOLD_PRICE_IN_US$_THOU) 
                                                                     FROM PLAYER)); 
                                                                     
                                                                     
                                                                     
                                                                     
 select * 
 from auction
 where auction_date like '%-MAR-%';
 
 
select * 
from player
where Runs=(select max(Runs)
             from player);
 
 
 