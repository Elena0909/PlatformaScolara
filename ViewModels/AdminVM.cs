using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PlatformaScoala.Helpers;
using System.Collections.ObjectModel;
using PlatformaScoala.Models.Actions;
using PlatformaScoala.Commands;
using System.Windows.Input;
using PlatformaScoala.Models;

namespace PlatformaScoala.ViewModels
{
    class AdminVM : BaseVM
    {
        private string nume;
        AdminAction persoanaAction;

        public AdminVM()
        {
            persoanaAction = new AdminAction(this);

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

        private string mesaj;
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

        private ObservableCollection<PersoanaVM> elevi;
        public ObservableCollection<PersoanaVM> Elevi
        {

            get
            {

                elevi = persoanaAction.Elevi();
                return elevi;
            }
            set
            {

                elevi = value;
                NotifyPropertyChanged("Elevi");
            }

        }

        private ObservableCollection<ClasaVM> clase;
        public ObservableCollection<ClasaVM> Clase
        {
            get
            {
                clase = persoanaAction.Clase();
                return clase;
            }
            set
            {
                clase = value;
                NotifyPropertyChanged("Clase");
            }
        }
        private ObservableCollection<SpecializareVM> specializari;
        public ObservableCollection<SpecializareVM> Specializari
        {
            get
            {
                specializari = persoanaAction.Specializari();
                return specializari;
            }
            set
            {
                specializari = value;
                NotifyPropertyChanged("Specializari");
            }
        }



        private ObservableCollection<PersoanaVM> profi;
        public ObservableCollection<PersoanaVM> Profi
        {
            get
            {
                profi = persoanaAction.Profi();
                return profi;
            }
            set
            {

                profi = value;
                NotifyPropertyChanged("Profi");
            }

        }

        private ObservableCollection<PersoanaVM> neDiriginti;
        public ObservableCollection<PersoanaVM> NeDiriginti
        {
            get
            {
                neDiriginti = persoanaAction.NeDiriginti();
                return neDiriginti;
            }
            set
            {

                neDiriginti = value;
                NotifyPropertyChanged("NeDiriginti");
            }

        }

        private ObservableCollection<MaterieVM> materii;

        public ObservableCollection<MaterieVM> Materii
        {
            get
            {
                materii = persoanaAction.Materii();
                return materii;
            }
            set
            {
                materii = value;
                NotifyPropertyChanged("Materii");
            }
        }

        #region Command Members

        //asta este pt butonul Add
        private ICommand addPersoana;
        public ICommand AddPersoana
        {
            get
            {
                if (addPersoana == null)
                {
                    addPersoana = new RelayCommand(persoanaAction.AddPersoana);
                }
                return addPersoana;
            }
        }

        private ICommand addMaterie;
        public ICommand AddMaterie
        {
            get
            {
                if (addMaterie == null)
                {
                    addMaterie = new RelayCommand(persoanaAction.AddMaterie);
                }
                return addMaterie;
            }
        }

        private ICommand addClasa;
        public ICommand AddClasa
        {
            get
            {
                if (addClasa == null)
                {
                    addClasa= new RelayCommand(persoanaAction.AddClasa);
                }
                return addClasa;
            }
        }

        private ICommand updatePersoana;
        public ICommand UpdatePersoana
        {
            get
            {
                if (updatePersoana == null)
                {
                    updatePersoana = new RelayCommand(persoanaAction.UpdatePersoana);
                }
                return updatePersoana;
            }
        }
        private ICommand updateMaterie;
        public ICommand UpdateMaterie
        {
            get
            {
                if (updateMaterie == null)
                {
                    updateMaterie= new RelayCommand(persoanaAction.UpdateMaterie);
                }
                return updateMaterie;
            }
        }

        private ICommand updateClasa;
        public ICommand UpdateClasa
        {
            get
            {
                if (updateClasa == null)
                {
                    updateClasa = new RelayCommand(persoanaAction.UpdateClasa);
                }
                return updateClasa;
            }
        }
        private ICommand deletePersoana;
        public ICommand DeletePersoana
        {
            get
            {
                if (deletePersoana == null)
                {
                    deletePersoana = new RelayCommand(persoanaAction.DeletePersoana);
                }
                return deletePersoana;
            }
        }

        private ICommand deleteMaterie;
        public ICommand DeleteMaterie
        {
            get
            {
                if (deleteMaterie == null)
                {
                    deleteMaterie = new RelayCommand(persoanaAction.DeleteMaterie);
                }
                return deleteMaterie;
            }
        }

        private ICommand deleteClasa;
        public ICommand DeleteClasa
        {
            get
            {
                if (deleteClasa == null)
                {
                    deleteClasa = new RelayCommand(persoanaAction.DeleteClasa);
                }
                return deleteClasa;
            }
        }
        #endregion
    }

}
