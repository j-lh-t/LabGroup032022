using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;

namespace LabGroup
{
    public partial class _0 : System.Web.UI.Page
    {
        private SqlConnection _conn = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            string path = MapPath("App_Data/DB0.mdf");
            _conn.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB; AttachDbFileName=" + path + "; Integrated Security=True;";
            _conn.Open();

            if (Session["tk"] != null) tbTK.Text = Session["tk"].ToString();
            if (Session["tk0"] != null) tbTK0.Text = Session["tk0"].ToString();
            if (Session["email0"] != null) tbEmail0.Text = Session["email0"].ToString();
            if (Session["email1"] != null) tbEmail1.Text = Session["email1"].ToString();

            div_dk.Visible = false;
            div_qmk.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            div_dk.Visible = true;
            div_dn.Visible = false;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            div_dn.Visible = true;
            div_dk.Visible = false;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            div_dn.Visible = false;
            div_qmk.Visible = true;
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            div_dn.Visible = true;
            div_qmk.Visible = false;
        }



        private string send_mail(string email, int type)
        {
            try
            {
                Random rd = new Random();
                string mxn = "M";
                for (int i = 0; i < 2; i += 1)
                    mxn += rd.Next(0, 9).ToString();
                mxn += "-E";
                for (int i = 0; i < 1; i += 1)
                    mxn += rd.Next(0, 9).ToString();
                mxn += "-O";

                MailMessage mess = new MailMessage();
                SmtpClient smtp = new SmtpClient();
                mess.From = new MailAddress("meo.tester.13@gmail.com");
                mess.To.Add(email);
                mess.IsBodyHtml = true;
                if (type == 0)
                {
                    mess.Subject = "Xác nhận email!";
                    mess.Body = "<div style=\" text-align:center\"><h2>Cảm ơn đã đăng ký sử dụng dịch vụ bên chúng tôi!</h2><br/> " +
                                "<p>Mã xác nhận email của bạn: <h1>" + mxn + "</h1></p></div>";
                }
                else
                {
                    mess.Subject = "Quên mật khẩu!";
                    mess.Body = "<div style=\" text-align:center\"><h2>Hãy liên hệ với chúng tôi nếu tình hình tệ hơn nhé!</h2><br/> " +
                                "<p>Mã xác nhận email của bạn: <h1>" + mxn + "</h1></p></div>";
                }
                smtp.Port = 587;
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential("meo.tester.13@gmail.com", "#Xinchaoaido13");
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Send(mess);
                return mxn;
            }
            catch (Exception ex)
            {
                return "";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(tbTK.Text == "" || tbMK.Text == "")
            {
                lError.Text = "Vui lòng điền đủ thông tin!";
                return;
            }


            SqlCommand cmd = new SqlCommand("select count(1) from KHACHHANG where Tai_Khoan = '" + tbTK.Text + "' and Mat_khau = '"+tbMK.Text+"'", _conn);
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            if (count == 0)
            {
                lError.Text = "Tài khoản hoặc mật khẩu không đúng!";
                return;
            }

            Session["tk"] = tbTK.Text;

            Response.Redirect("GioHang.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            //Kiểm tra xem các ô nhập có bị để trống hay không?
            if (tbTK0.Text == "" || tbMK0.Text == "" || tbEmail0.Text == "" || tbXN0.Text == "")
            {
                lError0.Text = "Vui lòng điền đủ thông tin!";
                return;
            }

            //Kiểm tra tên người dùng hoặc email đã tồn tại chưa
            SqlCommand cmd = new SqlCommand("select count(1) from KHACHHANG where Tai_Khoan = '" + tbTK0.Text + "' or Email = '" + tbEmail0.Text + "'", _conn);
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            if (count > 0)
            {
                lError0.Text = "Tài khoản hoặc Email đã tồn tại!";
                return;
            }

            //Kiểm tra mã xác nhận có đúng hay không?
            if (Session["maxn"] == null || Session["maxn"].ToString() == "" || Session["maxn"].ToString() != tbXN0.Text)
            {
                lError0.Text = "Mã xác nhận lỗi! <br/>Hãy kiểm tra lại email của bạn!";
                Session["maxn"] = send_mail(tbEmail0.Text, 0);
                return;
            }
            
            //Cập nhật dữ liệu sau khi thoả mãn các điều kiện
            cmd = new SqlCommand("insert into KHACHHANG(Tai_Khoan,Email,Mat_khau) values ('"+tbTK0.Text+"','"+tbEmail0.Text+"','"+tbMK0.Text+"')",_conn);
            cmd.ExecuteNonQuery();
            _conn.Close();

            Session["tk"] = tbTK0.Text;
            lError0.Text = "Tạo tài khoản thành công!";
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Session["tk0"] = tbTK0.Text;
            Session["email0"] = tbEmail0.Text;

            string mxn = send_mail(tbEmail0.Text,0);
            if (mxn != "") {
                Session["maxn"] = mxn;
                lError0.Text = "Hãy kiểm tra email của bạn!";
                Button5.Enabled = false;
                Button5.Text = "Đã gửi!";
            }
            else { 
                lError0.Text = "Mã xác nhận gặp gián đoạn, hãy thử lại!";
                return;
            }

        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            //Kiểm tra xem các ô nhập có bị để trống hay không?
            if (tbMK1.Text == "" || tbEmail1.Text == "" || tbXN1.Text == "")
            {
                lError1.Text = "Vui lòng điền đủ thông tin!";
                return;
            }

            //Kiểm tra tên người dùng hoặc email đã tồn tại chưa
            SqlCommand cmd = new SqlCommand("select count(1) from KHACHHANG where Email = '" + tbEmail1.Text + "'", _conn);
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            if (count == 0)
            {
                lError1.Text = "Email không tồn tại!";
                return;
            }

            //Kiểm tra mã xác nhận có đúng hay không?
            if (Session["maxn0"] == null || Session["maxn0"].ToString() == "" || Session["maxn0"].ToString() != tbXN1.Text)
            {
                lError1.Text = "Mã xác nhận lỗi! <br/>Hãy kiểm tra lại email của bạn!";
                Session["maxn0"] = send_mail(tbEmail1.Text, 1);
                return;
            }

            //Cập nhật dữ liệu sau khi thoả mãn các điều kiện
            cmd = new SqlCommand("update KHACHHANG set Mat_khau = '"+tbMK1.Text+"' where Email = '"+tbEmail1.Text+"'", _conn);
            cmd.ExecuteNonQuery();

            cmd = new SqlCommand("select Tai_Khoan from KHACHHANG where Email = '" + tbEmail1.Text + "'", _conn);
            Session["tk"] = Convert.ToString(cmd.ExecuteScalar());
            _conn.Close();
            lError.Text = "Cập nhật mật khẩu thành công!";
            div_qmk.Visible = false;
            div_dn.Visible = true;
        }

        protected void Button7_Click(object sender, EventArgs e)
        {

            //Kiểm tra tên người dùng hoặc email đã tồn tại chưa
            SqlCommand cmd = new SqlCommand("select count(1) from KHACHHANG where Email = '" + tbEmail1.Text + "'", _conn);
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            if (count == 0)
            {
                lError1.Text = "Email không tồn tại!";
                return;
            }
            
            Session["email1"] = tbEmail1.Text;
            string mxn = send_mail(tbEmail1.Text,1);
            if (mxn != "")
            {
                Session["maxn"] = mxn;
                lError1.Text = "Hãy kiểm tra email của bạn!";
                Button7.Enabled = false;
                Button7.Text = "Đã gửi!";
            }
            else
            {
                lError1.Text = "Mã xác nhận gặp gián đoạn, hãy thử lại!";
                return;
            }
        }
    }
}