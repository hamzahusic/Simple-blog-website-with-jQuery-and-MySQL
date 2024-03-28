$(".admin-panel").hide();
$(prew_img).hide();
$("#logout").hide();

if(sessionStorage.getItem("user_data")){
    $("#logout").show();
}

$("#admin-form").submit(async (e) => {
    e.preventDefault();

    if($(document.activeElement).val() === "logout"){
        sessionStorage.clear();
        window.location.href = "index.html";
    }

    const email = $("#username").val();
    const password = $("#password").val();

   if(!email || !password){
        return;
   }

   const request = await fetch('http://localhost:8080/user/get',{
    method:"POST",
    headers: {
        "Content-Type": "application/json",
    },
    body: JSON.stringify({
        "email" : email,
        "sifra" : password
    })
   })

   if(!request.ok){
    alert("Korisnik ne postoji")
    return;
   }

   const data = await request.json();

   console.log(data);

   sessionStorage.setItem("user_data", JSON.stringify(data));     

   if($(document.activeElement).val() === "login"){
    window.location.href = "index.html";
   }
   else{
        if(data.userInfo.uloga !== "admin"){
            alert("Za dodavanje objava morate biti admin!");
            return;
        }
        else{
            $("#login-panel").hide();
            $(".admin-panel").show();
        }
   }
})

slika.onchange = evt => {
    const [file] = slika.files
    if (file) {
        prew_img.src = URL.createObjectURL(file)
        $(prew_img).show();
    }
}

$("#blog-add").submit(async (e) => {
    e.preventDefault();

    const naslov = $("#naslov").val();
    const sadrzaj = $("#sadrzaj").val();
    const slika = $("#slika").prop('files')[0];
    const kategorija = $("#kategorija").val();

    if (!naslov || !sadrzaj || !slika || !kategorija) {
        alert("Unesite sve informacije!");
        return;
    }

    const formData = new FormData();
    formData.append("naslov", naslov);
    formData.append("sadrzaj", sadrzaj);
    formData.append("datum_objave", new Date().toISOString().slice(0, 19).replace('T', ' '));
    formData.append("putanja_slike", slika);
    formData.append("kategorija", kategorija);
    formData.append("idKorisnik", JSON.parse(sessionStorage.getItem("user_data")).userInfo.idkorisnik);

    const request = await fetch('http://localhost:8080/objava/', {
        method: "POST",
        body: formData
    });

    if (!request.ok) {
        alert("Doslo je do greske");
        return;
    }

    const data = await request.json();
    console.log(data);

    window.location.href = "index.html";    
});
