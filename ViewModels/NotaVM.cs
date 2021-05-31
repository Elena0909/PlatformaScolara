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
    class NotaVM :BaseVM
    {
       

        public NotaVM()
        {

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
                semestru = value;
                NotifyPropertyChanged("Semestru");
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
