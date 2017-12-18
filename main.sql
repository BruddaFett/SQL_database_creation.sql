DROP DATABASE IF EXISTS Bar_Inventory;
CREATE DATABASE Bar_Inventory;

USE Bar_Inventory;
CREATE TABLE IF NOT EXISTS Alcohol 
(
  AlcoholId     INT             NOT NULL    AUTO_INCREMENT,
  Name          VARCHAR(80)     NOT NULL,
  Type          VARCHAR(45)         NULL,
  Unitsize      VARCHAR(45)     NOT NULL,
  Casesize      VARCHAR(45)         NULL,
  PRIMARY KEY (AlcoholId)
);

CREATE TABLE IF NOT EXISTS Distribution
(
  DistId        INT             NOT NULL    AUTO_INCREMENT,
  Name          VARCHAR(80)     NOT NULL,
  Address       VARCHAR(45)     NOT NULL,
  City          VARCHAR(20)     NOT NULL,
  State         VARCHAR(20)     NOT NULL,
  ZipCode       CHAR(8)         NOT NULL,
  Phone         CHAR(20)        NOT NULL,
  PRIMARY KEY (DistId)
);

CREATE TABLE IF NOT EXISTS DryGoods 
(
  DryId         INT             NOT NULL    AUTO_INCREMENT,
  Name          VARCHAR(80)     NOT NULL,
  Unitsize      VARCHAR(45)     NOT NULL,
  Caseize       VARCHAR(45)         NULL,
  PRIMARY KEY (DryId)
);

CREATE TABLE IF NOT EXISTS Glassware 
(
  GlassId       INT             NOT NULL     AUTO_INCREMENT, 
  Brand         VARCHAR(45)     NOT NULL,
  Style         VARCHAR(45)     NOT NULL,
  Unitsize      VARCHAR(45)     NOT NULL,
  Casesize      VARCHAR(45)         NULL,
  PRIMARY KEY (GlassId)
);

CREATE TABLE IF NOT EXISTS AlcoholDetail
(
  AlcoholId     INT             NOT NULL,
  Date          DATE            NOT NULL,
  AlcDetailsId  INT             NOT NULL,
  Qty           INT             NOT NULL,
  PPU           DECIMAL(7,2)        NULL,
  DistId        INT             NOT NULL,
  CONSTRAINT PRIMARY KEY (AlcDetailsId, AlcoholId),
  CONSTRAINT fk_alcDet_distId  FOREIGN KEY (DistId)  REFERENCES Distribution (DistId)
  );

CREATE TABLE IF NOT EXISTS GoodsDetail 
(
  DryId    			INT         NOT NULL,
  Date              DATE        NOT NULL,
  GoodsDetailId     INT         NOT NULL,
  Qty               INT         NOT NULL,
  PPU               DECIMAL(7,2)    NULL,
  DistId            INT             NULL,

  CONSTRAINT PRIMARY KEY (GoodsDetailId , DryId),
  CONSTRAINT fk_goodDet_distId  FOREIGN KEY (DistId)  REFERENCES Distribution (DistId)
  );

CREATE TABLE IF NOT EXISTS GlassDetail 
(
  GlassId           INT         NOT NULL,
  Date              DATE        NOT NULL,
  GlassDetailId     INT         NOT NULL ,
  Qty               INT         NOT NULL,
  PPU               DECIMAL(7,2)    NULL,
  DistId            INT             NULL,
  PRIMARY KEY ( GlassDetailId, GlassId),
  CONSTRAINT fk_glassDet_distId  FOREIGN KEY (DistId)  REFERENCES Distribution (DistId)
  ); 

CREATE TABLE IF NOT EXISTS Orders 
(
  orderId           INT         NOT NULL        AUTO_INCREMENT,
  orderDate         DATE        NOT NULL,
  AlcDetailsId      INT             NULL,
  GoodsDetailId     INT             NULL,
  GlassDetailId     INT             NULL,
  CONSTRAINT PRIMARY KEY (orderId)
);

