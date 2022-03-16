<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="LabGroup.GioHang" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title id="muc" runat="server"></title>
    <style type="text/css">
        body{
            background-color:rgb(225,225,225);
            text-align:center;
        }
        .auto-style1 {
            width: 90%;
            margin:auto;
            display:flex;
            background-color:white;
        }
        .auto-style2{
            width:100%;
        }
        .auto-style2 table{
            width:100%;
        }
        .auto-style2 table td{
            width:16.6%;
            border-style:double;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server" class="auto-style1">
        <div class="auto-style2">
            <hr/>
            <div>
                <table>
                    <tr>
                        <td>TÊN SẢN PHẨM</td>
                        <td>LOẠI SẢN PHẨM</td>
                        <td>ĐƠN GIÁ</td>
                        <td>SỐ LƯỢNG</td>
                        <td>THÀNH TIỀN</td>
                        <td>THAO TÁC</td>
                    </tr>
                </table>
            </div>
            <hr/>
            <div id="sanpham" runat="server">
            </div>
            <hr/>
        </div>
    </form>
</body>
</html>
