$(".admin-panel").hide();
$(prew_img).hide();

const urlParams = new URLSearchParams(window.location.search);
const blogId = urlParams.get('blogId');
let stara_slika;

$("#admin-form").submit(async (e) => {
    e.preventDefault();

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
   
   if(data.userInfo.uloga !== "admin"){
    alert("Za uređivanje objave morate biti admin!");
    return;
   }

   sessionStorage.setItem("user_data", JSON.stringify(data));

   const request2 = await fetch(`http://localhost:8080/objava/one/${blogId}`)

   if(!request2.ok){
    alert("Greska prilikom pronalaska objave!");
    window.location.href = "index.html"; 
   }

   const data2 = await request2.json();

   if(data2.Data.length === 0){
    window.location.href="index.html";
   }

   $("#naslov").val(data2.Data[0].Naslov);
   $("#sadrzaj").val(data2.Data[0].Sadrzaj);
   $(`#kategorija option[value=${data2.Data[0].kategorija}]`).attr('selected','selected');
   $(prew_img).attr('src',`./server/posts/${data2.Data[0].Putanja_slike}`);
   stara_slika = data2.Data[0].Putanja_slike;

   $("#login-panel").hide();
   $(".admin-panel").show();
   $(prew_img).show();
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

    if (!naslov || !sadrzaj || (!slika && !stara_slika) || !kategorija) {
        alert("Unesite sve informacije!");
        return;
    }

    const formData = new FormData();
    formData.append("naslov", naslov);
    formData.append("sadrzaj", sadrzaj);
    formData.append("datum_objave", new Date().toISOString().slice(0, 19).replace('T', ' '));
    formData.append("putanja_slike", slika);
    formData.append("kategorija", kategorija);
    formData.append("stara_slika",stara_slika);
    formData.append("idObjava",blogId);

    const request = await fetch('http://localhost:8080/objava/', {
        method: "PUT",
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