INSERT INTO distribution
VALUES
(DEFAULT,	'Southern Wine & Spirits',	'4142 1st Ave S',	'Seattle',	'WA',	'98134',	'(206) 442-5460'),
(DEFAULT,   'Young`s Market Co',    	'2501 E Valley Rd',	'Renton',	'WA',	'98057',	'(206) 808-6200'),
(DEFAULT,	'K & L Distributors',		'3215 Lind Ave SW',	'Renton',	'WA',	'98057',	'(206) 808-6000'),
(DEFAULT,	'Beam Suntory',				'2511 152nd Ave NE','Redmond',	'WA',	'98052',	'(425) 883-4075'),
(DEFAULT,	'Columbia Distributing',	'20301 59th S', 	'Kent',		'WA',	'98032',	'(425) 251-9300');

INSERT INTO alcohol 
VALUES
(DEFAULT,   'Aristocrat',      			'gin',          '1000 ml.', 12),
(DEFAULT,   'Aristocrat',       		'rum', 			'1000 ml.', 12), 
(DEFAULT,   'Aristocrat',       		'vodka', 		'1000 ml.', 12),
(DEFAULT,   'Aristocrat',       		'whiskey', 		'1000 ml.', 12),
(DEFAULT,	'Belvino',	        		'Pinot Grigio', '750 ml.',   8),
(DEFAULT,	'Bombay Sapphire',			'gin',			'750 ml.',	 1),
(DEFAULT,	'Bombay Sapphire',			'gin',			'750 ml.',	12),
(DEFAULT,	'Cavit',	        		'Pinot Grigio',	'750 ml.',	 8),
(DEFAULT,	'Coors Light',      		'beer',			'bottle',	24),
(DEFAULT,	'Espolon Blanco',			'tequila',		'750 ml.',   6),
(DEFAULT,	'Espolon Blanco',			'tequila',		'750 ml.',	 1),
(DEFAULT,	'Espolon Repesado',			'tequila',		'750 ml.',	 6),
(DEFAULT,	'Espolon Repesado',			'tequila',		'750 ml.',	 1),
(DEFAULT,	'Excelsior',        		'Cabernet',		'750 ml.',	 8),
(DEFAULT,	'Hamm`s',	        		'beer',			'can',		36),
(DEFAULT,	'House Wine',	    		'Cabernet',		'750 ml.',	 8),
(DEFAULT,	'Jameson',	        		'whiskey',		'750 ml.',	12),
(DEFAULT,	'Jameson',	        		'whiskey',		'750 ml.',	 1),
(DEFAULT,	'Kraken',	       		 	'rum',			'750 ml.',	 6),
(DEFAULT,	'Kraken',	        		'rum',			'750 ml.',	 1),
(DEFAULT,	'Manny`s',	        		'beer',			'half keg',	 1),
(DEFAULT,	'Pabst Blue Ribbon',		'beer',			'can',		36),
(DEFAULT,	'Stone Double Bastard Ale',	'beer',			'pony keg',	 1),
(DEFAULT,	'Tito`s', 					'vodka',		'750 ml.',	12),
(DEFAULT,	'Tito`s', 					'vodka', 		'750 ml.',	 1),
(DEFAULT,	'Tortilla Gold', 			'tequila',		'1000 ml.',	12),
(DEFAULT,	'Tortilla Gold',			'tequila',		'1000 ml.',	 1);

INSERT INTO alcoholdetail
VALUES
(23,	'17-11-22',	1,	1,	'210.93',    5),	
(1,	    '17-9-27',	2,	1,	'32.99',   	 2),
(2, 	'17-9-28',	2,	2,	'30.31',	 2),
(3,	    '17-9-29',	2,	1,	'28.98',	 2),
(4,	    '17-9-30',	2,	1,	'29.72',	 2),
(22,	'17-9-30',	2,	6,	'22.45',	 1),
(11,	'17-9-30',	2,	1,	'28.88',     5),
(7,	    '17-9-30',	2,	1,	'32.18',     2),
(1,		'17-9-7',	3,	1,	'31.44',	 2),
(2,		'17-9-8',	3,	2,	'32.95',	 2),
(3,		'17-9-9',	3,	1,	'25.88',	 2),
(4,		'17-9-10',	3,	1,	'31.61',	 2),
(22,	'17-8-22',	4,	8,	'21.99',	 1),
(11,	'17-8-23',	4,	1,	'26.45',     4),
(1,		'17-8-2',	5,	1,	'31.11',	 2),
(2,		'17-8-2',	5,	2,	'29.81',	 2),
(3,		'17-8-2',	5,	1,	'26.73',	 2),
(4,		'17-8-2',	5,	1,	'28.22',	 2),
(23,	'17-8-1',	6,	1,	'209.53',    1),
(22,	'17-7-31',	7,	6,	'22.45',	 1),
(22,	'17-7-24',	8,	4,	'21.45',	 1),
(22,	'17-7-17',	9,	7,	'23.1',      1),
(22,	'17-7-10',	10,	9,	'20.22',	 3);


