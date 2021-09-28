<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Login - DIDIN - APIs</title>

    <link href="/static/fontawesome5/css/all.min.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />

    <link href="/static/css/loginregister.css" rel="stylesheet" />
    <link href="/static/css/logercustom.min.css" rel="stylesheet" />
</head>

<body class="dark-mode">
    <div class="container">
        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <div class="row">
                    <div class="col-lg-6 d-none d-lg-block abu2">
                        <br /><br /><br /><br />
                        <center>
                            <i id="logoload" class="fas fa-cat" style="
                                        font-size: 234px;
                                        color: white;
                                        text-align: justify;
                                    "></i>
                        </center>
                    </div>
                    <div class="col-lg-6">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-white-900 mb-4" style="font-family: 'Nunito', cursive">
                                    welcome back!
                                </h1>
                            </div>
                            <form class="user" method="post" id="myform" action="/login">
                                <div class="form-group">
                                    <input type="text" name="emailusername" class="
                                                form-control form-control-user
                                            " id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Username or Email or Number" autocomplete="off" required />
                                </div>
                                <div class="form-group">
                                    <input type="password" name="password" class="
                                                form-control form-control-user
                                            " id="exampleInputPassword" placeholder="Password" required />
                                </div>
                                
        <script src='//www.google.com/recaptcha/api.js'></script>
        <div class="g-recaptcha" data-sitekey="6Ld-Ka4aAAAAABHD4HY18sRVrCAfHy9MGHRuRaxc" data-theme="dark" data-type="image" data-size="normal"         data-tabindex="0"></div>
         <br />
                                <button type="submit" id="loading" class="
                                            btn btn-primary btn-user btn-block
                                        ">
                                        Login
                                    </button>
                            </form>
                            <hr />
                            <div class="text-center">
                                <a class="small" href="/changepassword">Forgot Password?</a
                                    >
                                </div>
                                <div class="text-center">
                                    <a class="small" href="/register"
                                        >Create an Account!</a
                                    >
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="/static/js/core/jquery.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#myform").submit(function (e) {
                    var formObj = $(this);
                    var formURL = formObj.attr("action");
                    var formData = new FormData(this);
                    $.ajax({
                        url: formURL,
                        type: "POST",
                        data: formData,
                        contentType: false,
                        cache: false,
                        processData: false,
                        beforeSend: function () {
                            $("button").attr("disabled", "disabled");
                            $("input").attr("disabled", "disabled");
                            $("a").attr("disabled", "disabled");
                            $("#loading").html(
                                '<i class="fas fa-spinner fa-spin"></i> Loading...'
                            );
                        },
                        success: function (data, textStatus, jqXHR) {
                            if (data == "ok") {
                                window.location = "/profile";
                            } else {
                                $("button").removeAttr("disabled", "disabled");
                                $("a").removeAttr("disabled", "disabled");
                                $("input").removeAttr("disabled", "disabled");
                                $("#loading").html("Login");
                                alert(data);
                                $('.form-control-user[name="password"]').val(
                                    ""
                                );
                                grecaptcha.reset(0);
                            }
                        },
                    });
                    e.preventDefault();
                });
            });
        </script>
    </body>
</html>