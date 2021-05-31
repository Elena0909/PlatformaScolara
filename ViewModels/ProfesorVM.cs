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
    class ProfesorVM : BaseVM
    {
       public ProfesorAction profesorAction;

        public ProfesorVM()
        {
            profesorAction = new ProfesorAction(this);
        }

        private ObservableCollection<RubricaNoteVM> catalogNote;
        public ObservableCollection<RubricaNoteVM> CatalogNote
        {
            get
            {
                catalogNote = profesorAction.CatalogNote();
                return catalogNote;
            }
            set
            {
                catalogNote = value;
                NotifyPropertyChanged("CatalogNote");
            }
        }
        private ObservableCollection<RubricaAbsenteVM> catalogAbsente;
        public ObservableCollection<RubricaAbsenteVM> CatalogAbsente
        {
            get
            {
                catalogAbsente = profesorAction.CatalogAbsente();
                return catalogAbsente;
            }
            set
            {
                catalogAbsente = value;
                NotifyPropertyChanged("CatalogAbsente");
            }
        }

        private ObservableCollection<RubricaMediiVM> catalogMedii;
        public ObservableCollection<RubricaMediiVM> CatalogMedii
        {
            get
            {
                catalogMedii = profesorAction.CatalogMedii();
                return catalogMedii;
            }
            set
            {
                catalogMedii = value;
                NotifyPropertyChanged("CatalogMedii");
            }
        }

        private ObservableCollection<ClasaVM> clase;

        public ObservableCollection<ClasaVM> Clase
        {
            get
            {
                clase = profesorAction.Clase();
                return clase;
            }
            set
            {
                clase = value;
                NotifyPropertyChanged("Clase");
            }
        }

        private ObservableCollection<MaterieVM> materii;

        public ObservableCollection<MaterieVM> Materii
        {
            get
            {
                materii = profesorAction.Materii();
                return materii;
            }
            set
            {
                materii = value;
                NotifyPropertyChanged("Materii");
            }
        }

        private ObservableCollection<PersoanaVM> elevi;
        public ObservableCollection<PersoanaVM> Elevi
        {
            get
            {
                elevi = profesorAction.Elevi();
                return elevi;
            }
            set
            {
                elevi = value;
                NotifyPropertyChanged("Elevi");
            }
        }

        private ObservableCollection<bool> teza;
        public ObservableCollection<bool> Teza
        {
            get
            {
                teza = profesorAction.Teza();
                return teza;
            }
            set
            {
                teza = value;
                NotifyPropertyChanged("Teza");
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
                Clase = profesorAction.Clase();
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
                clasa = value;
                Elevi = profesorAction.Elevi();
                Teza = profesorAction.Teza();
            }
        }

        private ObservableCollection<int> semestre;
        public ObservableCollection<int> Semestre
        {
            get
            {
                semestre = Helper.Semestre();
                return semestre;
            }
            set
            {
                semestre = value;
                NotifyPropertyChanged("Semestre");
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

        private ICommand addNota;
        public ICommand AddNota
        {
            get
            {
                if (addNota == null)
                {
                    addNota = new RelayCommand(profesorAction.AddNota);

                }
                return addNota;
            }
        }

        private ICommand deleteNota;
        public ICommand DeleteNota
        {
            get
            {
                if ( deleteNota == null)
                {
                    deleteNota = new RelayCommand(profesorAction.DeleteNota);

                }
                return deleteNota;
            }
        }

        private ICommand addAbsenta;
        public ICommand AddAbsenta
        {
            get
            {
                if (addAbsenta == null)
                {
                    addAbsenta = new RelayCommand(profesorAction.AddAbsenta);

                }
                return addAbsenta;
            }
        }

        private ICommand motiveaza;
        public ICommand Motiveaza
        {
            get
            {
                if (motiveaza == null)
                {
                    motiveaza = new RelayCommand(profesorAction.Motivare);

                }
                return motiveaza;
            }
        }

        private ICommand calculMedie;
        public ICommand CalculMedie
        {
            get
            {
                if (calculMedie == null)
                {
                    calculMedie = new RelayCommand(profesorAction.CalculMedie);

                }
                return calculMedie;
            }
        }

       
    }
}
