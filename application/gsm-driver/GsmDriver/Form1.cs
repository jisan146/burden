using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Threading.Tasks;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;
using System.Security.Cryptography;
using System.IO.Ports;
using System.Threading;
using System.Net;

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        private SerialPort _serialPort;
        private void timer1_Tick(object sender, EventArgs e)
        {
            OracleConnection con = new OracleConnection(Properties.Settings.Default.connection_string);

            try
            {

                if (con.State != ConnectionState.Open)
                    con.Open();

                OracleCommand cmd = con.CreateCommand();
                cmd.CommandText = "begin p_sms(:pf,:pf1); end;";

                OracleParameter pf = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);
                OracleParameter pf1 = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);

                cmd.Parameters.Add(pf);
                cmd.Parameters.Add(pf1);
                cmd.ExecuteNonQuery();
                if (pf.Value.ToString()!="0")
                {
                    string number = pf.Value.ToString();
                    string message = pf1.Value.ToString();
                    _serialPort = new SerialPort("COM7", 115200);
                    Thread.Sleep(1000);
                    _serialPort.Open();
                    Thread.Sleep(1000);
                    _serialPort.Write("AT+CMGF=1\r");
                    Thread.Sleep(1000);
                    _serialPort.Write("AT+CMGS=\"" + number + "\"\r\n");
                    Thread.Sleep(1000);
                    _serialPort.Write(message + "\x1A");
                    Thread.Sleep(1000);
                    _serialPort.Close();
                }
              



            }
            catch
            {



            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            this.ControlBox = false;
        }

        private void notifyIcon1_MouseClick(object sender, MouseEventArgs e)
        {
            Show();
            this.WindowState = FormWindowState.Normal;
            notifyIcon1.Visible = false;
        }

        private void Form1_Resize(object sender, EventArgs e)
        {
            if (this.WindowState == FormWindowState.Minimized)
            {
                Hide();
                notifyIcon1.Visible = true;
                notifyIcon1.ShowBalloonTip(1000);
            }
        }
    }
}
