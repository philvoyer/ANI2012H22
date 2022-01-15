// ANI2012H22_DrawPrimives.pde
// Générer un dessin à partir de primitives vectorielles (ligne, rectangle et ellipse).

// configurer la résolution de la fenêtre d'affichage (nombre de pixels en largeur et en hauteur)
// la largeur et la hauteur de cette fenêtre seront ensuite accessibles avec les variables 'width' et 'height'
size(512, 512);

// configurer la couleur du trait
stroke(63);

// configurer l'épaisseur du trait
strokeWeight(8);

// appeler les fonctions de dessin de différents types de primitives vectorielles
rect   ( 0,       0,        width,   height   );
line   ( 0,       0,        width,   height   );
line   ( 0,       width,    height,  0        );
ellipse( 0,       0,        width/5, height/5 );
ellipse( width,   height,   width/5, height/5 );
ellipse( 0,       height,   width/5, height/5 );
ellipse( width,   0,        width/5, height/5 );
ellipse( width/2, height/2, width/5, height/5 );

// remarquez qu'il est possible d'ajouter des espaces dans les instructions pour ajuster l'alignement de ses composantes
// c'est purement esthétique, ça ne fait pas de différence pour le compilateur

// exporter le contenu de la fenêtre d'affichage dans un fichier image
saveFrame("render.png");
