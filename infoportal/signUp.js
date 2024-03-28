$("#admin-form").submit(async (e) => {
    e.preventDefault();

    const name = $("#name").val();
    const lname = $("#lname").val();
    const email = $("#username").val();
    const password = $("#password").val();

   if(!email || !password || !name || !lname){
        alert("Unesite sve informacije!");
        return;
   }

   const request = await fetch('http://localhost:8080/user/add',{
    method:"POST",
    headers: {
        "Content-Type": "application/json",
    },
    body: JSON.stringify({
        "ime" : name,
        "prezime" : lname,
        "email" : email,
        "sifra" : password,
        "uloga" : "in_process"
    })
   })

   if(!request.ok){
    alert("Greška prilikom kreiranja korisnika! Važno : Samo jedan korisnik može koristiti jedan email")
    return;
   }

    window.location.href = "index.html";   
})