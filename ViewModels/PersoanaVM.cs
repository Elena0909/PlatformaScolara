using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PlatformaScoala.Helpers;
using System.Collections.ObjectModel;
using PlatformaScoala.Models.Actions;
using PlatformaScoala.Models;
using PlatformaScoala.Commands;
using System.Windows.Input;

namespace PlatformaScoala.ViewModels
{
    class PersoanaVM : BaseVM
    {

        public PersoanaVM()
        {
          
        }

        #region Data Members
        private string cnp;
        private string nume;
        private string mesaj;
        private string prenume;
        private string specializare;
        private string rol;
        private ClasaVM clasa;
       
        public string CNP
        {
            get
            {
                return cnp;
            }
            set
            {
                cnp = value;
                NotifyPropertyChanged("CNP");
            }

        }

        public string Nume
        {
            get
            {
                return nume;
            }
            set
            {
                nume = value;
                NotifyPropertyChanged("Nume");
            }
        }

        public string Prenume
        {
            get
            {
                return prenume;
            }
            set
            {
                prenume = value;
                NotifyPropertyChanged("Prenume");
            }
        }

        public string Mesaj
        {
            get
            {
                return mesaj;
            }
            set
            {
                mesaj = value;
                NotifyPropertyChanged("Mesaj");
            }
        }

        public string Rol
        {
            get
            {
                return rol;
            }
            set
            {
                rol = value;
                NotifyPropertyChanged("Rol");
            }
        }

        public string Specializare
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

        private string user;

        public string Username
        {
            get
            {
                return user;
            }
            set
            {
                user = value;
                NotifyPropertyChanged("User");
            }
        }

        private string parola;

        public string Parola
        {
            get
            {
                return parola;
            }
            set
            {
                parola = value;
                NotifyPropertyChanged("Parola");
            }
        }
           

    }
    #endregion
}