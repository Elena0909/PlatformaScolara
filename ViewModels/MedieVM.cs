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
    class MedieVM : BaseVM
    {
        public MedieVM()
        {

        }


        private string materie;
        public string Materie
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

       
    }
}
