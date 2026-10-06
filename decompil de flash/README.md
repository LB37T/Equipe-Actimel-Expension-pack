# Équipe Actimel — code AS2 nettoyé

Cette archive contient une **version nettoyée du code ActionScript 2 décompilé** de `Pasted text(4).txt`.

## Ce qui a été fait

- les 5 599 lignes du fichier source ont été conservées dans `raw/engine_decompiled_original.as.txt` ;
- les définitions `_global.X = function()` ont été séparées en fichiers `.as` ;
- l'indentation a été normalisée ;
- les classes sont regroupées par responsabilité : `core`, `player`, `bonuses`, `environment`, `enemies`, `weapons`, `levels` ;
- les associations `Object.registerClass()` sont conservées et regroupées dans `SYMBOL_MAP.md` ;
- aucune logique n'a été volontairement réécrite ou inventée ;
- les noms `_loc2_`, `_loc3_`, etc. restent présents lorsque le décompilateur a perdu le nom original.

## Important

Ce n'est **pas encore un projet Flash compilable complet**. Le jeu dépend aussi de la bibliothèque Flash (MovieClip, symboles `idActiman`, `idZone11`, etc.), des timelines, des assets et des SWF externes comme `fond11.swf`.

La prochaine étape pour obtenir un projet réellement modifiable/compilable est donc de reconstruire la partie FLA/Library autour de ces classes, pas seulement de reformater les `.as`.
