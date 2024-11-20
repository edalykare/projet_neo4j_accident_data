• Caractéristique → Lieu
	MATCH (c:Caracteristique), (l:Lieu)
	WHERE c.Accident_Id = l.Num_Acc
	CREATE (c)-[:A_LIEU]->(l);
	
• Caractéristique → Véhicule
	MATCH (c:Caracteristique), (v:Vehicule)
	WHERE c.Accident_Id = v.Num_Acc
	CREATE (c)-[:IMPLIQUE_VEHICULE]->(v);
	
• Caractéristique → Usager
	MATCH (c:Caracteristique), (u:Usager)
	WHERE c.Accident_Id = u.Num_Acc
	CREATE (c)-[:IMPLIQUE_USAGER]->(u);
	
• Usager → Vehicule
	MATCH (u:Usager), (v:Vehicule)
	WHERE u.id_vehicule = v.id_vehicule AND u.Num_Acc = v.Num_Acc
	CREATE (u)-[:EST_DANS]->(v);
	
• Usager → Lieu
MATCH (u:Usager), (l:Lieu)
WHERE u.Num_Acc = l.Num_Acc
CREATE (u)-[:SE_TROUVE_A]->(l);

	
• Vehicule → Lieu
	• Un usager est dans un véhicule.
	• Relation : (:Usager)-[:EST_DANS]->(:Véhicule)
	MATCH (v:Vehicule), (l:Lieu)
	WHERE v.Num_Acc = l.Num_Acc
CREATE (v)-[:IMPLIQUE_A]->(l);