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
using PlatformaScoala.Models;

namespace PlatformaScoala.Views
{
    /// <summary>
    /// Interaction logic for ElevView.xaml
    /// </summary>
    public partial class ElevView : Window
    {
        Grid gridCurent;
        public ElevView()
        {
            InitializeComponent();
            gridCurent = Nota;
        }

        private void Nota_Click(object sender, RoutedEventArgs e)
        {
            gridCurent.Visibility = Visibility.Hidden;
            Nota.Visibility = Visibility.Visible;
            gridCurent = Nota;
        }

        private void Absenta_Click(object sender, RoutedEventArgs e)
        {
            gridCurent.Visibility = Visibility.Hidden;
            Abs.Visibility = Visibility.Visible;
            gridCurent = Abs;
        }

        private void Medii_Click(object sender, RoutedEventArgs e)
        {
            gridCurent.Visibility = Visibility.Hidden;
            Medii.Visibility = Visibility.Visible;
            gridCurent = Medii;
        }
    }
}
