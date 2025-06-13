<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="webapp1.admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Control Panel</title>

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
            padding: 20px;
        }


        .admin-container {
            background-color: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: 20px auto;
        }

        .admin-header {
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid #4A90E2;
        }

        .admin-header h1 {
            color: #333;
            margin: 0;
            font-size: 24px;
            font-family: 'Arial Black', Arial, sans-serif;
        }

        .form-group {
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
        }

        .form-group label {
            width: 200px;
            color: #555;
            font-weight: bold;
            padding-right: 20px;
        }

        .form-control {
            flex: 1;
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            transition: border-color 0.2s;
            width: 380px;
        }

        .form-control:focus {
            border-color: #4A90E2;
            outline: none;
            box-shadow: 0 0 0 2px rgba(74, 144, 226, 0.2);
        }

        .button-container {
            margin-top: 2rem;
            padding-top: 1rem;
            border-top: 1px solid #eee;
            text-align: right;
        }

        .btn-save {
            background-color: #4A90E2;
            color: white;
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .btn-save:hover {
            background-color: #357ABD;
        }

        .btn-save:focus {
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
        @media (max-width: 768px) {
            .form-group {
                flex-direction: column;
                align-items: stretch;
            }

            .form-group label {
                width: 100%;
                margin-bottom: 0.5rem;
            }

            .form-control {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="admin-container">
            <div class="admin-header">
                <h1>Admin Control Panel</h1>
            </div>
            
            <div class="form-group">
                <label for="Text1TextBox">Default page text 1</label>
                <asp:TextBox ID="Text1TextBox" runat="server" CssClass="form-control" placeholder="Enter default text 1"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="Text2TextBox">Default page text 2</label>
                <asp:TextBox ID="Text2TextBox" runat="server" CssClass="form-control" placeholder="Enter default text 2"></asp:TextBox>
                
            </div>

            <div class="form-group">
                <label for="HeaderTextBox">Header text</label>
                <asp:TextBox ID="HeaderTextBox" runat="server" CssClass="form-control" placeholder="Enter header text"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="FooterTextBox">Footer text</label>
                <asp:TextBox ID="FooterTextBox" runat="server" CssClass="form-control" placeholder="Enter footer text"></asp:TextBox>
            </div>

            <div class="button-container">
                <asp:Button ID="SaveSettingsButton" runat="server" OnClick="Button1_Click" Text="Save Settings" CssClass="btn-save" />
            </div>
        </div>
     <div class="visitor-counter">
     Total Visitors: <asp:Label ID="VisitorCountLabel" runat="server" CssClass="visitor-count"></asp:Label>
 </div>
    </form>
</body>
</html>