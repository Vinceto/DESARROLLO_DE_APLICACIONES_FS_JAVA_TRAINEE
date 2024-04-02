// Define la cantidad de asignaturas
const asignaturas = [
    { nombre: "HTML" },
    { nombre: "CSS" },
    { nombre: "JavaScript" }
  ];
  
  // Crea una fila para cada asignatura
  asignaturas.forEach(asignatura => {
    const fila = document.createElement("tr");
  
    // Crea las celdas de la fila
    const nombreCelda = document.createElement("th");
    nombreCelda.textContent = asignatura.nombre;
    fila.appendChild(nombreCelda);
  
    for (let i = 0; i < 3; i++) {
      const notaCelda = document.createElement("td");
      notaCelda.setAttribute("id", `${asignatura.nombre}${i + 1}`);
      notaCelda.textContent = "-";
      fila.appendChild(notaCelda);
    }
  
    const promedioCelda = document.createElement("td");
    promedioCelda.setAttribute("id", `${asignatura.nombre}Promedio`);
    promedioCelda.textContent = "-";
    fila.appendChild(promedioCelda);
  
    // Agrega la fila a la tabla
    document.querySelector("#notas tbody").appendChild(fila);
  });
  
  // Llenar las notas y promedios dinámicamente
  asignaturas.forEach(asignatura => {
    for (let i = 0; i < 3; i++) {
      const nota = +prompt(`Ingrese la Nota ${i + 1} de ${asignatura.nombre}`);
      document.getElementById(`${asignatura.nombre}${i + 1}`).textContent = nota;
    }
  
    const promedio = (
      (parseInt(document.getElementById(`${asignatura.nombre}1`).textContent) +
        parseInt(document.getElementById(`${asignatura.nombre}2`).textContent) +
        parseInt(document.getElementById(`${asignatura.nombre}3`).textContent)) / 3
    ).toFixed(2);
    document.getElementById(`${asignatura.nombre}Promedio`).textContent = promedio;
  });
  