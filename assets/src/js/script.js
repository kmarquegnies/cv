/*--FIXE LE MENU EN HAUT DE LA PAGE--*/
/*--AJOUTE UN ELEMENT POUR REMONTER EN HAUT DE PAGE--*/

//Récupère le menu dans une variable
var menu = document.getElementsByTagName("nav")[0];

//Récupère la position offset du menu
var fixe = menu.offsetTop;

//Récupère l'icône chevron-haut dans une variable
var topScroll = document.getElementsByClassName("fa-chevron-circle-up")[0];

/*Si la position offset de la page est supérieure ou 
égale à la position offset du menu alors le menu 
obtient la classe fixed qui le rend fixe et 
le faire suivre le srcoll*/

window.addEventListener("scroll", function () {
  if (window.pageYOffset >= fixe) {
    menu.classList.add("fixed");
    topScroll.style.visibility = "visible";
  } else {
    menu.classList.remove("fixed");
    topScroll.style.visibility = "hidden";
  }
});


/*--FAIS APPARAITRE/DISPARAITRE LE TEXTE DES IMAGES LOISIR--*/
function textAppear(number) {
  var text = document.getElementsByClassName("picture_text")[number];
  var pictureBloc = document.getElementsByClassName("picture_animation")[number];
  var picture = document.getElementsByClassName("hobby_picture")[number];

  picture.style.opacity = "0.3";
  text.style.visibility = "visible";
  pictureBloc.addEventListener("mouseout", function () {
    text.style.visibility = "hidden";
    picture.style.opacity = "1";
  });
}


/*--FAIS APPARAITRE/DISPARAITRE L'ADRESSE MAIL--*/
var enveloppe = document.getElementById("envelope");
var mail = document.getElementById("mail");

enveloppe.addEventListener("click", function () {
  if (mail.style.visibility == "visible") {
    mail.style.visibility = "hidden";
  } else {
    mail.style.visibility = "visible";
  }
});


/*--FAIS APPARAITRE LE MENU EN RESPONSIVE--*/
var contentMenu = document.getElementById("menu").innerHTML;
var responsiveMenu = document.getElementById("list_menu");

responsiveMenu.innerHTML = contentMenu;

var menuIcon = document.getElementsByClassName("fa-bars")[0];
var closeicon = document.getElementsByClassName("fa-times")[0];

function menuAppear() {
  if (responsiveMenu.style.display == "block") {
    menuIcon.style.display = "block";
    closeicon.style.display = "none";
    responsiveMenu.style.display = "none";
  } else {
    menuIcon.style.display = "none";
    closeicon.style.display = "block";
    responsiveMenu.style.display = "block";
  }
}