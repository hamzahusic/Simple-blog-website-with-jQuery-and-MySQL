let user_data = sessionStorage.getItem("user_data");
  
$("#obrisi_objavu").hide();
$("#uredi_objavu").hide();

if(user_data && JSON.parse(user_data).userInfo.uloga === "admin"){
    $("#obrisi_objavu").show();
    $("#uredi_objavu").show();
}

const urlParams = new URLSearchParams(window.location.search);
const blogId = urlParams.get('blogId');
let ime_slike;
const splitContent = () => {

    const container = document.getElementById("blog-sadrzaj");

    // Split the paragraph into sentences
    let sentences = container.textContent.split(/[.!?]+/);

    // Remove empty strings from the array
    sentences = sentences.filter(sentence => sentence.trim() !== '');

    // Initialize an array to store sections
    let sections = [];

    // Variable to keep track of sentence count
    let sentenceCount = 0;

    // Iterate through sentences and group them into sections
    for (let i = 0; i < sentences.length; i++) {
        // Add current sentence to the current section
        if (!sections[sentenceCount]) {
            sections[sentenceCount] = sentences[i];
        } else {
            sections[sentenceCount] += sentences[i];
        }

        // Check if it's the 5th sentence, if so add <br> tags
        if ((i + 1) % 5 === 0) {
            sections[sentenceCount] += "<br><br>";
        }

        // Move to the next section after every 5th sentence
        if ((i + 1) % 5 === 0) {
            sentenceCount++;
        }
    }

    // Join sections back into a single string
    let separatedParagraph = sections.join("");

    container.innerHTML = separatedParagraph;
}

$(document).ready(async () => {

    // Fetch and display blog content based on parameter value
    if (!blogId) {
        document.getElementById('blogContent').innerHTML = '<h1>No blog ID provided</h1>';
        return;
    }

    const query = await fetch(`http://localhost:8080/objava/one/${blogId}`)

    if(!query.ok){
        document.getElementById('blogContent').innerHTML = '<h1>Error getting blog</h1>';
        return;
    }

    const data = await query.json();

    if(data.Data.length === 0){
        window.location.href="index.html";
    }

    console.log(data);
    ime_slike = data.Data[0].Putanja_slike;
    $('#blog-slika').attr('src', './server/posts/' + data.Data[0].Putanja_slike);
    $("#blog-naslov").text(data.Data[0].Naslov);
    $("#blog-autor").text(data.Data[0].Ime + " " + data.Data[0].Prezime);
    $("#blog-objavljeno").text(new Date(data.Data[0].Datum_objave).toLocaleString());
    $("#blog-sadrzaj").text(data.Data[0].Sadrzaj);
    $("#blog-kategorija").text("#"+data.Data[0].kategorija);
    $("#uredi_objavu").attr('href',`./updateBlog.html?blogId=${blogId}`)
    splitContent();
})

$("#obrisi_objavu").click(async (e) => {

    const query = await fetch(`http://localhost:8080/objava/`,{
        method:"DELETE",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            "idObjava" : blogId,
            "ime_slike" : ime_slike
        })
    })

    if(!query.ok){
        alert("Greška prilikom brisanja objave!");
        return;
    }

    window.location.href = "index.html";
})