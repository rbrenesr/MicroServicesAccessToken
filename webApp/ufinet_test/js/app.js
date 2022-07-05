function autenticar() {

    const usuario = document.getElementById('usuario').value;
    const pass = document.getElementById('contrasenna').value;

    window.location.href = 'invoice.html'



    $.ajax({
        url: "https://localhost:9002/token",
        type: "POST",
        headers: { Authorization: $ `Bearer ${localStorage.getItem("token")}` },
        data: JSON.stringify({
            'user': 'admin',
            'password': 'password',
            'grant_type': 'password'
        }),
        error: function(err) {
            switch (err.status) {
                case "400":
                    // bad request
                    console.log(err);
                    break;
                case "401":
                    // unauthorized
                    break;
                case "403":
                    // forbidden
                    break;
                default:
                    //Something bad happened
                    break;
            }
        },
        success: function(data) {
            console.log("Success!");
        }
    });

}