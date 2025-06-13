<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="webapp1.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - KTS</title>
     <script type="text/javascript">
     window.history.forward();
     function preventBack() { window.history.forward(); }
     setTimeout("preventBack()", 0);
     window.onunload = function () { null };
 </script>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .login-container {
            background-color: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        .login-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .login-header h1 {
            color: #333;
            margin: 0;
            font-size: 24px;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #555;
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
            transition: border-color 0.2s;
        }

        .form-control:focus {
            border-color: #4A90E2;
            outline: none;
            box-shadow: 0 0 0 2px rgba(74, 144, 226, 0.2);
        }

        .btn-login {
            background-color: #4A90E2;
            color: white;
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 4px;
            width: 100%;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .btn-login:hover {
            background-color: #357ABD;
        }

        .btn-login:focus {
            outline: none;
            box-shadow: 0 0 0 2px rgba(74, 144, 226, 0.4);
        }

        /* Visitor Counter Styles */
        .visitor-counter {
            position: fixed;
            bottom: 20px;
            left: 0;
            width: 100%;
            text-align: center;
            font-size: 14px;
            color: #888;
        }

        .visitor-count {
            font-weight: bold;
            color: #4A90E2; /* Use your theme color */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <div class="login-header">
                <h1>Welcome Back</h1>
            </div>
            <div class="form-group">
                <label for="UserTextBox">Username</label>
                <asp:TextBox ID="UserTextBox" runat="server" CssClass="form-control" placeholder="Enter your username"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="PassTextBox">Password</label>
                <asp:TextBox ID="PassTextBox" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter your password"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="LoginButton" runat="server" OnClick="Button1_Click" Text="Log In" CssClass="btn-login" />
            </div>
        </div>

        <div class="visitor-counter">
            Total Visitors: <asp:Label ID="VisitorCountLabel" runat="server" CssClass="visitor-count"></asp:Label>
        </div>
    </form>

</body>
</html>