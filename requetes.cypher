// liste des véhicules impliqués dans des accidents mortels, en fonction de la gravité des usagers :
MATCH (c:Caracteristique)-[:IMPLIQUE_VEHICULE]->(v:Vehicule)<-[:EST_DANS]-(u:Usager)
WHERE u.grav = 2
RETURN c.Accident_Id AS AccidentID, 
       v.id_vehicule AS VehiculeID, 
       v.catv AS TypeVehicule, 
       u.id_usager AS UsagerID, 
       u.grav AS Gravite
ORDER BY c.Accident_Id;


// dentifier les accidents graves nocturnes impliquant des véhicules particuliers, en analysant les caractéristiques des lieux et en 
// classifiant les types d’usagers (conducteurs, passagers, piétons).

MATCH (c:Caracteristique)-[:IMPLIQUE_VEHICULE]->(v:Vehicule)<-[:EST_DANS]-(u:Usager),
      (c)-[:A_LIEU]->(l:Lieu)
WHERE c.lum IN [3, 4, 5] // Accidents nocturnes (nuit sans éclairage public ou avec)
  AND u.grav IN [3, 4]   // Usagers blessés graves ou hospitalisés
  AND v.catv IN [7, 10]  // Véhicules légers ou utilitaires légers
  AND l.catr IN [1, 2, 3] // Lieux sur autoroute, route nationale ou départementale
RETURN c.Accident_Id AS AccidentID, 
       l.catr AS TypeRoute, 
       v.catv AS TypeVehicule, 
       u.catu AS TypeUsager, 
       u.grav AS Gravite, 
       COUNT(u) AS Nombre_Usagers_Impliques
ORDER BY c.Accident_Id, Nombre_Usagers_Impliques DESC;

// analyser les accidents nocturnes impliquant des véhicules électriques, où au moins un usager 
// est blessé gravement ou tué, et qui se sont produits dans des intersections dangereuses

MATCH (c:Caracteristique)-[:IMPLIQUE_VEHICULE]->(v:Vehicule)<-[:EST_DANS]-(u:Usager), 
      (c)-[:A_LIEU]->(l:Lieu)
WHERE c.lum IN [3, 4, 5]  // Accidents nocturnes (sans ou avec éclairage public)
  AND v.motor = 3          // Véhicules électriques
  AND u.grav IN [2, 3]     // Usager tué (2) ou gravement blessé (3)
  AND l.int IN [2, 3, 4, 6]// Intersections spécifiques (T, X, Y, giratoires)
RETURN c.Accident_Id AS AccidentID,
       c.hrmn AS Heure,
       v.id_vehicule AS VehiculeID,
       v.catv AS TypeVehicule,
       u.id_usager AS UsagerID,
       u.grav AS Gravite,
       l.int AS IntersectionType,
       l.catr AS RouteType
ORDER BY c.hrmn ASC;


// Étudier l’impact des conditions météorologiques sur les accidents graves.
MATCH (c:Caracteristique)-[:IMPLIQUE_VEHICULE]->(v:Vehicule)<-[:EST_DANS]-(u:Usager)
WHERE c.atm IN [2, 3, 4] // Pluie légère, forte, neige
  AND u.grav IN [3, 4]   // Blessés graves ou hospitalisés
RETURN c.atm AS Conditions_Meteo, 
       COUNT(DISTINCT c.Accident_Id) AS Nombre_Accidents,
       COUNT(DISTINCT u.id_usager) AS Nombre_Usagers_Impliques
ORDER BY Nombre_Accidents DESC;