INSERT INTO drygoods
VALUES
(DEFAULT,	'Angostura Bitters',				'4 oz.',	1),
(DEFAULT,	'Angostura Bitters',				'4 oz.',	6),
(DEFAULT,	'BAR-PAK 6" Fat Straws BLACK',		'400 ct',	6),
(DEFAULT,	'BAR-PAK 6" Fat Straws NEON',		'400 ct',	6),
(DEFAULT,	'BAR-PAK 5.25" Stir Straws BLACK',	'1000 ct',	10),
(DEFAULT,	'Green Source 2-Ply Dinner Napkins','500 ct',	6),
(DEFAULT,	'ULTRA Soft 1-ply  Dinner Napkins',	'450 ct',	6),
(DEFAULT,	'Bridgegate TO-GO 9" x 6" Hoagie',	'40 ct',	1),
(DEFAULT,	'Bridgegate TO-GO 6" x 6" Square',	'75 ct',	1),
(DEFAULT,   'Clear Creek Toilet Tissue',		'24 ct',	1),
(DEFAULT,	'Simply Value 2-ply Paper Towels',	'72 ct',	6);

INSERT INTO glassware
VALUES
(DEFAULT,	'LIBBEY',	'PINT',					'16 oz.',	18),
(DEFAULT,	'LIBBEY',	'ROCKS',				'12 oz.',	18),
(DEFAULT,	'LIBBEY',	'STEMLESS MARTINI',		'9 oz.',	18),
(DEFAULT,	'LIBBEY',	'MARTINI',				'9 oz.',	18),
(DEFAULT,	'CORE', 	'MASON JAR',			'16 oz.',	12),
(DEFAULT,	'LIBBEY',	'STEMLESS WINE GLASS',	'12 oz.',	12),
(DEFAULT,	'CORE',		'SCHOONER',				'5.5 oz.',	12),
(DEFAULT,	'CORE',		'ROCKS',				'7 oz.',	12),
(DEFAULT,	'LIBBEY',	'GIBRALTER',			'4 oz.',	36),
(DEFAULT,	'CORE',		'PINT',					'16 oz.',	12);

INSERT INTO glassdetail
VALUES
(5,	'17-10-31',	1,	1,	'34.99',		3),
(1,	'17-9-7',	2,	3,	'72.4',			3),
(3,	'17-9-8',	2,  1,  '70.91',		3),
(5,	'17-9-9',   2,	1,	'64.58',		3),
(7,	'17-9-10',	2,	2,	'66.22',		3),
(2,	'17-9-11',	2,	1,	'70.1',			3);

INSERT INTO goodsdetail
VALUES
(11,	'17-10-31',	1,	1,	'25.99',		2),
(2,		'17-10-31',	1,	1,	'19.95',		2),
(3,		'17-9-27',	2,	1,	'45.55',		3),
(5,		'17-9-27',	2,	1,	'36.88',		4);

INSERT INTO orders
VALUES
(DEFAULT,	'17-11-22',	1,		NULL,	NULL),
(DEFAULT,	'17-10-31',	NULL,	1,		   1),
(DEFAULT,	'17-9-27',	2,		2,		NULL),
(DEFAULT,	'17-9-7',	3,		NULL,	   2),
(DEFAULT,	'17-8-22',	4,		NULL,	NULL),
(DEFAULT,	'17-8-2',	5,		NULL,	NULL),
(DEFAULT,	'17-8-2',	6,		NULL,	NULL),
(DEFAULT,  	'17-7-31',	7,      NULL,	NULL),
(DEFAULT,   '17-7-24',	8,      NULL,	NULL),
(DEFAULT,   '17-7-17',	9,      NULL,	NULL),
(DEFAULT,   '17-7-10',	10,     NULL,	NULL);
