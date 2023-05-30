let boton= document.getElementById("icono");
let enlaces=    document.getElementById("enlaces");
let contador= 0;

boton.addEventListener("click", function(){
    if(contador== 0){
        enlaces.className   =   ("enlaces dos")
        contador= 1;
    }else{
        enlaces.classList.remove("dos")
        enlaces.className= ("enlaces uno")
        contador= 0;
    }
})
const nombre = document.getElementById("Name")
const email = document.getElementById("Email")
const pass = document.getElementById("Password")
const celular = document.getElementById("Celular")
const form = document-getElementById("form")
const parrafo = document.getElementById("warnings")
form.addEventListener("submit", e=>{
    e.preventDefault()
    if(Nombre.Value.length<6){
        alert("Nombre Muy Corto")
    }
})