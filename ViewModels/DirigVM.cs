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

namespace PlatformaScoala.ViewModels
{
    class DirigVM : BaseVM
    {
        public DirigAction dirigAction;

        public DirigVM()
        {
            dirigAction = new DirigAction(this);
        }

        private ObservableCollection<RubricaAbsenteVM> catalogAbsente;
        public ObservableCollection<RubricaAbsenteVM> CatalogAbsente
        {
            get
            {
                catalogAbsente = dirigAction.CatalogAbsente();
                return catalogAbsente;
            }
            set
            {
                catalogAbsente = value;
                NotifyPropertyChanged("CatalogAbsente");
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

        private bool nemotivabile;

        public bool Nemotivabile
        {
            get
            {
                return nemotivabile;
            }
            set
            {
                nemotivabile = value;
                CatalogAbsente = dirigAction.CatalogAbsente();
                NrAbsente = dirigAction.NrAbsente();
            }
        }

        private bool nemotivabileElev;

        public bool NemotivabileElev
        {
            get
            {
                return nemotivabileElev;
            }
            set
            {
                nemotivabileElev = value;
                AbsenteElev = dirigAction.AbsenteElev();
                NrAbsenteElev = dirigAction.NrAbsenteElev();
            }
        }


        private int nrAbsente;
        public int NrAbsente
        {
            get
            {
                nrAbsente = dirigAction.NrAbsente();
                return nrAbsente;
            }
            set
            {
                nrAbsente = value;
                NotifyPropertyChanged("NrAbsente");
            }
        }

        private int nrAbsenteElev;
        public int NrAbsenteElev
        {
            get
            {
                nrAbsenteElev = dirigAction.NrAbsenteElev();
                return nrAbsenteElev;
            }
            set
            {
                nrAbsenteElev = value;
                NotifyPropertyChanged("NrAbsenteElev");
            }
        }

        private ObservableCollection<PersoanaVM> elevi;

        public ObservableCollection<PersoanaVM> Elevi
        {
            get
            {
                elevi = dirigAction.Elevi();
                return elevi;
            }
            set
            {
                elevi = value;
                NotifyPropertyChanged("Elevi");
            }
        }

        private PersoanaVM elevCurent;

        public PersoanaVM ElevCurent
        {
            get
            {
                return elevCurent;
            }
            set
            {
                elevCurent = value;
                AbsenteElev = dirigAction.AbsenteElev();
                NrAbsenteElev = dirigAction.NrAbsenteElev();
                MediiElev = dirigAction.MediiElev();
                MedieF = dirigAction.MedieF();
                
            }
        }

        private double medieF;

        public double MedieF
        {
            get
            {
                medieF = dirigAction.MedieF();
                return medieF;
            }
            set
            {
                medieF = value;
                NotifyPropertyChanged("MedieF");
            }
        }

        private ObservableCollection<RubricaAbsenteVM> absenteElev;
        public ObservableCollection<RubricaAbsenteVM> AbsenteElev
        {
            get
            {
                absenteElev = dirigAction.AbsenteElev();
                return absenteElev;
            }
            set
            {
                absenteElev = value;
                NotifyPropertyChanged("AbsenteElev");
            }
        }

        private ObservableCollection<MedieVM> mediiElev;
        public ObservableCollection<MedieVM> MediiElev
        {
            get
            {
                mediiElev= dirigAction.MediiElev();
                return mediiElev;
            }
            set
            {
                mediiElev = value;
                NotifyPropertyChanged("MediiElev");
            }
        }

        private ObservableCollection<RubricaMediiVM> corigenti;
        public ObservableCollection<RubricaMediiVM> Corigenti
        {
            get
            {
                corigenti = dirigAction.Corigenti();
                return corigenti;
            }
            set
            {
                corigenti = value;
                NotifyPropertyChanged("Corigenti");
            }
        }
        private ICommand motiveaza;
        public ICommand Motiveaza
        {
            get
            {
                if (motiveaza == null)
                {
                    motiveaza = new RelayCommand(dirigAction.Motivare);

                }
                return motiveaza;
            }
        }
    }
}
