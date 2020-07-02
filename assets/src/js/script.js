/*--FIXE LE MENU EN HAUT DE LA PAGE--*/
/*--AJOUTE UN ELEMENT POUR REMONTER EN HAUT DE PAGE--*/

//Récupère le menu dans une variable
var menu = document.getElementsByTagName("nav")[0];

//Récupère la position offset du menu
var fixe = menu.offsetTop;

//Récupère l'icône chevron-haut dans une variable
var topScroll = document.getElementsByClassName("fa-chevron-circle-up")[0];

//Récupère la première section de chaque page dans une variable
var aboutSection = document.getElementById("about");
var legalSection = document.getElementById("legal_page");
var sitemapSection = document.getElementById("sitemap")
/*Si la position offset de la page est supérieure ou 
égale à la position offset du menu alors le menu 
obtient la classe fixed qui le rend fixe et 
le faire suivre le srcoll*/

window.addEventListener("scroll", function () {
  if (window.pageYOffset >= fixe) {
    menu.classList.add("fixed");
    topScroll.style.visibility = "visible";
    if (document.getElementById("page_content") != null) {
      aboutSection.style.paddingTop = "calc(4em + 51px)";
    } else {
      if(document.getElementById("legal_page") != null) {
      legalSection.style.paddingTop = "calc(4em + 51px)";
      } else {
        sitemapSection.style.paddingTop = "calc(4em + 51px)";
      }
    }
  } else {
    menu.classList.remove("fixed");
    topScroll.style.visibility = "hidden";
    if (document.getElementById("page_content") != null) {
      aboutSection.style.paddingTop = "4em";
    } else {
      if(document.getElementById("legal_page") != null) {
        legalSection.style.paddingTop = "4em";
        } else {
          sitemapSection.style.paddingTop = "4em";
        }
    }
  }
});

// APPLIQUE UN FOND SUR UN BOUTTON DE LA NAV LORSQUE L'UTILISATEUR EST DANS LA BONNE SECTION
$(window).scroll(function () {
  var tab = $(".overflow");
  var scroll = $(document).scrollTop();
  var footerTopPosition = $("footer").offset().top;
  var footerHeight = $("footer").innerHeight()
  var footer = footerHeight + Math.round(footerTopPosition)
  var windowHeight = $(window).innerHeight()

  if(scroll + windowHeight >= footer) {
    $(".nav_button").parent().removeClass("button_active")
    $("a[href='#contact']").parent().addClass("button_active");
  } else {
    for (var i = 0; i < tab.length; i++) {
      var id = tab.eq(i).attr("id");
      var topPosition = tab.eq(i).offset().top;
      var outerHeight = tab.eq(i).outerHeight()
      
      var padding = parseInt(tab.eq(i).css("padding-top"));
      
      if (scroll > (topPosition - padding) && scroll < (topPosition + outerHeight - padding)) {
        $("a[href='#" + id + "']").parent().addClass("button_active");
      } else {
        $("a[href='#" + id + "']").parent().removeClass("button_active");
      }
    }
  }
})

if (document.getElementById("page_content") != null) {
  /*--FAIS APPARAITRE/DISPARAITRE LE TEXTE DES IMAGES LOISIR--*/
  var pictureBloc = document.getElementsByClassName("picture_animation");

  function showDetails() {
    this.lastElementChild.style.opacity = "0.9";
  }

  function hideDetails() {
    this.lastElementChild.style.opacity = "0";
  }

  for (var i = 0; i < pictureBloc.length; i++) {
    pictureBloc[i].addEventListener('mouseenter', showDetails);
  }

  for (var i = 0; i < pictureBloc.length; i++) {
    pictureBloc[i].addEventListener('mouseleave', hideDetails);
  }


  /*--FAIS APPARAITRE/DISPARAITRE LE TEXTE DES IMAGES REALISATIONS--*/
  $(".project_description").mouseenter(function () {
    $(this).children(".achiev_text").css({
      "opacity": "0.9"
    });
  })

  $(".project_description").mouseleave(function () {
    $(this).children(".achiev_text").css({
      "opacity": "0"
    });
  })


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


  /*--FAIS APPARAITRE LE NOM DES COMPETENCES AU SURVOL--*/
  $(".skill_img").mouseover(function () {
    var langageName = $(this).parent().children(".skill_name");
    langageName.css("visibility", "visible");
  })

  $(".skill_img").mouseout(function () {
    var langageName = $(this).parent().children(".skill_name");
    langageName.css("visibility", "hidden");
  })

}

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