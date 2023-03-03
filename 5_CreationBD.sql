DROP SCHEMA IF EXISTS pokemon CASCADE;
CREATE SCHEMA pokemon;
SET SEARCH_PATH TO pokemon;



CREATE TABLE pokedex(
        nomEspece Varchar (50) NOT NULL ,
        type      Varchar (50) NOT NULL ,
        puissance Int NOT NULL
	,CONSTRAINT pokedex_PK PRIMARY KEY (nomEspece)
);




CREATE TABLE utilisateur(
        pseudonyme Varchar (50) NOT NULL ,
        classe     Varchar (50) NOT NULL
	,CONSTRAINT utilisateur_PK PRIMARY KEY (pseudonyme)
);



CREATE TABLE champion(
        nomChampion           Varchar (50) NOT NULL ,
        niveauPokemonChampion Int NOT NULL ,
        shiny                 Bool NOT NULL ,
        pokemonAssocie             Varchar (50) NOT NULL
	,CONSTRAINT champion_PK PRIMARY KEY (nomChampion)

	,CONSTRAINT champion_pokedex_FK FOREIGN KEY (pokemonAssocie) REFERENCES pokedex(nomEspece)
);



CREATE TABLE pokemonUtil(
        nomEspece         Varchar (50) NOT NULL ,
        pseudonyme        Varchar (50) NOT NULL ,
        niveauPokemonUtil Int NOT NULL ,
        shiny             Bool NOT NULL ,
		idPokemonUtil	  int NOT NULL 
	,CONSTRAINT pokemonUtil_PK PRIMARY KEY (idPokemonUtil)

	,CONSTRAINT pokemonUtil_pokedex_FK FOREIGN KEY (nomEspece) REFERENCES pokedex(nomEspece)
	,CONSTRAINT pokemonUtil_utilisateur0_FK FOREIGN KEY (pseudonyme) REFERENCES utilisateur(pseudonyme)
);




CREATE TABLE combat(
        pokemonUtil     Int NOT NULL ,
        nomChampion Varchar (50) NOT NULL ,
        issue           Bool NOT NULL ,
        nbCombats       Int NOT NULL
	,CONSTRAINT combat_PK PRIMARY KEY (pokemonUtil, nomChampion, nbCombats)
	,CONSTRAINT combat_pokemonUtil_FK FOREIGN KEY (pokemonUtil) REFERENCES pokemonUtil(idPokemonUtil)
	,CONSTRAINT combat_champion_FK FOREIGN KEY (nomChampion) REFERENCES champion(nomChampion)


);
