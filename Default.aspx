<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="webapp1.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>KTS - Home</title>
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
            line-height: 1.6;
        }

        .main-content {
            min-height: calc(100vh - 60px);
            padding: 0;
            display: flex;
            flex-direction: column;
        }

        .header {
            background-color: #4A90E2;
            color: white;
            padding: 2rem;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
    .logout-btn {
    position: absolute;
    top: 20px;
    right: 30px;
    background-color: #4A90E2;
    color: #fff;
    border: none;
    border-radius: 4px;
    padding: 8px 18px;
    font-size: 14px;
    cursor: pointer;
    font-weight: bold;
    transition: background 0.2s;
    z-index: 10;
}
.logout-btn:hover {
    background-color: #357ABD;
}
.header {
    position: relative; /* Ensure absolute positioning works for children */
}
        .header-text {
            font-size: 28px;
            font-weight: bold;
            margin: 0;
            font-family: 'Arial Black', Arial, sans-serif;
        }

        .content {
            max-width: 800px;
            margin: 2rem auto;
            padding: 2rem;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .text-section {
            margin-bottom: 2rem;
            padding: 1.5rem;
            background-color: #ffffff;
            border-radius: 6px;
            border-left: 4px solid #4A90E2;
        }

        .text-section label {
            display: block;
            font-size: 18px;
            color: #333;
            line-height: 1.6;
        }

        .footer {
            background-color: #333;
            color: white;
            padding: 10px; /* Reduced padding */
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
            box-sizing: border-box;
            height: auto; /* Adjusted height */
            box-shadow: 0 -2px 4px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column; /* Stack items vertically */
            align-items: center; /* Center items horizontally */
        }

        .footer label {
            color: white;
            font-size: 14px;
            margin-bottom: 5px; /* Add spacing between footer text and visitor counter */
        }

        .visitor-counter {
            font-size: 14px;
            color: #888;
        }

        .visitor-count {
            font-weight: bold;
            color: #4A90E2;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .content {
                margin: 1rem;
                padding: 1rem;
            }

            .header {
                padding: 1rem;
            }

            .header-text {
                font-size: 24px;
            }

            .text-section {
                padding: 1rem;
            }
        }

        /* Animation for content loading */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .content {
            animation: fadeIn 0.5s ease-out;
        }

        /* Hover effects */
        .text-section:hover {
            transform: translateX(5px);
            transition: transform 0.3s ease;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main-content">
            <div class="header">
                <asp:Label ID="header" runat="server" Text="KTSheader" CssClass="header-text"></asp:Label>
                    <asp:Button ID="LogoutButton" runat="server" Text="Logout" CssClass="logout-btn" OnClick="LogoutButton_Click" />

            </div>
            
            <div class="content">
                <asp:Label ID="defaulttext1" runat="server" Visible="false"></asp:Label>
<asp:Label ID="defaulttext2" runat="server" Visible="false"></asp:Label>
            </div>
        </div>

        <div class="footer">
            <asp:Label ID="footer" runat="server" Text="KTSfooter"></asp:Label>
            <div class="visitor-counter">
                Total Visitors: <asp:Label ID="VisitorCountLabel" runat="server" CssClass="visitor-count"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>