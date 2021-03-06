-- Creation des tables et PK

CREATE TABLE Segment
	(indIP      VARCHAR2(11),
	 nomSegment VARCHAR2(20) CONSTRAINT nn_nomSegment NOT NULL,
	 etage NUMBER(2),
	 CONSTRAINT pk_Segment PRIMARY KEY (indIP));

CREATE TABLE Salle
	(nSalle     VARCHAR2(7),
	 nomSalle   VARCHAR2(20) CONSTRAINT nn_nomSalle NOT NULL,
	 nbPoste    NUMBER(2),
	 indIP      VARCHAR2(11),
	 CONSTRAINT pk_salle PRIMARY KEY (nSalle));

CREATE TABLE Poste
	(nPoste     VARCHAR2(7),
	 nomPoste   VARCHAR2(20) CONSTRAINT nn_nomPoste NOT NULL,
	 indIP      VARCHAR2(11),
	 ad         VARCHAR2(3),
	 typePoste  VARCHAR2(9),
	 nSalle     VARCHAR2(7),
	 CONSTRAINT pk_Poste PRIMARY KEY (nPoste),
	 CONSTRAINT ck_ad    CHECK (ad BETWEEN '000' AND '255'));

CREATE TABLE Logiciel
	(nLog       VARCHAR2(5),
	 nomLog     VARCHAR2(20) CONSTRAINT nn_nomLog NOT NULL,
	 dateAch    DATE,
	 version    VARCHAR2(7),
	 typeLog    VARCHAR2(9),
	 prix       NUMBER(6,2),
	 CONSTRAINT pk_Logiciel PRIMARY KEY (nLog),
	 CONSTRAINT ck_prix     CHECK (prix >= 0));

CREATE TABLE Installer
	(nPoste     VARCHAR2(7),
	 nLog       VARCHAR2(5),
	 numIns     NUMBER(5),
	 dateIns    DATE DEFAULT SYSDATE,
	 delai      INTERVAL DAY(5) TO SECOND(2),
	 CONSTRAINT pk_Installer PRIMARY KEY(nPoste,nLog));

CREATE TABLE Types
	(typeLP   VARCHAR2(9), nomType VARCHAR2(20),
	 CONSTRAINT pk_types PRIMARY KEY(typeLP));
