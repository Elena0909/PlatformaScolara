using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using PlatformaScoala.ViewModels;

namespace PlatformaScoala.Views
{
    /// <summary>
    /// Interaction logic for Loging.xaml
    /// </summary>
    public partial class Loging : Window
    {
        public Loging()
        {
            InitializeComponent();
        }

        private void Click_Go(object sender, RoutedEventArgs e)
        {
            string opt = (DataContext as Logare).Log(user.Text, parola.Password).ToString();
            switch (opt)
            {
                case "1":
                    {
                        ElevView elev = new ElevView();
                        elev.Show();
                        break;
                    }
                case "2":
                    {
                        AdminView admin = new AdminView();
                        admin.Show();
                        break;
                    }
                case "3":
                    {
                        ProfView prof = new ProfView();
                        prof.Show();
                        break;
                    }
                case "4":
                    {
                        ProfView prof = new ProfView();
                        prof.Show();
                        break;
                    }
                default:
                    {
                        MessageBox.Show("Date incorecte");
                        break;
                    }
            }
        }
    }
}
