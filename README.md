# crud_firebase

C(create)R(read)U(update)D(delete)-Firebase project.

## Packages used / paquets utilisés

provider: version 6.0.2

http: version 0.13.4

provider package: as used before, the provider package will allow to pass data into the application thanks to :
ChangeNotifierProvider(create version instead of builder version (older)), Multiprovider(providers: []) for others data than products.

Comme utilisé précédemment, le paquet provider permet de transferer / répercuter des données dynamiquement dans l'application grace à :
ChangeNotifierProvider(create version instead of builder version (version antérieure)), Multiprovider(providers: []) pour d'autres data que products.

http package: this package allow to do the transition between Firebase and the application. Most common way to use it is with :
get: for getting data in firebase, post: for sending data to firebase, patch: for updating a product already created (OR put), delete: for deleting a product.

**important:** When you use Firebase (in a real time database), you MUST hide your key (samething for api (Application Programing Interface)) in order no developers steal it and use it against you.
For this, you must create a .gitignore and put your key file in it (samething for google-services.json).

Quand vous utilisez Firebase (en base de donnée temps-réel), vous devez cacher vos clés (même chose pour les api) dans le but qu'aucun dévelopeur puisse la volé et l'utiliser contre vous.
Pour cela, vous devez créé un .gitignore et pointer votre fichier avec vos clés dedans dans le .gitignore (même chose pour google-services.json).


![cap1.png](/images/cap1.png)
![cap2.png](/images/cap2.png)