using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PlatformaScoala.Helpers;
using System.Threading.Tasks;

namespace PlatformaScoala.ViewModels
{
    class ClasaVM : BaseVM
    {
        public ClasaVM()
        {

        }

        private string clasa;

        public string Clasa
        {
            get
            {
                return clasa;
            }
            set
            {
                clasa = value;
                NotifyPropertyChanged("Clasa");
            }
        }

        private SpecializareVM specializare;
        public SpecializareVM Specializare
        {
            get
            {
                return specializare;
            }
            set
            {
                specializare = value;
                NotifyPropertyChanged("Specializare");
            }
        }

        private PersoanaVM dirig;

        public PersoanaVM Dirig
        {
            get
            {
                return dirig;
            }
            set
            {
                dirig = value;
                NotifyPropertyChanged("Dirig");
            }

        }
    }
}
