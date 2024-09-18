export function toggleDropdown() {
    const menu = document.querySelector("#dropdown") as HTMLElement;
    menu.setAttribute("style", "display:flex");
    menu.style.display = menu.style.display === "flex" ? "none" : "flex";
}

export function powerDown() {
    const menu = document.querySelector("#dropdown") as HTMLElement;
    menu.style.display = "none";
}

export function sleep() {
    const menu = document.querySelector("#dropdown") as HTMLElement;
    menu.style.display = "none";
}

export function logout() {
    const menu = document.querySelector("#dropdown") as HTMLElement;
    menu.style.display = "none";
}