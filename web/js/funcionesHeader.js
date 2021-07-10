/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/*! jQuery v3.3.1 | (c) JS Foundation and other contributors | jquery.org/license */
function Letras(obj) {
    obj = $(obj);
    if (!obj.val().match(/^[a-zA-Z ]+$/) && obj.val().length > 0) {
        alert('Solo se Admite Letras');
        obj.val(obj.val().substr(0, (obj.val().length - 1)));

    }
}
function Numero(obj) {
    obj = $(obj);
    if (!obj.val().match(/^[0-9.]+$/) && obj.val().length > 0) {
        alert('Solo se Admite Numero');
        obj.val(obj.val().substr(0, (obj.val().length - 1)));

    }
}
function validarContrasenia(obj) {
    obj = $(obj);
    if (!obj.val().match(/^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S{8,16}$/) 
            && obj.val().length > 0) {
        alert("Debe de contener entre 8 y 16 caracteres, Minuscula,Mayuscula y caracter especial");
        return;
    }

}
function validarCorreo(obj) {
    obj = $(obj);
    if (!obj.val().match(/^[a-zA-Z0-9\._-]+@[a-zA-Z0-9-]{2,}[.][a-zA-Z]{2,4}$/) && obj.val().length > 0) {
        alert("Ingrese un correo Correcto");
        return;
    }

}

function validarCorreo(obj) {
    obj = $(obj);
    if (!obj.val().match(/^[0-9a-z_\-\.]+@[0-9a-z\-\.]+\.[a-z]{2,4}$/i) && obj.val().length > 0) {
        alert("Ingrese un correo Correcto");
        return;
    }

}
function validarCelular(obj) {
    obj = $(obj);
    if (!obj.val().match(/^([0-9]){9}$/) && obj.val().length > 0) {
        
        alert("Ingrese un Celular Correcto");
        return; 
    }

}
function validarLetrasNumero(obj) {
    obj = $(obj);
    if (!obj.val().match(/[0-9a-zA-Z]+$/) && obj.val().length > 0) {
        
        alert("Solo permite Letras y Nnumeros");
        obj.val(obj.val().substr(0, (obj.val().length - 1)));
        return; 
    }

}

function validarMinMax(obj,min,max) {
    obj = $(obj); 
    if (obj.val().length > 0 && !(obj.val().length < max )) {
        alert("La descripcion no debe superar los "+max + " caracteres.");
        obj.val(obj.val().substr(0, 150));
        return;
    }

}