# Desafio_API_Nasa

Este código es un script de Ruby que hace dos cosas:

Crea una página web que muestra las primeras 10 fotos de Marte tomadas por el rover Curiosity.
Cuenta la cantidad de fotos tomadas por cada cámara en el rover Curiosity.
El código comienza importando las bibliotecas uri, net/http y json. 
Estas bibliotecas se utilizan para hacer solicitudes HTTP a la API de la NASA y para analizar la respuesta JSON.

#Se define una función llamada ApiNasa(). 
Esta función toma una URL como entrada y devuelve un objeto JSON como salida. 
El objeto JSON contiene información sobre las fotos de Marte tomadas por el rover Curiosity.

#La siguiente función se llama create_web_page(). 
Esta función toma un objeto JSON como entrada y devuelve un objeto HTML como salida. 
El objeto HTML contiene una lista de las primeras 10 fotos de Marte tomadas por el rover Curiosity.

#La última función se llama photos_count(). 
Esta función toma un objeto JSON como entrada y devuelve un objeto que contiene el nombre de la cámara y la cantidad de fotos para cada cámara.

El código finaliza llamando a las funciones ApiNasa(), create_web_page() y photos_count(). 
La función ApiNasa() hace una solicitud HTTP a la API de la NASA y devuelve un objeto JSON. 

#Como usar el codigo.

Para usar el código, primero debe importar las bibliotecas uri, net/http y json. 

Una vez que haya importadas las bibliotecas, puede ejecutar el código con el comando ruby api_nasa.rb. 
Esto creará una página web llamada index.html en el directorio actual.
La página web mostrará las primeras 10 fotos de Marte tomadas por el rover Curiosity.



