using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PlatformaScoala.Models.Actions;
using PlatformaScoala.Helpers;
using System.Collections.ObjectModel;


namespace PlatformaScoala.ViewModels
{
    class MaterieVM : BaseVM
    {
        public MaterieVM()
        {

        }

        private string denumire;

        public string Denumire
        {
            get
            {
                return denumire;
            }
            set
            {
                denumire = value;
                NotifyPropertyChanged("Denumire");
            }
        }

        private PersoanaVM prof;

        public PersoanaVM Prof
        {
            get
            {
                return prof;
            }
            set
            {
                prof = value;
                NotifyPropertyChanged("Prof");

            }
        }

        private ClasaVM clasa;

        public ClasaVM Clasa
        {
            get
            {
                return clasa;
            }
            set
            {
                clasa=value;
                NotifyPropertyChanged("Clasa");

            }
        }

    }
}
