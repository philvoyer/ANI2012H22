// ANI2012H22_Projectiles.pde
// Exemples d'un système de projectiles avec pooling.
// La technique du pooling permet de réutiliser toujours les mêmes instances de projectiles.

import java.util.Iterator;

// paramètres
int projectileCount = 10;
float projectileSpeed = 250.0;
float projectileRadius = 20.0;

float shootDelay = 0.2f;
float motionSpeed = 125.0f;

// variables
boolean isShooting;

boolean isKeyPressedUp;
boolean isKeyPressedDown;
boolean isKeyPressedLeft;
boolean isKeyPressedRight;

int index;

float velocityX;
float velocityY;

float timeNow;
float timeLast;
float timeElapsed;
float timeDelay;
float timeThreshold;

float shootPositionX;
float shootPositionY;

// Un 'ArrayList' est un type de collection qui est similaire à un tableau à 1 dimension,
// à la différence qu'on peut y ajouter ou enlever des éléments en cours d'exécution.
// La nombre d'éléments dans un 'ArrayList' peut donc changer alors qu'il est fixe avec un tableau.

// collection de projectiles actifs (projectiles rouges)
ArrayList<Projectile> bufferActive;

// collection de projectiles inactifs (projectiles verts)
ArrayList<Projectile> bufferInactive;

// déclaration d'un itérateur de projectiles
// les itérateurs sont des outils pour parcourir des collections séquencielles
// contrairement à une structure itérative (ex. boucle 'for')
Iterator<Projectile> iterator;

Projectile projectile;

void setup()
{
  size(512, 512);
  strokeWeight(2);
  ellipseMode(CENTER);

  isShooting = false;
  timeNow = timeLast = timeElapsed = timeDelay = 0.0f;

  velocityX = 0.0f;
  velocityY = -projectileSpeed;

  timeThreshold = shootDelay;

  // position de départ des projectiles
  shootPositionX = width / 2.0f;
  shootPositionY = height / 3.0f * 2.0f;

  // instancier les deux buffers de projectiles
  bufferActive = new ArrayList<Projectile>();
  bufferInactive = new ArrayList<Projectile>();

  // initialiser les projectiles
  for (index = 0; index < projectileCount; ++index)
  {
    // instanciation du projectile
    projectile = new Projectile();

    // configuration du projectile
    projectile.radius = projectileRadius;
    projectile.isActive = false;

    // ajouter le projectile dans la liste des projectiles inactifs
    bufferInactive.add(projectile);
  }
}

void draw()
{
  background(31);

  // mise à jour des variables en lien avec le temps
  timeNow = millis();
  timeElapsed = (timeNow - timeLast) / 1000.0f;
  timeLast = timeNow;
  timeDelay += timeElapsed;

  // lancer des projectiles si une touche est enfoncée
  if (isShooting == true)
    shoot();

  // obtenir un itérateur pour la collection de projectiles actifs
  iterator = bufferActive.iterator();

  // boucle avec itérateur et un 'while' car présence d'un 'remove' qui modifie la taille de la collection
  while (iterator.hasNext())
  {
    // mettre à jour la transformation dans l'espace
    projectile = iterator.next();
    projectile.positionX += velocityX * timeElapsed;
    projectile.positionY += velocityY * timeElapsed;

    // valider si le projectile est sorti de la fenêtre d'affichage
    if (projectile.positionX < 0 ||
        projectile.positionX > width ||
        projectile.positionY < 0 ||
        projectile.positionY > height)
    {
      // désactiver le projectile
      projectile.isActive = false;

      // supprimer le projectile de la séquence d'itération
      iterator.remove();

      // ajouter le projectile dans la liste des projectiles inactifs
      bufferInactive.add(projectile);
    }
  }

  // afficher les projectiles actifs
  for (index = 0; index < bufferActive.size(); ++index)
  {
    projectile = bufferActive.get(index);
    projectile.render();
  }

  // afficher les projectiles inactifs sur le côté de la scène
  for (index = 0; index < bufferInactive.size(); ++index)
  {
    projectile = bufferInactive.get(index);
    projectile.positionX = projectileRadius;
    projectile.positionY = projectileRadius + projectileRadius * index;
    projectile.render();
  }

  // dessiner un repère visuel pour le point de départ des projectiles (un triangle)
  stroke(0, 0, 63);
  fill(0, 0, 191);
  triangle(shootPositionX - 25, shootPositionY + 35, shootPositionX, shootPositionY, shootPositionX + 25, shootPositionY + 35);

  // déplacement
  if (isKeyPressedUp)
    shootPositionY -= motionSpeed * timeElapsed;
  if (isKeyPressedDown)
    shootPositionY += motionSpeed * timeElapsed;
  if (isKeyPressedLeft)
    shootPositionX -= motionSpeed * timeElapsed;
  if (isKeyPressedRight)
    shootPositionX += motionSpeed * timeElapsed;
}

void shoot()
{
  if (timeDelay > timeThreshold)
  {
    // valider s'il y a au moins un projectile de disponible
    if (bufferInactive.size() > 0)
    {
      // référence sur le projectile
      projectile = bufferInactive.get(0);

      // configuration du projectile
      projectile.positionX = shootPositionX;
      projectile.positionY = shootPositionY;
      projectile.isActive = true;

      // enlever le projectile dans la liste des projectiles inactifs
      bufferInactive.remove(projectile);

      // ajouter le projectile dans la liste des projectiles actifs
      bufferActive.add(projectile);

      timeDelay = 0;
    }
  }
}

void keyPressed()
{
  if (keyCode == UP)
    isKeyPressedUp = true;
  if (keyCode == DOWN)
    isKeyPressedDown = true;
  if (keyCode == LEFT)
    isKeyPressedLeft = true;
  if (keyCode == RIGHT)
    isKeyPressedRight = true;
  if (keyCode == ' ')
    isShooting = true;
}

void keyReleased()
{
  if (keyCode == UP)
    isKeyPressedUp = false;
  if (keyCode == DOWN)
    isKeyPressedDown = false;
  if (keyCode == LEFT)
    isKeyPressedLeft = false;
  if (keyCode == RIGHT)
    isKeyPressedRight = false;
  if (keyCode == ' ')
    isShooting = false;
}

void mousePressed()
{
  isShooting = true;
}

void mouseReleased()
{
  isShooting = false;
}
