using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PlatformaScoala.Helpers;
using System.Collections.ObjectModel;

namespace PlatformaScoala.ViewModels
{
    class RubricaAbsenteVM : BaseVM
    {
        public RubricaAbsenteVM()
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

        private bool motivabila;
        public bool Motivabila
        {
            get
            {
                return motivabila;
            }
            set
            {
                motivabila = value;
                NotifyPropertyChanged("Motivabila");
            }
        }

        private bool motivata;
        public bool Motivata
        {
            get
            {
                return motivata;
            }
            set
            {
                motivata = value;
                NotifyPropertyChanged("Motivata");
            }
        }
    }



}

