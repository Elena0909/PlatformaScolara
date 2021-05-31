using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PlatformaScoala.Helpers;
using System.Collections.ObjectModel;

namespace PlatformaScoala.ViewModels
{
    class RubricaNoteVM : BaseVM
    {
        public RubricaNoteVM()
        {

        }

        private ClasaVM clasa;
        private PersoanaVM elev;

        public ClasaVM Clasa
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
        public PersoanaVM Elev
        {
            get
            {
                return elev;
            }
            set
            {
                elev = value;
                NotifyPropertyChanged("Elev");
            }
        }

        private MaterieVM materie;
        public MaterieVM Materie
        {
            get
            {
                return materie;
            }
            set
            {
                materie = value;
                NotifyPropertyChanged("Materie");
            }
        }

        private int nota;

        public int Nota
        {
            get
            {
                return nota;
            }
            set
            {
                nota = value;
                NotifyPropertyChanged("Nota");
            }
        }

        private System.DateTime data;
        public System.DateTime Data
        {
            get
            {
                return data;
            }
            set
            {
                data = value;
                NotifyPropertyChanged("Data");
            }
        }

        private int semestru;
        public int Semestru
        {
            get
            {
                return semestru;
            }
            set
            {
                if (value == 1 || value == 2)
                {
                    semestru = value;
                    NotifyPropertyChanged("Semestru");
                }    
            }
        }

        private bool teza;
        public bool Teza
        {
            get
            {
                return teza;
            }
            set
            {
                teza = value;
                NotifyPropertyChanged("Teza");
            }
        }
    }



}
