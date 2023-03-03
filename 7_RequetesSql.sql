-- 1) Quels sont les utilisateurs qui ont combattu au moins 3 fois ?

SELECT utilisateur.pseudonyme
FROM pokemon.utilisateur NATURAL JOIN pokemon.pokemonUtil INNER JOIN pokemon.combat ON pokemonUtil.idPokemonUtil = combat.pokemonUtil 
GROUP BY utilisateur.pseudonyme 
HAVING count(*) >= 3;

-- 2) Quelles espèces n’ont jamais eu d’utilisateur (utilisateur et champion) ?

SELECT pokedex.nomEspece 
FROM pokemon.pokedex except 
(SELECT pokedex.nomEspece 
FROM pokemon.pokedex NATURAL JOIN pokemon.pokemonUtil except 
(SELECT pokedex.nomEspece FROM pokemon.pokedex INNER JOIN  pokemon.champion ON pokedex.nomEspece = champion.pokemonAssocie))
ORDER BY nomEspece;

-- 3) Quels sont les pokemons et leur maitre ayant gagné contre un pokemon de type ‘eau’ ?

SELECT DISTINCT utilisateur.pseudonyme, pokemonUtil.nomEspece AS "Pokemon utilise", pokedex.nomespece AS "Pokemon battu" 
FROM pokemon.utilisateur NATURAL JOIN pokemon.pokemonUtil INNER JOIN pokemon.combat ON pokemonUtil.idPokemonUtil = combat.pokemonUtil INNER JOIN pokemon.champion ON combat.nomChampion = champion.nomChampion INNER JOIN pokemon.pokedex ON champion.pokemonAssocie = pokedex.nomEspece 
WHERE pokedex.type = 'Eau' AND combat.issue = true;

-- 4) Quelles sont les utilisateurs qui n'ont jamais combattu ?

SELECT utilisateur.pseudonyme 
FROM pokemon.utilisateur except 
(SELECT utilisateur.pseudonyme 
FROM pokemon.utilisateur NATURAL JOIN pokemon.pokemonUtil INNER JOIN pokemon.combat ON pokemonUtil.idPokemonUtil = combat.pokemonUtil);

-- 5) Quels sont les utilisateurs ayant combattu le champion “Pierre”  et ayant gagné ?

SELECT utilisateur.pseudonyme 
FROM pokemon.utilisateur NATURAL JOIN pokemon.pokemonUtil INNER JOIN pokemon.combat ON pokemonUtil.idPokemonUtil = combat.pokemonUtil 
WHERE combat.nomChampion ='Pierre' AND combat.issue = true;

-- 6) Quelles sont les utilisateurs qui ont eu un pokémon qui a combattu un pokémon avec la caractéristique shiny ? 

SELECT DISTINCT utilisateur.pseudonyme 
FROM pokemon.utilisateur NATURAL JOIN pokemon.pokemonUtil INNER JOIN pokemon.combat ON pokemonUtil.idPokemonUtil = combat.pokemonUtil INNER JOIN pokemon.champion ON combat.nomChampion = champion.nomChampion 
WHERE champion.shiny = true 
ORDER BY pseudonyme;

-- 7) Quels sont les utilisateurs qui ont un pokémon de type Eau et de niveau supérieur à 15 ?

SELECT utilisateur.pseudonyme, pokedex.nomespece, pokedex.type, pokemonUtil.niveauPokemonUtil 
FROM pokemon.utilisateur NATURAL JOIN pokemon.pokemonUtil NATURAL JOIN pokemon.pokedex 
WHERE pokemonUtil.niveauPokemonUtil >=15 AND pokedex.type ='Eau' 
ORDER BY niveauPokemonUtil;

-- 8) Quelles sont les espèces ayant une puissance minimale de 30 et étant de type Plante ?

SELECT nomEspece, puissance, type 
FROM pokemon.pokedex 
WHERE puissance > 30 AND type='Plante';

-- 9) Quels utilisateurs possèdent au moins un pokémon avec la caractéristique shiny ?

SELECT DISTINCT utilisateur.pseudonyme 
FROM pokemon.utilisateur NATURAL JOIN pokemon.pokemonUtil 
WHERE pokemonUtil.shiny = true;

-- 10) Quels utilisateurs ont déjà perdu au moins une fois ?

SELECT DISTINCT utilisateur.pseudonyme 
FROM pokemon.utilisateur NATURAL JOIN pokemon.pokemonUtil INNER JOIN pokemon.combat ON pokemonUtil.idPokemonUtil = combat.pokemonUtil 
WHERE combat.issue = false;

-- 11) Quels sont les utilisateurs qui sont dans la classe “Montagnard” ?

SELECT utilisateur.pseudonyme
FROM pokemon.utilisateur
WHERE utilisateur.classe = 'Montagnard';

