:- op( 800, fx, si ),
	op( 700, xfx, alors ),
	op( 300, xfy, ou ),
	op( 200, xfy, et ).
:- dynamic fait/1.
ch_arriere(X):- est_vrai(X).
est_vrai(X):- fait(X).
est_vrai(X):- si COND alors X, est_vrai(COND).
est_vrai( C1 et C2 ):- est_vrai(C1), est_vrai(C2).
est_vrai( C1 ou C2 ):- est_vrai(C1) ; est_vrai(C2).
ch_avant:-
	si COND alors X,
	not(fait(X)),
	condition_vraie(COND),
	!,
	write('nouveau fait : '), write(X),nl,
	asserta(fait(X)),
	ch_avant.
ch_avant:- write(' La BC est saturee'), nl.
/* condition_vraie/1 : même chose que le prédicat est_vrai/1, mais sans remonter dans les règles à partir des buts */
condition_vraie(C):- fait(C).
condition_vraie(C1 et C2):- condition_vraie(C1), condition_vraie(C2).
condition_vraie(C1 ou C2):- condition_vraie(C1) ; condition_vraie(C2).
/* Règles */
si region(capitale_nationale) alors lieu(quebec).
si region(saguenay) alors lieu(chicoutimi).
si (typeactivite(nautique) ou typeactivite(hivernale)) et budget(moyen) et lieu(quebec) alors activite(aller_au_village_valcartier).
si  (typeactivite(pleinair) ou typeactivite(hivernale)) et budget(petit) et lieu(quebec) alors activite(se_promener_a_la_terrasse_dufferin).
si typeactivite(hivernale) et budget(moyen) et lieu(chicoutimi) alors activite(faire_du_fat_bike_sur_les_monts_valin).
si typeactivite(culturel) et budget(moyen) et lieu(quebec) alors activite(aller_a_l_aquarium_de_quebec).
si typeactivite(culturel) et budget(petit) et lieu(quebec) et saison(ete) alors activite(prendre_une_creme_glace_a_cremerie_de_la_vieille_ecole).
si typeactivite(recreation) et budget(gros) et lieu(quebec) et (personne(6) ou personne(7) ou personne(8)) alors activite(sortir_au_laser_game_evolution).
si activite(faire_du_fat_bike_sur_les_monts_valin) alors preparation(locationdevelo).
si activite(aller_au_village_valcartier) alors preparation(acheter_des_billets).
si activite(aller_a_l_aquarium_de_quebec) alors preparation(acheter_des_billets).
si activite(sortir_au_laser_game_evolution) alors preparation(acheter_des_billets).
si saison(ete) et (typeactivite(pleinair) ou typeactivite(culturel)) alors preparation(mettre_creme_solaire).
si (saison(automne) ou saison(printemps)) alors preparation(apporter_un_parapluie).

/* Base de connaissance */
%fait(typeactivite(recreation)).
%fait(budget(gros)).
%fait(region(capitale_nationale)).
%fait(personne(8)).
%fait(saison(hiver)).




