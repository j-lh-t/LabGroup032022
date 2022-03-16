using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace LabGroup
{
    public partial class GioHang : System.Web.UI.Page
    {
        //Khai báo biến kết nối cơ sở dữ liệu
        private SqlConnection _conn = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            // Nếu tài khoản chưa được đăng nhập thì quay về trang đăng nhập và đăng ký
            if(Session["tk"] == null)
            {
                Response.Redirect("DNDK.aspx");
                return;
            }

            // Tiêu đề của trang
            muc.Text = "Giỏ hàng của " + Session["tk"].ToString() + "!";

            // Khởi tạo và mở kết nối tới cơ sở dữ liệu chỉ định
            string path = MapPath("App_Data/DB0.mdf");
            _conn.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB; AttachDbFileName=" + path + "; Integrated Security=True;";
            _conn.Open();

            SqlCommand cmd = new SqlCommand(""+
                "select MATHANG.Ten_Hang, MATHANG.Loai_Hang, MATHANG.Don_Gia, DONHANG.So_Luong "+
                "from DONHANG INNER JOIN MATHANG ON DONHANG.MaHang=MATHANG.MaHang"+
                " where DONHANG.Tai_Khoan='"+ Session["tk"].ToString() + "'",_conn);
            SqlDataReader donhang = cmd.ExecuteReader();

            string table = "<table>";
            try
            {
                if (donhang.HasRows)
                {
                    while(donhang.Read() == true)
                    {
                        table += "<tr>"
                               + "<td>&nbsp;<h3>" + donhang["Ten_Hang"] + "</h3></td>"
                               + "<td>&nbsp;<h3>" + donhang["Loai_Hang"] + "</h3></td>"
                               + "<td>&nbsp;<h3>" + donhang["Don_Gia"] + "</h3></td>"
                               + "<td>&nbsp;<h3>" + donhang["So_Luong"] + "</h3></td>"
                               + "<td>&nbsp;<h3>" + (Convert.ToInt32(donhang["So_Luong"]) * Convert.ToInt32(donhang["Don_Gia"])).ToString() + "</h3></td>"
                               + "<td></td>"
                               + "</tr>";
                    }
                }
                table = "</table>";
            }catch(Exception ex) { }
        }
    }
}