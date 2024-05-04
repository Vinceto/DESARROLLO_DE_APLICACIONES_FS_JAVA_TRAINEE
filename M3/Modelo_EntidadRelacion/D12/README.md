# M3/D12

Diagrama en Draw.io

describe el modelo entidad relacion donde participan las entidades:
1.- Especialidad (dni, nombre, apellido, direccion)
2.- Medico (codigo_especialidad,nombre,direccion,rut)
3.- Consulta (rut_medico, fecha, hera_aten, n_box, rut_paciente, codigo_licencia)
4.- Licencia (codigo, diagnostico, fecha_inicia, fecha_termino)
5.- Paciente (rut, nombre, direccion)

El Medico representa al profecional del ara de la salud.
La Especialidad representa el área de expertise de un médico
El Paciente representa el sujeto que sufre una enfermedad o dolencia y necesita atención médica
La Consulta representa la instancia donde el paciente explica al medico su problema donde este evalua y entrega un diagnostico
La Licencia representa la recomendacion médica de tomar x dias de descanso y es válida para justificación de inasistencia

PD: pondria un atributo de "diagnostico" de la tabla "Consulta" pues es en esta instancia donde el profecional realiza una hipotesis basada en los sintomas y la categorizacion que se realiza al principio. 

en términos de relaciones:
- un médico tiene una especialidad
- una especialidad puede estar presente en diferentes médicos
- un médico atiende una o mas consultas en su dia
- una consulta fue realizada por 1 medico
- un paciente puede agendar una o mas consultas
- una consulta es solicitada por un paciente
- de una consulta puede generarse una licencia si el medico lo estima conveniente y si el paciente lo solicita
- una licendia puede crearse a partir de una consulta