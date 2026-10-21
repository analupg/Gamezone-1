
/* ==========================================
   GAMEZONE - MANUAL TÉCNICO E DO USUÁRIO
   JavaScript
   ========================================== */

// Elementos do menu
const menuMobile = document.getElementById("menuMobile");
const menu = document.getElementById("menu");

// Abrir e fechar o menu em telas pequenas
if (menuMobile && menu) {
    menuMobile.addEventListener("click", function () {
        const menuAberto = menu.classList.toggle("aberto");

        menuMobile.setAttribute("aria-expanded", menuAberto);

        menuMobile.textContent = menuAberto ? "✕" : "☰";

        menuMobile.setAttribute(
            "aria-label",
            menuAberto ? "Fechar menu" : "Abrir menu"
        );
    });

    // Fechar o menu depois de clicar em um link
    const linksMenu = menu.querySelectorAll("a");

    linksMenu.forEach(function (link) {
        link.addEventListener("click", function () {
            menu.classList.remove("aberto");

            menuMobile.textContent = "☰";

            menuMobile.setAttribute("aria-expanded", "false");
            menuMobile.setAttribute("aria-label", "Abrir menu");
        });
    });
}


// Atualizar o ano automaticamente no rodapé,
// caso exista um elemento com o ID "anoAtual"
const anoAtual = document.getElementById("anoAtual");

if (anoAtual) {
    anoAtual.textContent = new Date().getFullYear();
}


// Mostrar no console que o JavaScript foi carregado
console.log("Manual GameZone carregado com sucesso! 🎮");
