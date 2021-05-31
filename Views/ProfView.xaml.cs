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

namespace PlatformaScoala.Views
{

    public partial class ProfView : Window
    {
        public ProfView()
        {
            InitializeComponent();
            if(Helpers.Helper.Diriginte())
            {
                dirig.Visibility = Visibility.Visible;
                dirigA.Visibility = Visibility.Visible;
                dirigM.Visibility = Visibility.Visible;
            }
        }

        private void Dirig_Click(object sender, RoutedEventArgs e)
        {
            DirigView dirig = new DirigView();
            dirig.Show();
            this.Close();
        }
    }
}
