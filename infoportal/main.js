// nav background
let header = document.querySelector("header");

window.addEventListener("scroll", () => {
    header.classList.toggle("shadow", window.scrollY > 0)
})

//Filter
$(document).ready(function () {
    $(".filter-item").click(function () {
        const value = $(this).attr("data-filter");
        if (value == "all"){
            $(".post-box").show("1000")
        } else{
            $(".post-box")
                .not("." + value)
                .hide(1000);
            $(".post-box")
            .filter("." + value)
            .show("1000")
        }
    });
    $(".filter-item").click(function () {
        $(this).addClass("active-filter").siblings().removeClass("active-filter")
    });
});
//fetch all data
$(document).ready( async () => {
    const query = await fetch('http://localhost:8080/objava/all');
    if(!query.ok) return;
    const data = await query.json();
    const post = document.querySelector(".post");
    data.Data.map((objava) => {
        post.innerHTML += 
        `<div class="post-box ${objava.kategorija === "tech" ? "tech" : objava.kategorija === "food" ? "food" : "news"}">
            <img src="./server/posts/${objava.Putanja_slike}" alt="" class="post-img">
            <h2 class="category">${objava.kategorija}</h2>
            <a href="./blogPost.html?blogId=${objava.idobjava}" class="post-title">${objava.Naslov}</a>
            <span class="post-date">${new Date(objava.Datum_objave).toLocaleString()}</span>
            <p class="post-description">${objava.Sadrzaj.substr(0,80)}...</p>
            <div class="profile">
                <img src="images/default-picture.png" alt="" class="profile-img">
                <span class="profile-name">${objava.Ime + " " + objava.Prezime}</span>
            </div>
        </div>`;
    })
    console.log(data)
})