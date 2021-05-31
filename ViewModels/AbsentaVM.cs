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
    class AbsentaVM : BaseVM
    {
       

        public AbsentaVM()
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
                NotifyPropertyChanged("Nota");
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

    }
}