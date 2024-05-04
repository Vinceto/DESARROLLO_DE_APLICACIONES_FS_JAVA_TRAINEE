# M3/D13 y 14

Diagrama en Draw.io

**El primer diagrama describe el modelo entidad relacion donde participan las entidades:
1.- peliculas (id, nombre, anno)
2.- tags (id, nombre)
3.- detalle_pelicula Compra (id, pelicula_id, tag_id)

peliculas representa a una obra audiovisual.
tags representa el sello característico de la pelicula.
detalle_pelicula representa el listado de sellos característicos de cada película


en terminos de relaciones:
- una pelicula tiene tiene uno o muchos detalles de pelicula (como los tags o clasificacion)
- los detalles de pelicula estan presentes en una peliculas
- los tags estan en uno o mas detalles de peliculas
- los detalles de pelicula estan relacionados a un tag



**El segundo diagrama describe el modelo entidad relacion donde participan las entidades:
1.- preguntas (id, pregunta, respuesta correcta)
2.- usuarios (id, nombre, edad)
3.- respuestas (id, respuesta, pregunta_id, usuario_id)

preguntas son un listado establecido de preguntas aleatorias
usuarios es el grupo de personas que contestaran las preguntas
respuestas es la respuesta que dio cada usuario a una pregunta definida

en terminos de relaciones:
- una pregunta tiene muchas respuestas
- una respuesta surge de una pregunta
- un usuario entrega una o muchas respuestas a diferentes preguntas
- una respuesta es brindada por un usuario en particular