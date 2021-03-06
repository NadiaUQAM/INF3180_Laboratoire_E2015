spool /home/votre_code_MS/INF3180/Creation-VentesPleinDeFoin-resultat.txt
set echo on

CREATE TABLE Client
(noClient 		INTEGER,
 nomClient 		VARCHAR(20) 	NOT NULL,
 noTelephone 	VARCHAR(15) 	NOT NULL,
 Constraint pk_noClient PRIMARY KEY (noClient)
)
/
CREATE TABLE Article
(noArticle 		INTEGER,
 description 	VARCHAR(20),
 prixUnitaire 	DECIMAL(10,2)	NOT NULL,
 quantiteEnStock	INTEGER		DEFAULT 0 NOT NULL 
Constraint chk_quantEnStock CHECK (quantiteEnStock >= 0),
Constraint unique_desc UNIQUE (description),
Constraint pk_noArticle PRIMARY KEY (noArticle))
/
CREATE TABLE Commande
(noCommande 	INTEGER,
 dateCommande	DATE			NOT NULL,
 noClient		INTEGER		NOT NULL,
 Constraint pk_noCommande PRIMARY KEY (noCommande),
Constraint fk_noClient FOREIGN KEY 	(noClient) REFERENCES Client(noClient)
)
/
CREATE TABLE LigneCommande
(noCommande 	INTEGER,
 noArticle 		INTEGER,
 quantite 		INTEGER		NOT NULL,
 Constraint chk_quantite CHECK (quantite >= 0),
 Constraint pk_noCmd_noArticle PRIMARY KEY (noCommande, noArticle),
 Constraint fk_noCmd FOREIGN KEY (noCommande) REFERENCES Commande(noCommande),
 Constraint fk_noArticle FOREIGN KEY (noArticle) REFERENCES Article(noArticle)
)
/
CREATE TABLE Livraison
(noLivraison 	INTEGER,
 dateLivraison	DATE			NOT NULL,
Constraint pk_noLivr PRIMARY KEY (noLivraison)
)
/
CREATE TABLE DetailLivraison
(noLivraison 	INTEGER,
 noCommande 	INTEGER,
 noArticle 		INTEGER,
 quantiteLivree	INTEGER		NOT NULL
Constraint chk_QL CHECK (quantiteLivree >= 3),	
Constraint pk_noLivr_noCmd_noArt PRIMARY KEY (noLivraison, noCommande, noArticle),
Constraint fk_noLivr FOREIGN KEY (noLivraison) REFERENCES Livraison(noLivraison),
Constraint fk_noCmd_noArt FOREIGN KEY (noCommande, noArticle) REFERENCES LigneCommande(noCommande, noArticle)
)
/

alter table Article
disable CONSTRAINT unique_desc;

alter table Article
enable CONSTRAINT unique_desc;

alter table Article
drop CONSTRAINT unique_desc;

alter table Article
add CONSTRAINT unique_desc UNIQUE (description);


set echo off
spool off
