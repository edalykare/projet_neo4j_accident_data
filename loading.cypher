// Chargement caracteristiques

LOAD CSV WITH HEADERS FROM 'file:///caracteristiques-2022.csv' AS row
FIELDTERMINATOR ';'
CREATE (:Caracteristique {
 Accident_Id: toInteger(row.Accident_Id),
 jour: toInteger(row.jour),
 mois: toInteger(row.mois),
 an: toInteger(row.an),
 hrmn: row.hrmn,
 lum: toInteger(row.lum),
 dep: toInteger(row.dep),
 com: toInteger(row.com),
 agg: toInteger(row.agg),
 int: toInteger(row.int),
 atm: toInteger(row.atm),
 col: toInteger(row.col),
 adr: row.adr,
 lat: row.lat,
 long: row.long
});

// Chargement vehicules
LOAD CSV WITH HEADERS FROM 'file:///vehicules-2022.csv' AS row
FIELDTERMINATOR ';'
CREATE (:Vehicule {
 Num_Acc: toInteger(row.Num_Acc),
 id_vehicule: row.id_vehicule,
 num_veh: row.num_veh,
 senc: toInteger(row.senc),
 catv: toInteger(row.catv),
 obs: toInteger(row.obs),
 obsm: toInteger(row.obsm),
 choc: toInteger(row.choc),
 manv: toInteger(row.manv),
 motor: toInteger(row.motor),
 occutc: row.occutc
});

// Chargement usagers
LOAD CSV WITH HEADERS FROM 'file:///Usagers-2022-cleaned.csv' AS row
FIELDTERMINATOR ';'
CREATE (:Usager {
 Num_Acc: toInteger(row.Num_Acc),
 id_usager: row.id_usager,
 id_vehicule: row.id_vehicule,
 num_veh: row.num_veh,
 place: toInteger(row.place),
 catu: toInteger(row.catu),
 grav: toInteger(row.grav),
 sexe: row.sexe,
 an_nais: toInteger(row.an_nais),
 trajet: toInteger(row.trajet),
 secu1: toInteger(row.secu1),
 secu2: row.secu2,
 secu3: row.secu3,
 locp: row.locp,
 actp: row.actp,
 etatp: row.etatp
});

// Lieux
LOAD CSV WITH HEADERS FROM 'file:///lieux-2022-cleaned.csv' AS row
FIELDTERMINATOR ';'
CREATE (:Lieu {
 Num_Acc: toInteger(row.Num_Acc),
 catr: toInteger(row.catr),
 voie: row.voie,
 v1: toInteger(row.v1),
 v2: row.v2,
 circ: toInteger(row.circ),
 nbv: toInteger(row.nbv),
 vosp: toInteger(row.vosp),
 prof: toInteger(row.prof),
 pr: row.pr,
 pr1: row.pr1,
 plan: toInteger(row.plan),
 lartpc: row.lartpc,
 larrout: row.larrout,
 surf: toInteger(row.surf),
 infra: toInteger(row.infra),
 situ: toInteger(row.situ),
 vma: toInteger(row.vma) 
});