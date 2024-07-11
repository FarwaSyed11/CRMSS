<%@ Page Language="C#" AutoEventWireup="true" CodeFile="KamiraEventLogin.aspx.cs" Inherits="KamiraCosmetics_KamiraEventLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body {
            font-family: "Poppins", sans-serif;
            font-weight: 500;
            font-size: 243%;
        }
    </style>
</head>

<body>

    <form id="form1" runat="server">
        <div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-12">
                        <img src="images/kamiraLogo.svg" width="40%" style="margin: 25px;">
                    </div>

                    <div class="col-sm-12 ">
                        <div class="text-center m-4">
                            <img src="images/econnectLogo.svg" width="50%" style="padding: 5px">
                        </div>
                    </div>
                    <div class="row m-4">
                        <div class="col-sm-12">
                            <label>
                                Please register to
                                <b>KAMIRA Cosmetics<b />
                            </label>
                        </div>
                        <div class="col-sm-12">
                            <label for="basic-url" class="form-label">Name</label>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id=""><img src="images/user.svg"/></span>
                                <input type="text" class="form-control" id="" placeholder="Enter Your name" aria-describedby=""/>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>
